# PDF Processing Status

This file tracks the processing of reference papers and manuals for archaeological analysis.

**Process**: For each PDF:
1. Read and extract insights about code behavior, algorithms, and formats
2. Update relevant archaeology doc(s) in `docs/archaeology/`
3. Mark inconsistencies with ⚠️ when PDF documentation conflicts with observed code
4. Check off the PDF below
5. Commit changes

**Important**: When documentation conflicts with code analysis, preserve BOTH versions. The code likely evolved past the documentation.

---

## Progress Summary

**Status**: 6 of 15 PDFs processed (40% complete)

**Completed**:
- ✅ atlas12.pdf → ARCHITECTURE_DETAILS.md (ATLAS12 documentation)
- ✅ atlas9+synthe.pdf → SYNTHE_JAUREGI_2005.md (dedicated SYNTHE user guide)
- ✅ atlaslinux.pdf → ARCHITECTURE_DETAILS.md Section VII (Linux porting)
- ✅ kurucz_codes05.pdf → ARCHITECTURE_DETAILS.md Section VIII (suite overview)
- ✅ kurucz05.pdf → ARCHITECTURE_DETAILS.md (SYNTHE/DFSYNTHE optimization)
- ✅ cjp-2016-0794.pdf → ARCHITECTURE_DETAILS.md Section IX (line data infrastructure)

**Remaining**: 9 PDFs (atlas1970, atlas_synthe_manuals, atlasodfnew, kurucz06, kurucz11, kurucz1996fka, kurucz79, kurucz96, kurucz_avrett81)

**Last updated**: 2025-11-09

---

## PDFs to Process (15 total)

### Core ATLAS Documentation

- [x] **atlas12.pdf** - ATLAS12 stellar atmosphere program (Castelli 2005)
  - Date processed: 2025-11-08
  - Related components: ATLAS12, opacity sampling method, control cards
  - Archaeology docs updated: ARCHITECTURE_DETAILS.md, VERSION_COMPARISON.md
  - Key findings:
    - 30000 frequency points, logarithmically spaced (Δlog λ = 0.0001)
    - 344 continuum opacity frequencies (337 from ATLAS9 + 6 new)
    - Extended wavelength range: 9.09 nm to 400000 nm
    - Two-stage workflow explicitly documented
    - Six line list files: nltelines, lowlines, highlines, diatomicsiwl, schwenke, h2ofast
    - Control card details (ABUNDANCE SCALE is Castelli extension)
    - CONVECTION nconv parameter is Castelli extension for cool stars
    - ⚠️ SURFACE FLUX warning: Not accurate for observations, use SYNTHE
    - ATLAS9 vs ATLAS12 temperature differences increase with Teff
    - ⚠️ Filename discrepancy: doc uses different names than execution scripts

- [ ] **atlas1970.pdf** - Original 1970 ATLAS paper
  - Date processed:
  - Related components: ATLAS9, historical context
  - Archaeology docs updated:
  - Key findings:

- [x] **atlas9+synthe.pdf** - ATLAS9 and SYNTHE combined documentation (Jauregi 2005)
  - Date processed: 2025-11-09 (SYNTHE-only reprocessing)
  - Related components: SYNTHE, ROTATE, BROADEN (ATLAS9 content excluded - we track ATLAS12)
  - Archaeology docs updated: SYNTHE_JAUREGI_2005.md (dedicated SYNTHE user guide)
  - Key findings (SYNTHE-specific only):
    - **Model headers mandatory**: Must insert control cards before TEFF line (SURFACE INTENSITY/FLUX + ITERATIONS 1)
    - **Complete VMS COM file walkthrough**: 11-stage pipeline with detailed I/O unit assignments
    - **Atomic line format**: 30 fields (WL, GFLOG, CODE, E, XJ, LABEL, EP, XJP, LABELP, damping, hyperfine, isotopes, Landé factors)
    - **Molecular line format**: 10 fields (simpler: WL, GFLOG, XJ, E, XJP, EP, CODE, LABEL, LABELP, ISO)
    - **⚠️ CRITICAL BUG**: SURFACE FLUX + ROTATE = crash; workaround: always use SURFACE INTENSITY with ROTATE
    - **GF file naming exception**: GF1200.100 covers 800-1200 nm (400 nm range, not 100 nm like others!)
    - **TiO optimization**: Skip schwenke.bin for Teff > 4500 K (saves enormous time)
    - **BROADEN profiles**: 5 types (MACR, GAUS, SINX, RECT, PROF) with 3 unit systems (KM, RESO, PM)
    - **Complete Fortran I/O table**: 17 units documented (for001-for093, rot1-rot5)
    - **Binary format warning**: Fortran "unformatted" is compiler-specific, plan JSON/HDF5 for Julia migration
    - **File lifecycle**: fort.12 (lines) written by SYNBEG, appended by readers, consumed by SYNTHE
    - **Migration priorities**: Line parsers → SYNBEG → ROTATE/BROADEN → XNFPELSYN/SYNTHE/SPECTRV (latter 3 need ATLAS7V)

- [ ] **atlas_synthe_manuals.pdf** - Manuals for ATLAS and SYNTHE
  - Date processed:
  - Related components: ATLAS9, SYNTHE
  - Archaeology docs updated:
  - Key findings:

- [x] **atlaslinux.pdf** - Linux implementation notes (Sbordone et al. 2004)
  - Date processed: 2025-11-09
  - Related components: Build/compilation, ATLAS9, SYNTHE, WIDTH
  - Archaeology docs updated: ARCHITECTURE_DETAILS.md (porting section)
  - Key findings:
    - **Compiler**: Intel Fortran Compiler (IFC) 7.0/8.0 (free for research, good Fortran IV compatibility)
    - **Minimal code changes**: FORMAT updates, OPEN syntax, double precision fixes, DATA block splitting
    - **New requirement**: PFIRON.DAT file (iron group partition functions) - IFC DATA block size limit
    - **Molecular data**: VMS binary → ASCII format (program modified to read ASCII)
    - **ODF conversion**: VMS binary → ASCII → Linux binary (saves disk space)
    - **Performance gains**: ATLAS9 2.7-3.9× faster, SYNTHE 6.9× faster vs VMS AlphaServer
    - **Laptop capable**: Pentium M 1.6GHz runs ATLAS9 in 122s (was 478s on AlphaServer)
    - **Scripts**: VMS DCL → C-shell, program sequence unchanged
    - **Validation**: Results indistinguishable from VMS (perfect T, ne agreement)
    - **Disk space**: ~700 MB typical (BIG ODFs + line lists + molecules)
    - Distribution contact: lsbordon@eso.org, bonifaci@ts.astro.it

- [ ] **atlasodfnew.pdf** - Opacity Distribution Functions (ODF) documentation
  - Date processed:
  - Related components: ODF, opacity calculations
  - Archaeology docs updated:
  - Key findings:

### Kurucz Papers and Conference Proceedings

- [x] **cjp-2016-0794.pdf** - "Including all the lines" project progress report (Kurucz 2016)
  - Date processed: 2025-11-09
  - Related components: Line data infrastructure, atomic/molecular line lists, opacity calculations
  - Archaeology docs updated: ARCHITECTURE_DETAILS.md (Section IX - comprehensive line data documentation)
  - Key findings:
    - **544 million atomic lines** (H through Zn, 2016 status, expected to double)
    - **10× expansion**: 58M (1988) → 544M (2016) lines from better configurations and lab data
    - **Historical insight**: 1988 model matched observations despite all wrong (Fe abundance 1.66× high, etc.) - compensating errors
    - **Data organization**: /atoms/, /linelists/gfnew/ (good λ), /linelists/gfpred/ (88 GB predicted λ)
    - **Must use BOTH**: gfall.dat (good wavelengths) + gfall.predall (predicted) for completeness
    - **Novel discovery method**: CP stars as laboratory (narrow lines, extreme abundances reveal high-n levels)
    - **Binary format critical**: 88 GB ASCII too slow, need 16-48 bytes/line compressed format
    - **Memory architecture**: 544M lines requires memory-mapping, wavelength-indexing
    - **ODF essential**: 1000× speedup required (544M × 72 depths × 30k frequencies = 10¹⁵ calculations)
    - **Validation strategy**: High-res atlases (Sun, Vega, Arcturus), NOT just integrated properties
    - **Key quote**: "Agreement with low resolution observations does not imply correctness"
    - **Bottom line**: Line data infrastructure is foundational - get it right first, don't replicate compensating errors

- [x] **kurucz05.pdf** - 2005 paper "Rapid computation of line opacity in SYNTHE and DFSYNTHE"
  - Date processed: 2025-11-09
  - Related components: SYNTHE, DFSYNTHE, opacity optimization, distribution functions
  - Archaeology docs updated: ARCHITECTURE_DETAILS.md (SYNTHE and DFSYNTHE sections)
  - Key findings:
    - **DFSYNTHE distribution functions**: 12-step opacity levels compress spectrum 100× (400 MB vs 40 GB)
    - **Distribution function concept**: Fraction of wavelength interval at each opacity level (statistical representation)
    - **Valid when**: Spectrum shape similar at different T,P; source function not rapidly varying
    - **Fails for**: Isolated strong lines (H α, H β), variable broadening, rapidly changing source function
    - **1000× speed-up**: Kurucz optimization over naive calculation (unpublished paper referenced)
    - **Precision philosophy**: 0.1% accuracy sufficient (wavelengths only physically accurate numbers)
    - **Optimizations**: Two-byte integers, low-precision Voigt, factor out T dependence, never compute twice
    - **Opacity table trade-offs**: 40 GB full spectrum vs 400 MB distribution functions vs 400 MB opacity sampling
    - **Pre-tabulated Rosseland**: ATLAS12 could converge faster without opacity routines (just interpolation)
    - **Microturbulent broadening**: Compute V_turb=0, apply Gaussian/Fourier filter for other values
    - **Billion line capability**: "I expect to reach more than one billion lines in the near future"
    - **Selective strategies**: Element-specific, wavelength ranges, temperature/pressure limits, photometric bands
    - **SYNTHE vs DFSYNTHE**: Point-by-point (exact) vs distribution functions (compressed approximation)
    - **Kurucz honesty**: Mean opacities "may be no worse than mixing-length convection" (pragmatic physics)
    - **Unpublished paper**: "Rapid Calculation of Line Opacity" at KURUCZ.HARVARD.EDU/PAPERS/OPACITYCALC

- [ ] **kurucz06.pdf** - 2006 paper/proceedings
  - Date processed:
  - Related components: TBD
  - Archaeology docs updated:
  - Key findings:

- [ ] **kurucz11.pdf** - 2011 paper/proceedings
  - Date processed:
  - Related components: TBD
  - Archaeology docs updated:
  - Key findings:

- [ ] **kurucz1996fka.pdf** - 1996 paper
  - Date processed:
  - Related components: TBD
  - Archaeology docs updated:
  - Key findings:

- [ ] **kurucz79.pdf** - 1979 paper (early work)
  - Date processed:
  - Related components: Historical context
  - Archaeology docs updated:
  - Key findings:

- [ ] **kurucz96.pdf** - 1996 paper/proceedings
  - Date processed:
  - Related components: TBD
  - Archaeology docs updated:
  - Key findings:

- [ ] **kurucz_avrett81.pdf** - 1981 Kurucz & Avrett collaboration
  - Date processed:
  - Related components: Historical context
  - Archaeology docs updated:
  - Key findings:

- [x] **kurucz_codes05.pdf** - 2005 codes overview (Kurucz)
  - Date processed: 2025-11-09
  - Related components: ATLAS12, SYNTHE, ATLAS9, WIDTH9, ROTATE, TRANSYNTHE, BROADEN, entire ecosystem
  - Archaeology docs updated: ARCHITECTURE_DETAILS.md (Section VIII - comprehensive overview)
  - Key findings:
    - **ATLAS12 status**: "Still does not work as originally advertised" - Rosseland opacity and EOS issues
    - **30,000 frequency points**: Accurate for total flux, NOT for intermediate-band photometry (must use SYNTHE)
    - **Two fundamental problems**: (1) Rosseland opacity for arbitrary abundances (took years to solve), (2) Equation of state from 1960s "still wrong in 2005"
    - **Depth-dependent microturbulent velocity**: Based on solar empirical model (Fontenla+ 1993), V_turb_min = 0.28 × V_turb_max, tied to convection physics not free parameter
    - **ROTATE algorithm**: 17 µ angles, 200×200 disk grid, differential rotation from Libbrecht & Morrow 1991
    - **Complete pipeline**: Star → SYNTHE → ROTATE → TRANSYNTHE → BROADEN → INTEGRATEFILTER → PLOTSYN
    - **Unimplemented components**: Interstellar reddening/bands/lines, telluric emission (airglow, pollution)
    - **TRANSYNTHE suite**: O₃, [O₂]₂ (O₂ dimer), HITRAN database, pressure shifts critical, R ≥ 2M required
    - **Model atmospheres**: MODMIDWIN/SPRING/MIDSUM/AUTUMN for Kitt Peak (Anderson+ 1986 Air Force data)
    - **WIDTH9 philosophy**: Only use 3-4 best lines on linear curve of growth! Grevesse & Sauval Fe: 3 Fe I + 1 Fe II lines (10% lower abundance)
    - **Honest assessment**: "Spectra do not reproduce real high-resolution observations" - use differential analysis
    - **Program ecosystem**: ~25 programs total (model, synthesis, observation effects, analysis)
    - **Performance**: 1 day for ODF opacity tables, 1 day for model grid, 1 day for spectrum section
    - **Pre-computed spectra**: 14 resolving powers (500000 to 100), ~1 day per model for all
    - **Development philosophy**: Pragmatic, iterative, honest about limitations, encourages user contributions
    - ⚠️ Telluric data "still not good enough without hand adjustment, even for O₂"
    - ⚠️ EOS partition functions wrong (especially heavy elements) - modern data needed
    - ⚠️ Many traditional abundance analysis methods give systematic errors

---

## Processing Notes

- **Priority**: Core ATLAS documentation should be processed before general papers
- **Chronological context**: Earlier papers (1970s-1980s) describe initial implementations
- **Evolution tracking**: Later papers may document changes and extensions
- **Cross-references**: Note when multiple PDFs discuss the same feature

---

## Synthesis of Key Findings (6 PDFs Processed)

### Recurring Themes Across Manuscripts

**1. Honest Assessment of Limitations**
- Kurucz consistently acknowledges code limitations and approximations
- "ATLAS12 still does not work as originally advertised" (kurucz_codes05.pdf)
- "Spectra do not reproduce real high-resolution observations" - use differential analysis
- 1988 model matched observations despite ALL parameters wrong (compensating errors!)
- Lesson: Don't assume agreement means correctness

**2. Opacity is Everything**
- 544M atomic lines and growing (cjp-2016-0794.pdf)
- 1000× speed-up essential via ODFs (kurucz05.pdf)
- Binary formats critical: 88 GB ASCII too slow
- Line data infrastructure is foundational - get it right first

**3. Binary Format Challenges**
- Fortran "unformatted" is compiler-specific (atlas9+synthe.pdf)
- VMS → ASCII → Linux conversion required (atlaslinux.pdf)
- Plan JSON/HDF5 for Julia migration
- Validation: perfect agreement possible (atlaslinux: T, ne indistinguishable from VMS)

**4. The Full Ecosystem is ~25 Programs**
- Not just ATLAS12 + SYNTHE (kurucz_codes05.pdf)
- Complete pipeline: model → synthesis → rotation → tellurics → broadening → photometry
- Many components unimplemented (interstellar, telluric emission)
- Atlas.jl must decide scope vs. compatibility

**5. Performance Realities**
- 1 day for ODF opacity tables (kurucz_codes05.pdf)
- 1 day for model atmosphere grid
- SYNTHE 6.9× faster on 2004 Linux vs VMS (atlaslinux.pdf)
- Memory-mapped architecture needed for 544M lines (cjp-2016-0794.pdf)

**6. Critical Bugs and Workarounds**
- SURFACE FLUX + ROTATE = crash (atlas9+synthe.pdf)
- Workaround: always use SURFACE INTENSITY with ROTATE
- GF1200.100 covers 800-1200 nm (not 1200-1300 nm!) - naming exception
- TiO optimization: skip schwenke.bin for Teff > 4500 K

### Atlas.jl Migration Priorities (from manuscripts)

**Phase 1 - Data Infrastructure** (before any physics):
1. Line list parsers (gfall.dat format - nothing works without this)
2. Binary format design (16-48 bytes/line, memory-mapped)
3. Dual handling: good λ (synthesis) + predicted λ (opacity)

**Phase 2 - Core Physics** (validated separately):
4. Opacity calculations with ODF support
5. Saha-Boltzmann populations
6. Voigt profile computation

**Phase 3 - Integration**:
7. ATLAS12 atmosphere iteration
8. SYNTHE synthesis pipeline
9. Validation vs. high-res atlases (Sun, Vega, Arcturus)

### Questions Resolved by Manuscripts

**Q: Why so many format variations?**
A: Evolution from VMS to Linux, compiler changes, disk space constraints (atlaslinux.pdf)

**Q: Can we simplify the line data?**
A: No - need BOTH gfall.dat AND gfall.predall for completeness (cjp-2016-0794.pdf)

**Q: What precision is needed?**
A: Kurucz philosophy: "0.1% accuracy sufficient" (kurucz05.pdf)

**Q: Why 30,000 frequency points?**
A: Accurate for total flux, NOT intermediate-band photometry - use SYNTHE for colors (kurucz_codes05.pdf)

### Warnings for Atlas.jl Development

⚠️ **Don't replicate compensating errors**: 1988 code had FOUR major errors that canceled out
⚠️ **Validation traps**: Low-res integrated properties hide problems
⚠️ **EOS/partition functions**: 1960s data "still wrong in 2005" - use modern data
⚠️ **Binary compatibility**: Fortran UNFORMATTED is compiler-specific, plan alternative
⚠️ **Scope creep**: 25+ programs in full ecosystem - define minimum viable product first

**Last synthesis update**: 2025-11-09
