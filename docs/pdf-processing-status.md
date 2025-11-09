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
  - Date processed: 2025-11-09
  - Related components: ATLAS9, SYNTHE, ROTATE, BROADEN
  - Archaeology docs updated: ARCHITECTURE_DETAILS.md (ATLAS9 and SYNTHE sections)
  - Key findings:
    - Complete ATLAS9 I/O unit structure (Table 2.1): 7 units documented
    - Comprehensive control card reference (47+ cards documented)
    - SYNTHE 11-program pipeline with detailed COM file walkthrough
    - Atomic line format: 30 fields (wavelength, log gf, damping, hyperfine, etc.)
    - Molecular line format: 10 fields (simpler than atomic)
    - ⚠️ CRITICAL BUG: SURFACE FLUX crashes with ROTATE - must use SURFACE INTENSITY
    - Two ATLAS9 executables: atlas9v (radiation fields), atlas9mem (models)
    - ODF resolutions: BIG=328 divisions (models), LITTLE=1212 divisions (radiation)
    - Model naming: ap00t6000g45k2nover = abundance/Teff/logg/turb/convection
    - Line list files: GF0300.100 = upper λ 300nm, range 100nm (except GF1200.100=400nm!)
    - Complete SYNTHE I/O units across all 11 programs documented
    - Partial redistribution parameters (fort.25 - NLTE only)

- [ ] **atlas_synthe_manuals.pdf** - Manuals for ATLAS and SYNTHE
  - Date processed:
  - Related components: ATLAS9, SYNTHE
  - Archaeology docs updated:
  - Key findings:

- [ ] **atlaslinux.pdf** - Linux implementation notes
  - Date processed:
  - Related components: Build/compilation, platform-specific
  - Archaeology docs updated:
  - Key findings:

- [ ] **atlasodfnew.pdf** - Opacity Distribution Functions (ODF) documentation
  - Date processed:
  - Related components: ODF, opacity calculations
  - Archaeology docs updated:
  - Key findings:

### Kurucz Papers and Conference Proceedings

- [ ] **cjp-2016-0794.pdf** - Recent publication (2016)
  - Date processed:
  - Related components: TBD
  - Archaeology docs updated:
  - Key findings:

- [ ] **kurucz05.pdf** - 2005 paper/proceedings
  - Date processed:
  - Related components: TBD
  - Archaeology docs updated:
  - Key findings:

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

- [ ] **kurucz_codes05.pdf** - 2005 codes overview
  - Date processed:
  - Related components: General overview, all components
  - Archaeology docs updated:
  - Key findings:

---

## Processing Notes

- **Priority**: Core ATLAS documentation should be processed before general papers
- **Chronological context**: Earlier papers (1970s-1980s) describe initial implementations
- **Evolution tracking**: Later papers may document changes and extensions
- **Cross-references**: Note when multiple PDFs discuss the same feature
