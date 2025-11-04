# Castelli Source Codes Catalog
*Task 1.1 - Fortran File Inventory*

**Generated**: 2025-11-04
**Location**: `upstream/castelli/source_codes/`

---

## Summary Statistics

- **Total Files**: 68 Fortran (.for) files
- **Total Lines of Code**: 282,000 lines
- **Components**: 12 subdirectories/modules

---

## Component Breakdown

### 1. Hbeta (Hydrogen Beta Line Calculations)
**Files**: 3 | **Directory**: `upstream/castelli/source_codes/Hbeta/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| beta9k2.for | 10,940 | 556K | Main Hbeta computation engine |
| betaodfasctobin.for | 19 | 512B | Binary conversion utility |
| hbeta.for | 263 | 16K | Hbeta wrapper/interface |

**Total**: 11,222 lines

---

### 2. ATLAS12 (Stellar Atmosphere - Enhanced)
**Files**: 4 | **Directory**: `upstream/castelli/source_codes/atlas12/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| atlas12.for | 23,247 | 1.1M | Main ATLAS12 program |
| atlas12_mar12.for | 23,112 | 1.1M | ATLAS12 March 2012 version |
| diatomicspack.for | 263 | 7.5K | Diatomic molecule handling |
| nltelinesasctobin.for | 359 | 18K | NLTE line data converter |

**Total**: 46,981 lines

**Notes**: Two versions of main program present (likely different releases)

---

### 3. ATLAS9 (Stellar Atmosphere - Standard)
**Files**: 2 | **Directory**: `upstream/castelli/source_codes/atlas9/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| atlas9mem.for | 19,763 | 1.1M | ATLAS9 memory-optimized version |
| atlas9v.for | 19,752 | 1.1M | ATLAS9 standard version |

**Total**: 39,515 lines

---

### 4. ATLAS9g (ATLAS9 Variant)
**Files**: 2 | **Directory**: `upstream/castelli/source_codes/atlas9g/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| atlas9mem.for | 20,198 | 1.1M | ATLAS9g memory version |
| atlas9v.for | 20,198 | 1.1M | ATLAS9g standard version |

**Total**: 40,396 lines

**Notes**: Slightly larger than atlas9 (400+ more lines) - variant purpose unclear

---

### 5. DFSYNTHE (Detailed Opacity Synthesis)
**Files**: 10 | **Directory**: `upstream/castelli/source_codes/dfsynthe/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| dfsynthe.for | 3,733 | 144K | Main DFSYNTHE program |
| xnfdf.for | 16,612 | 854K | Large utility (purpose TBD) |
| repackdi.for | 439 | 12K | Repack diatomic data |
| repackhi.for | 354 | 9.5K | Repack high-resolution data |
| repacklow.for | 359 | 9.5K | Repack low-resolution data |
| repacknlte.for | 294 | 15K | Repack NLTE data |
| repackh2o.for | 82 | 2.5K | Repack water vapor data |
| repacktio.for | 74 | 2.0K | Repack TiO data |
| dfsortp.for | 37 | 1.5K | Sorting utility |
| separatedf.for | 22 | 1.0K | Data separation utility |

**Total**: 22,006 lines

**Notes**: Many "repack" utilities suggest data format conversion is common task

---

### 6. KAPPA9 (Opacity Calculations)
**Files**: 2 | **Directory**: `upstream/castelli/source_codes/kappa9/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| kappa9.for | 19,715 | 1.1M | Main opacity calculation engine |
| kapreadts.for | 58 | 3.0K | Opacity data reader |

**Total**: 19,773 lines

---

### 7. kaprossnew (Rosseland Opacity Interpolation)
**Files**: 1 | **Directory**: `upstream/castelli/source_codes/kaprossnew/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| kaprossinterp.for | 30 | 1.0K | Rosseland opacity interpolation |

**Total**: 30 lines

**Notes**: Very small utility - likely standalone tool

---

### 8. linelists (Line List Processing)
**Files**: 1 | **Directory**: `upstream/castelli/source_codes/linelists/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| nltelinesasctobin.for | 335 | 17K | NLTE line list format converter |

**Total**: 335 lines

---

### 9. odfnew (Opacity Distribution Functions)
**Files**: 6 | **Directory**: `upstream/castelli/source_codes/odfnew/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| bigodfasctobin.for | 16 | 512B | Big ODF ASCII to binary |
| bigodfbintoasc.for | 22 | 1.0K | Big ODF binary to ASCII |
| litodfasctobin.for | 16 | 512B | Little ODF ASCII to binary |
| litodfbintoasc.for | 22 | 1.0K | Little ODF binary to ASCII |
| dfinterpbig.for | 22 | 1.0K | Big ODF interpolation |
| dfinterplit.for | 22 | 1.0K | Little ODF interpolation |

**Total**: 120 lines

**Notes**: All tiny utilities for format conversion/interpolation

---

### 10. SYNTHE (Synthetic Spectrum Synthesis)
**Files**: 20 | **Directory**: `upstream/castelli/source_codes/synthe/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| atlas7v.for | 17,336 | 881K | ATLAS7 variant (legacy?) |
| plotpackcol.for | 5,017 | 181K | Plot package (color) |
| plotsynimcol.for | 3,634 | 118K | Synthetic spectrum plotter |
| synthe.for | 2,993 | 114K | Main SYNTHE program |
| plotobsimcol.for | 1,129 | 36K | Observed spectrum plotter |
| rgfalllinesnew.for | 648 | 31K | Read Kurucz/Fall line lists |
| rmolecasc.for | 569 | 12K | Read molecular data (ASCII) |
| rpredict.for | 450 | 13K | Read NIST predicted lines |
| spectrv.for | 438 | 16K | Spectrum utilities |
| rotate.for | 360 | 9.5K | Rotational broadening |
| xnfpelsyn.for | 317 | 12K | Utilities |
| broaden.for | 221 | 6.5K | Line broadening |
| rschwenk.for | 222 | 7.5K | Read Schwenk data |
| rh2ofast.for | 190 | 6.5K | Fast H2O line reader |
| synbeg.for | 133 | 6.0K | SYNTHE initialization |
| mergeplotcol.for | 95 | 4.5K | Merge plot files |
| fluxaverage1a_nmtoa.for | 87 | 2.5K | Flux averaging utility |
| converfsynnmtoa.for | 78 | 3.0K | Wavelength conversion (nm to Å) |
| psplotcol.for | 75 | 3.0K | PostScript plotting |
| ascibinxyatonm.for | 61 | 2.0K | Binary coordinate conversion |

**Total**: 34,052 lines

**Notes**: Largest component by file count. Heavy plotting/visualization emphasis.

---

### 11. SYNTHEg (SYNTHE Variant)
**Files**: 14 | **Directory**: `upstream/castelli/source_codes/syntheg/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| atlas7v.for | 17,507 | 891K | ATLAS7 variant |
| synthe.for | 3,084 | 118K | Main SYNTHE program |
| rgfalllinesnew.for | 705 | 34K | Read line lists |
| rmolecasc.for | 644 | 14K | Read molecular data |
| spectrv.for | 479 | 17K | Spectrum utilities |
| rpredict.for | 466 | 14K | Read predicted lines |
| xnfpelsyn.for | 406 | 16K | Utilities |
| rotate.for | 376 | 10K | Rotational broadening |
| rschwenk.for | 246 | 8.5K | Read Schwenk data |
| broaden.for | 236 | 7.0K | Line broadening |
| rh2ofast.for | 204 | 7.0K | Fast H2O reader |
| synbeg.for | 135 | 6.0K | Initialization |
| fluxaverage1a_nmtoa.for | 90 | 2.5K | Flux averaging |
| converfsynnmtoa.for | 79 | 3.0K | Wavelength conversion |

**Total**: 26,657 lines

**Notes**: Similar structure to synthe/ but without plotting utilities. "g" suffix purpose unclear.

---

### 12. WIDTH (Line Width Calculations)
**Files**: 3 | **Directory**: `upstream/castelli/source_codes/width/`

| Filename | Lines | Size | Description |
|----------|-------|------|-------------|
| width9g.for | 21,555 | 1.2M | WIDTH9 variant g |
| width9.for | 21,139 | 1.2M | WIDTH9 standard |
| inpwidth.for | 218 | 5.5K | WIDTH input processor |

**Total**: 42,912 lines

**Notes**: Large programs comparable to ATLAS9/KAPPA9 in size

---

## Size Rankings (by lines of code)

1. **ATLAS12**: 46,981 lines (16.7%)
2. **width**: 42,912 lines (15.2%)
3. **atlas9g**: 40,396 lines (14.3%)
4. **atlas9**: 39,515 lines (14.0%)
5. **synthe**: 34,052 lines (12.1%)
6. **syntheg**: 26,657 lines (9.5%)
7. **dfsynthe**: 22,006 lines (7.8%)
8. **kappa9**: 19,773 lines (7.0%)
9. **Hbeta**: 11,222 lines (4.0%)
10. **linelists**: 335 lines (0.1%)
11. **odfnew**: 120 lines (0.04%)
12. **kaprossnew**: 30 lines (0.01%)

---

## Key Observations

### Duplicate/Variant Pattern
Several components have multiple versions:
- **ATLAS9**: Standard vs. "g" variant (~1% size difference)
- **ATLAS12**: Two dated versions (likely releases)
- **SYNTHE**: Standard vs. "g" variant (synthe lacks plotting)
- **WIDTH**: Standard vs. "g" variant

**Question for Phase 2**: What does the "g" suffix indicate?

### Code Size Distribution
- **4 "mega-programs"** (>35K lines): ATLAS9, ATLAS12, WIDTH, SYNTHE
- **6 "major components"** (10K-30K lines): atlas9g, syntheg, dfsynthe, kappa9, Hbeta
- **12 "utilities"** (<500 lines): Format converters, interpolators, readers

### Utility Dominance
27 of 68 files (40%) are small utilities, mostly for:
- Binary ↔ ASCII format conversion
- Data file reading/parsing
- Data repacking/reformatting

This suggests **file format archaeology will be critical** for Phase 2.

---

## Task 1.1 Status: ✅ COMPLETE

**Next**: Task 1.2 - Catalog Kurucz source codes
