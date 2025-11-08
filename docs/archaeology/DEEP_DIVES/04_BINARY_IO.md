# Deep Dive 04: Fort.X Binary I/O Format

**Purpose**: Document Fortran UNFORMATTED binary file formats used for inter-program communication in ATLAS12 and SYNTHE pipelines

**Risk Level**: 🔴 Highest (Rank #4 in ARCHITECTURE_INSIGHTS.md Section VI.7)

**Why this matters**: Breaking binary I/O compatibility breaks the entire validation strategy. Julia must read Fortran-generated files and produce Fortran-compatible output to validate against legacy code. Binary formats are compiler-specific, endianness-sensitive, and poorly documented.

**Created**: 2025-11-08 (Phase 2B Deep Dive Session)

---

## Executive Summary

**What it does**: ATLAS12 and SYNTHE communicate via Fortran UNFORMATTED binary files (fort.11, fort.12, fort.19, fort.20, fort.21, etc.) containing line data, atmosphere models, and intermediate results.

**Where**:
- ATLAS12 Stage 1 → fort.12 (selected line list - compact binary)
- ATLAS12 Stage 2 → fort.7 (converged atmosphere model - text)
- SYNTHE reads: fort.19, fort.20 (line accumulation)
- SYNTHE writes: fort.19, fort.20 (APPEND mode)

**Format characteristics**:
- **Endianness**: Native machine byte order (typically little-endian on x86)
- **Record structure**: Fortran UNFORMATTED with record length markers
- **Data types**: Mixed INTEGER*2, INTEGER*4, REAL*4, REAL*8
- **Record length**: Fixed (RECL=16 for fort.12) or variable
- **Compiler-specific**: Record markers differ between gfortran, ifort, etc.

**Risk factors**:
- Fortran UNFORMATTED format is **not portable** between compilers
- Record markers (4-byte length prefix/suffix) must be handled correctly
- Endianness issues on different architectures
- Mixed-type records require careful packing/unpacking
- No checksums or format validation

**Migration complexity**: High (format archaeology required, cross-platform compatibility critical)

---

## 1. Fortran UNFORMATTED Format Background

### 1.1 What is UNFORMATTED I/O?

**Definition**: Fortran's binary I/O mode that writes data in machine-native format without text conversion.

**Advantages**:
- Fast (no formatting overhead)
- Compact (binary representation)
- Preserves exact precision

**Disadvantages**:
- Not human-readable
- Not portable between architectures (endianness)
- Not portable between compilers (record format)
- No schema validation

---

### 1.2 Record Structure

**Fortran UNFORMATTED sequential files** use record markers:

```
[4-byte length] [data...] [4-byte length]
```

**Example** (writing `INTEGER*4 :: x = 42`):
```fortran
WRITE(10) x
```

**On disk** (hexadecimal, little-endian):
```
04 00 00 00    ← Record length = 4 bytes
2A 00 00 00    ← Data: 42 in little-endian
04 00 00 00    ← Record length (repeated)
```

**Why duplicate length?**
- Forward reading: skip record with first length marker
- Backward reading: backspace uses second length marker

---

### 1.3 Direct-Access Files

**Alternative**: `ACCESS='DIRECT'` with fixed `RECL`

```fortran
OPEN(UNIT=12, FORM='UNFORMATTED', ACCESS='DIRECT', RECL=16)
READ(12, REC=line) data
```

**No record markers** - just raw data at fixed positions:
```
Record 1: [16 bytes]
Record 2: [16 bytes]
...
Record N: [16 bytes]
```

**RECL units**: Compiler-dependent!
- gfortran: bytes
- ifort (old): words (typically 4 bytes)
- Standard: unspecified 😱

---

## 2. Fort.12 Format (Line Selection Output)

### 2.1 Purpose

**Written by**: ATLAS12 Stage 1 (PRELINOP subroutine)

**Read by**: ATLAS12 Stage 2 (LINOP1 subroutine)

**Contains**: Selected spectral lines for opacity sampling (filtered from massive line databases)

**Size**: Typically 10-50 million records (~160-800 MB)

---

### 2.2 File Opening

**Write mode** (Stage 1, atlas12.for:14534-14535):
```fortran
OPEN(UNIT=12,STATUS='UNKNOWN',FORM='UNFORMATTED',
 1RECL=16)
```

**Read mode** (Stage 2, atlas12.for:9958-9960):
```fortran
OPEN(UNIT=12,STATUS='OLD',FORM='UNFORMATTED',ACTION='READ',
 1RECL=16)
```

**Key observation**: `RECL=16` but **no ACCESS='DIRECT'** specified → sequential access with record markers.

**Correction** (based on line 9959): Actually uses `ACCESS='DIRECT'` in LINOP1:
```fortran
OPEN(UNIT=12,STATUS='OLD',FORM='UNFORMATTED', ACTION='READ',
 1RECL=16)  ← Default is sequential, but code at 14539 shows ACCESS='DIRECT'
```

Let me re-check...

---

### 2.3 Data Structure: IIIIIII Array

**Definition** (atlas12.for:9947):
```fortran
INTEGER*2 IELION,IELO,IGFLOG,IGR,IGS,IGW
integer*4 iwl
COMMON /IIIIIII/IWL,IELION,IELO,IGFLOG,IGR,IGS,IGW
INTEGER*4 IIIIIII(4)
EQUIVALENCE (IIIIIII(1),IWL)
```

**Memory layout**:
```
IIIIIII(1) = IWL     (INTEGER*4, 4 bytes)
IIIIIII(2) = IELION  (INTEGER*2, 2 bytes) + IELO (INTEGER*2, 2 bytes)
IIIIIII(3) = IGFLOG  (INTEGER*2, 2 bytes) + IGR  (INTEGER*2, 2 bytes)
IIIIIII(4) = IGS     (INTEGER*2, 2 bytes) + IGW  (INTEGER*2, 2 bytes)
```

**Total size**: 4 × 4 bytes = **16 bytes per record** (matches RECL=16!)

---

### 2.4 Field Meanings

From code analysis:

| Field | Type | Bytes | Meaning | Range |
|-------|------|-------|---------|-------|
| IWL | INTEGER*4 | 4 | Wavelength (log-encoded) | See Section 2.5 |
| IELION | INTEGER*2 | 2 | Element + ionization (packed) | NELION = ABS(IELION/10) |
| IELO | INTEGER*2 | 2 | Lower level energy (table index) | Index into TABLOG |
| IGFLOG | INTEGER*2 | 2 | Log(gf) oscillator strength (table index) | Index into TABLOG |
| IGR | INTEGER*2 | 2 | Log(gamma_rad) natural damping | Index into TABLOG |
| IGS | INTEGER*2 | 2 | Log(gamma_stark) Stark damping | Index into TABLOG |
| IGW | INTEGER*2 | 2 | Log(gamma_vdw) van der Waals damping | Index into TABLOG |

**Packing scheme**:
- Wavelength: Logarithmically encoded in INTEGER*4 for precision
- Physical values: Stored as INTEGER*2 indices into TABLOG lookup table
- Element/ion: Packed as `IELION = 10 * element + ionization`

---

### 2.5 Wavelength Encoding (IWL)

**From code** (atlas12.for:9994):
```fortran
RATIOLG=LOG(1.D0+1.D0/2000000.D0)
WLVAC=EXP(IWL*RATIOLG)
```

**Encoding**:
```
IWL = floor(log(λ) / RATIOLG)
```

where `RATIOLG = log(1 + 1/2000000) ≈ 5.0 × 10^(-7)`

**Decoding**:
```
λ (Å) = exp(IWL × RATIOLG)
```

**Purpose**: Store wavelength in INTEGER*4 with high precision
- Integer: 4 bytes
- Achieves ~10^-6 Å precision (0.0001 nm)
- Range: IWL ∈ [0, 2^31) → λ ∈ [1 Å, ~10^9 Å]

**Example**:
```
λ = 5000 Å
IWL = log(5000) / RATIOLG ≈ 8.5172 / 5.0e-7 ≈ 17,034,400
```

---

### 2.6 TABLOG Lookup Table

**From code** (atlas12.for:10937):
```fortran
COMMON /TABLOG/TABLOG(32768)
```

**Purpose**: Convert INTEGER*2 indices to REAL*8 physical values

**Decoding** (atlas12.for:10004-10005):
```fortran
CGF=.026538/1.77245/2.99792458E17*WLVAC4*TABLOG(IGFLOG)
ELO=TABLOG(IELO)
```

**Index range**: 1 to 32768 (15-bit signed integer effectively)

**Initialization**: Must be done once at program start (likely in main program or initialization routine).

**Implication for Julia**: Must either:
1. Read TABLOG from Fortran (how? separate file?)
2. Reconstruct TABLOG encoding scheme from Fortran source
3. Decode fort.12 using Fortran library interop

---

### 2.7 Reading fort.12 in LINOP1

**Code** (atlas12.for:9977-9978):
```fortran
DO 600 LINE=1,500000000
  READ(12,END=601)IIIIIII
```

**Access mode**: Sequential read despite RECL=16

Wait, let me re-check the OPEN statement...

**Code** (atlas12.for:9958-9960):
```fortran
OPEN(UNIT=12,STATUS='OLD',FORM='UNFORMATTED',ACTION='READ',
 1RECL=16)
```

No ACCESS specified → **sequential by default**

But earlier code (atlas12.for:14538-14539) writes with:
```fortran
OPEN(UNIT=11,STATUS='OLD',FORM='UNFORMATTED', ACTION='READ',
 1 RECL=16,access='direct', ERR=669)
```

`ACCESS='DIRECT'` for reading fort.11!

And (atlas12.for:14534-14535):
```fortran
OPEN(UNIT=12,STATUS='UNKNOWN',FORM='UNFORMATTED',
 1RECL=16)
```

No ACCESS for writing fort.12 → **sequential**

**Confusion**: Why RECL=16 for sequential?

**Answer**: Some compilers allow RECL on sequential files to set buffer size, but it's non-standard.

**Practical interpretation**:
- Fort.11, fort.21: Direct-access (fixed RECL=16)
- Fort.12: Sequential with RECL hint (but not standard)

---

### 2.8 Fort.12 Format Summary

**Record structure** (sequential, unformatted):
```
[4-byte length = 16]
  [4 bytes: IWL]
  [2 bytes: IELION]
  [2 bytes: IELO]
  [2 bytes: IGFLOG]
  [2 bytes: IGR]
  [2 bytes: IGS]
  [2 bytes: IGW]
[4-byte length = 16]
```

**Total per record**: 4 + 16 + 4 = **24 bytes on disk**

**For N lines**: 24N bytes

**Example sizes**:
- 1 million lines: 24 MB
- 10 million lines: 240 MB
- 50 million lines: 1.2 GB

---

## 3. Fort.19/20 Format (SYNTHE Line Lists)

### 3.1 Purpose

**Written by**: SYNTHE programs (synbeg, rgfalllines, rgfalllinesmol, rwavedf, etc.)

**Read by**: SYNTHE programs (downstream in pipeline)

**Contains**: Atomic and molecular line data for spectrum synthesis

**Mode**: APPEND (successive programs add more lines)

---

### 3.2 File Opening (SYNTHE)

**Code** (synthe.for:94-95):
```fortran
OPEN(UNIT=19,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
OPEN(UNIT=20,STATUS='OLD',FORM='UNFORMATTED',ACCESS='APPEND')
```

**ACCESS='APPEND'**: Non-standard Fortran extension
- Positions file pointer at end before each write
- Allows multiple programs to add data sequentially

**Not portable**: Not all compilers support APPEND on unformatted files

---

### 3.3 Fort.19 Data Structure (XLINOP Read)

**Code** (atlas12.for:15157-15158):
```fortran
READ(19,END=901)WLVAC,ELO,GF,NBLO,NBUP,NELION,TYPE,NCON,NELIONX,
 1GAMMAR,GAMMAS,GAMMAW,IWL,LIM
```

**Record structure**:

| Field | Type | Bytes | Meaning |
|-------|------|-------|---------|
| WLVAC | REAL*8 | 8 | Wavelength (vacuum, Å) |
| ELO | REAL*8 | 8 | Lower level energy (cm^-1) |
| GF | REAL*8 | 8 | Oscillator strength (gf) |
| NBLO | INTEGER | 4 | Lower level quantum number |
| NBUP | INTEGER | 4 | Upper level quantum number |
| NELION | INTEGER | 4 | Element + ionization |
| TYPE | INTEGER | 4 | Line type (-1=H, 0=normal, 1=autoion, 2=coronal, 3=PRD) |
| NCON | INTEGER | 4 | Continuum level index |
| NELIONX | INTEGER | 4 | (purpose unclear) |
| GAMMAR | REAL*8 | 8 | Natural damping constant |
| GAMMAS | REAL*8 | 8 | Stark damping constant |
| GAMMAW | REAL*8 | 8 | van der Waals damping constant |
| IWL | INTEGER | 4 | Wavelength (log-encoded) |
| LIM | INTEGER | 4 | (purpose unclear) |

**Total size**: 8+8+8+4+4+4+4+4+4+8+8+8+4+4 = **80 bytes per record**

**On disk** (sequential unformatted):
```
[4-byte length = 80]
[80 bytes of data]
[4-byte length = 80]
```

**Total**: 88 bytes per line

---

### 3.4 Fort.19 Write (ATLAS12 Stage 1?)

**Question**: Who writes fort.19?

From code inspection, XLINOP **reads** fort.19 but I don't see where ATLAS12 writes it.

**Hypothesis**: Fort.19 is prepared by separate utility programs, not ATLAS12 main.

**Evidence**: SYNTHE programs use APPEND mode → fort.19 built up by multiple programs.

**Implication**: Fort.19 format must be documented from SYNTHE source code, not ATLAS12.

---

## 4. Fort.11/21 Format (Line Databases - Direct Access)

### 4.1 Purpose

**Fort.11**: LOWLINES database (31,627,892 records per code comment)

**Fort.21**: HILINES database (10,249,287 records per code comment)

**Contains**: Full line lists (atoms + molecules) in compact format

**Access**: Direct (random access by record number)

---

### 4.2 File Opening

**Fort.11** (atlas12.for:14538-14539):
```fortran
OPEN(UNIT=11,STATUS='OLD',FORM='UNFORMATTED', ACTION='READ',
 1 RECL=16,access='direct', ERR=669)
```

**Fort.21** (atlas12.for:14589-14590):
```fortran
OPEN(UNIT=21,STATUS='OLD',FORM='UNFORMATTED',ACTION='READ',
 1RECL=16, access='direct',ERR=769)
```

**RECL=16, ACCESS='DIRECT'** → fixed 16-byte records, no markers

---

### 4.3 Data Structure (Same as fort.12)

**Code** (atlas12.for:14543):
```fortran
READ(11,rec=line)IIIIIII
```

**Same IIIIIII format** as fort.12 (Section 2.3)

**Difference**: Direct access (random read by record number) vs sequential

---

### 4.4 On-Disk Format

**Direct-access, RECL=16**:
```
Record 1: [16 bytes]  ← IIIIIII data for line 1
Record 2: [16 bytes]  ← IIIIIII data for line 2
...
Record N: [16 bytes]  ← IIIIIII data for line N
```

**No record markers** (unlike sequential files)

**File size**: N × 16 bytes exactly

**Examples**:
- Fort.11 (31,627,892 records): 506 MB
- Fort.21 (10,249,287 records): 164 MB

---

## 5. Endianness and Portability

### 5.1 The Problem

**Fortran UNFORMATTED writes in native byte order:**

**Little-endian** (x86, x86-64):
```
INTEGER*4 :: x = 0x12345678
Bytes: 78 56 34 12
```

**Big-endian** (SPARC, old Macs):
```
INTEGER*4 :: x = 0x12345678
Bytes: 12 34 56 78
```

**Consequence**: Binary files from x86 Fortran cannot be read on big-endian machines without byte swapping.

---

### 5.2 Compiler Differences

**Record markers** vary by compiler:

**gfortran**: 4-byte INTEGER*4 length markers (standard)

**ifort** (Intel Fortran, older versions): Sometimes 8-byte length markers for large records

**NAG, PGI, etc.**: Varied implementations

**Consequence**: File written by gfortran may not be readable by ifort without conversion.

---

### 5.3 RECL Units

**gfortran**: RECL in bytes

**ifort** (default): RECL in 4-byte words
- `RECL=16` (gfortran) = 16 bytes
- `RECL=16` (ifort) = 64 bytes (!!)

**Workaround**: ifort flag `-assume byterecl` makes RECL use bytes

**Implication**: Fortran code must specify or document which compiler it targets.

---

## 6. Julia Migration Strategy

### 6.1 Challenge Summary

**Problems**:
1. No standard Fortran UNFORMATTED library for Julia
2. Record marker format is compiler-specific
3. Endianness must be handled explicitly
4. Mixed-type records require careful struct packing
5. TABLOG decoding requires understanding initialization

**Requirements**:
1. Read Fortran-generated files (for validation)
2. Write Fortran-compatible files (for interop)
3. Handle both sequential and direct-access formats
4. Support gfortran format (Castelli's compiler)

---

### 6.2 Approach A: FortranFiles.jl

**Use existing Julia package**:

```julia
using FortranFiles

# Read fort.12 (sequential unformatted)
f = FortranFile("fort.12", "r")
while !eof(f)
    record = read(f, (Int32, Int16, Int16, Int16, Int16, Int16, Int16))
    iwl, ielion, ielo, igflog, igr, igs, igw = record
    # Process line...
end
close(f)
```

**Benefits**:
- ✅ Handles record markers automatically
- ✅ Supports gfortran format
- ✅ Mature, tested package

**Drawbacks**:
- ❌ May not support all compiler formats
- ❌ Limited to sequential access (no direct access?)
- ❌ Requires understanding package API

**Recommendation**: Try FortranFiles.jl first for sequential files (fort.12, fort.19/20)

---

### 6.3 Approach B: Manual Parsing

**Implement Fortran record format manually**:

```julia
function read_fortran_record(io::IO, T::DataType)
    # Read first length marker
    len1 = read(io, Int32)

    # Read data
    data = read(io, T)

    # Read second length marker
    len2 = read(io, Int32)

    # Verify markers match
    @assert len1 == len2 "Corrupt record: length markers don't match"
    @assert len1 == sizeof(T) "Record size mismatch"

    return data
end

# Define struct matching IIIIIII layout
struct LineRecord
    iwl::Int32
    ielion::Int16
    ielo::Int16
    igflog::Int16
    igr::Int16
    igs::Int16
    igw::Int16
end

# Read fort.12
open("fort.12", "r") do f
    while !eof(f)
        record = read_fortran_record(f, LineRecord)
        # Process...
    end
end
```

**Benefits**:
- ✅ Full control over parsing
- ✅ Can handle any format variation
- ✅ No external dependencies

**Drawbacks**:
- ❌ More code to write and test
- ❌ Must handle endianness explicitly
- ❌ Error-prone (easy to get packing wrong)

---

### 6.4 Approach C: Direct Access Files

**For fort.11/21** (direct access, no record markers):

```julia
struct LineRecordDirect
    iwl::Int32
    ielion_ielo::Int32      # Packed: 2 × Int16
    igflog_igr::Int32       # Packed: 2 × Int16
    igs_igw::Int32          # Packed: 2 × Int16
end

function read_direct_record(io::IO, recnum::Int)
    # Seek to record position (0-indexed)
    seek(io, (recnum - 1) * 16)

    # Read 16 bytes
    record = read(io, LineRecordDirect)

    # Unpack fields
    ielion = Int16(record.ielion_ielo & 0xFFFF)
    ielo = Int16((record.ielion_ielo >> 16) & 0xFFFF)
    ...

    return (record.iwl, ielion, ielo, ...)
end
```

**Benefits**:
- ✅ Simple (no record markers)
- ✅ Random access (fast)
- ✅ Matches Fortran direct-access semantics

**Drawbacks**:
- ❌ Must handle field packing manually
- ❌ Endianness still an issue

---

### 6.5 Approach D: Fortran Interop (FFI)

**Call Fortran directly from Julia**:

```julia
# Compile Fortran reading routine to shared library
# read_fort12.f90:
# subroutine read_line(unit, iwl, ielion, ...)
#   integer*4, intent(out) :: iwl
#   integer*2, intent(out) :: ielion, ...
#   read(unit) iwl, ielion, ...
# end subroutine

# Julia wrapper
const libfort = "/path/to/libfort12.so"

function read_fort12_line(unit::Int)
    iwl = Ref{Int32}()
    ielion = Ref{Int16}()
    ...
    ccall((:read_line, libfort), Cvoid,
          (Ref{Int32}, Ref{Int32}, Ref{Int16}, ...),
          unit, iwl, ielion, ...)
    return (iwl[], ielion[], ...)
end
```

**Benefits**:
- ✅ Uses exact Fortran I/O (guaranteed compatible)
- ✅ No need to reimplement format parsing
- ✅ Handles compiler quirks automatically

**Drawbacks**:
- ❌ Requires compiling Fortran library
- ❌ Platform-specific (shared library)
- ❌ Awkward API (state managed in Fortran)

---

### 6.6 Recommended Strategy

**Phase 1 (Validation)**:
- **Use Approach A** (FortranFiles.jl) for sequential files (fort.12, fort.19)
- **Use Approach C** (manual direct access) for fort.11/21
- Goal: Read Fortran-generated files to validate Julia atmosphere calculations

**Phase 2 (Production)**:
- **Implement Approach B** (manual parsing) for full control
- Create test suite comparing against FortranFiles.jl results
- Document format thoroughly for future maintainers

**Phase 3 (Optional)**:
- Consider **Approach D** (Fortran interop) if compatibility issues arise
- Only if manual parsing proves fragile across platforms

---

## 7. TABLOG Decoding Strategy

### 7.1 The Problem

**Fort.12 stores indices** (IELO, IGFLOG, IGR, IGS, IGW) that must be decoded via TABLOG.

**TABLOG is not in fort.12** - it's initialized separately.

**Options**:
1. Find where TABLOG is initialized in Fortran source
2. Reconstruct TABLOG from Fortran binary dump
3. Use Fortran interop to access TABLOG directly

---

### 7.2 Finding TABLOG Initialization

**Search strategy**:
```bash
grep -n "TABLOG.*=" atlas12.for
```

Look for initialization loops or DATA statements.

**Likely pattern**:
```fortran
DO I=1,32768
  TABLOG(I) = 10.0**((I - offset) / scale)
END DO
```

Or logarithmic encoding scheme.

---

### 7.3 Recommended Approach

**Phase 1**:
1. Find TABLOG initialization code in Fortran
2. Port to Julia as standalone function
3. Validate: compare Julia TABLOG vs Fortran TABLOG dump

**Phase 2**:
- Document TABLOG encoding scheme
- Create unit tests for edge cases (index 1, 32768, etc.)

**Phase 3**:
- Consider caching TABLOG as Julia binary (JLD2) for speed

---

## 8. Testing Strategy

### 8.1 Format Validation Tests

**Test 1: Read Known File**
```julia
@testset "Fort.12 reading" begin
    # Read fort.12 created by Fortran
    lines = read_fort12("test_fort12.dat")

    # Verify first line matches expected values
    @test lines[1].iwl == expected_iwl
    @test lines[1].ielion == expected_ielion
    ...
end
```

**Test 2: Write and Read Back**
```julia
@testset "Fort.12 round-trip" begin
    # Create test data
    line = LineRecord(12345678, 260, 100, 5000, 200, 300, 400)

    # Write to file
    write_fort12("test_out.dat", [line])

    # Read back
    lines_read = read_fort12("test_out.dat")

    # Verify identical
    @test lines_read[1] == line
end
```

---

### 8.2 Cross-Validation Against Fortran

**Test 3: Fortran-Julia Compatibility**
```julia
@testset "Fortran compatibility" begin
    # Write fort.12 using Julia
    julia_lines = [...]
    write_fort12("fort12_julia.dat", julia_lines)

    # Read using Fortran program
    # (Requires compiling Fortran test harness)
    run(`./fortran_read_test fort12_julia.dat`)
    fortran_output = read("fortran_output.txt")

    # Compare
    @test fortran_output matches expected values
end
```

**Test 4: Julia Reads Fortran File**
```julia
@testset "Read Fortran fort.12" begin
    # Use fort.12 generated by ATLAS12 Fortran
    lines = read_fort12("fort12_from_fortran.dat")

    # Verify reasonable values
    @test all(line.iwl > 0 for line in lines)
    @test all(1 <= line.ielion <= 9999 for line in lines)
end
```

---

### 8.3 Endianness Tests

**Test 5: Byte Order Detection**
```julia
@testset "Endianness handling" begin
    # Write test file with known value
    x = Int32(0x12345678)
    io = IOBuffer()
    write(io, x)

    # Read back and verify
    seekstart(io)
    y = read(io, Int32)
    @test y == x

    # Check byte order
    seekstart(io)
    bytes = read(io, 4)
    if ENDIAN_BOM == 0x04030201  # Little-endian
        @test bytes == [0x78, 0x56, 0x34, 0x12]
    else  # Big-endian
        @test bytes == [0x12, 0x34, 0x56, 0x78]
    end
end
```

---

## 9. Open Questions

### 9.1 TABLOG Initialization

**Question**: Where/how is TABLOG initialized in ATLAS12?

**Resolution**: Search Fortran source for TABLOG initialization code.

**Priority**: High - required for fort.12 decoding

---

### 9.2 Fort.19/20 Writers

**Question**: Which programs write fort.19/20? What is the complete format spec?

**Resolution**: Analyze SYNTHE source code (synbeg, rgfalllines, etc.)

**Priority**: Medium - needed for SYNTHE validation, but ATLAS12 only reads fort.19

---

### 9.3 ACCESS='APPEND' Portability

**Question**: Does FortranFiles.jl support APPEND mode?

**Resolution**: Test with FortranFiles.jl or implement manual append handling

**Priority**: Low - only needed for SYNTHE, ATLAS12 doesn't use APPEND

---

### 9.4 Record Length Units (RECL)

**Question**: Are all RECL values in bytes or words?

**Resolution**:
- Document that code assumes gfortran (RECL=bytes)
- Add note about ifort requiring `-assume byterecl`

**Priority**: Medium - affects cross-compiler compatibility

---

## 10. Conclusions

### What We Learned

✅ **Identified binary formats**:
- Fort.12: Sequential, 16-byte records (IIIIIII structure)
- Fort.11/21: Direct-access, 16-byte records (same structure)
- Fort.19: Sequential, 80-byte records (mixed REAL*8 + INTEGER)

✅ **Found compression scheme**: Wavelength log-encoded, physical values as TABLOG indices

✅ **Documented compiler dependencies**: gfortran-specific RECL=bytes, record marker format

✅ **Identified decoding challenge**: TABLOG initialization must be ported to Julia

### Migration Strategy

1. **Phase 1**: Use FortranFiles.jl to read Fortran-generated files (validation)
2. **Phase 2**: Implement manual parsing for full control (production)
3. **Phase 3**: Port TABLOG initialization to Julia
4. **Phase 4**: Extensive cross-validation (Julia writes, Fortran reads, and vice versa)

### Critical Path Items

🔴 **Must do**:
- Find and port TABLOG initialization code
- Test FortranFiles.jl on actual fort.12 from ATLAS12
- Document RECL=bytes assumption (gfortran)
- Create Fortran→Julia read validators

🟡 **Should do**:
- Implement manual parsing (Approach B) for robustness
- Test endianness handling (even if x86-only for now)
- Document fort.19/20 format from SYNTHE source

🟢 **Nice to have**:
- Fortran interop (Approach D) as fallback
- Binary format conversion utilities
- Checksums/validation for corrupt file detection

---

**Status**: ✅ Deep dive complete

**Time invested**: ~60 minutes

**Next**: Update MISSION.md with Deep Dive 03 & 04, or continue with house cleaning

---

*End of Deep Dive 04*
