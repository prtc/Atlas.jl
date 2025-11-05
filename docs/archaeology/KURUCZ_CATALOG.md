# Kurucz Source Codes Catalog
*Task 1.2 - Fortran File Inventory*

**Generated**: 2025-11-04
**Location**: `upstream/kurucz/source_codes/`

---

## Summary Statistics

- **Total Files**: 163 Fortran (.for) files
- **Total Lines of Code**: 204,690 lines
- **Top-Level Categories**: 6 major sections

---

## Category Breakdown

| Category | Files | Description |
|----------|-------|-------------|
| **programs/** | 88 | Main computation engines (ATLAS9, ATLAS12, SYNTHE variants, NEWDF) |
| **atoms/** | 28 | Atomic data processing utilities (element-specific and generic) |
| **grids/** | 15 | Photometric system calculators |
| **molecules/** | 14 | Molecular opacity readers (H2O, TiO, H3+) |
| **LINELISTS/** | 12 | Line list format converters and readers |
| **sun/** | 6 | Solar spectrum-specific tools |

---

## 1. LINELISTS (Line List Processing)

**Files**: 12 | **Purpose**: Format conversion and reading utilities for spectral line data

### 1.1 GF10 (gf-value format, 10-character)
| File | Lines | Description |
|------|-------|-------------|
| splitgf10.for | 39 | Split line list into chunks |

### 1.2 GF100 (gf-value format, 100-character)
| File | Lines | Description |
|------|-------|-------------|
| splitgf100.for | 38 | Split line list into chunks |

### 1.3 GFNEW (New gf-value format)
| File | Lines | Description |
|------|-------|-------------|
| splitgf100.for | 37 | Split line list into chunks |

### 1.4 LINES (Standard line readers)
| File | Lines | Description |
|------|-------|-------------|
| rgfall.for | 404 | Read Kurucz/Fall atomic lines |
| rpackedlines.for | 393 | Read packed binary line format |
| rmolec.for | 350 | Read molecular lines |
| readlow.for | 328 | Read low-resolution lines |
| readhi.for | 281 | Read high-resolution lines |
| molbin.for | 29 | Molecular binary conversion |

**Subtotal**: 1,785 lines

### 1.5 LINESMOL (Molecular line readers)
| File | Lines | Description |
|------|-------|-------------|
| rmolec.for | 350 | Read molecular lines (ASCII) |
| molbin.for | 33 | Molecular binary conversion |
| molbinh2xx.for | 21 | H2 molecular binary conversion |

**Subtotal**: 404 lines

**LINELISTS Total**: 2,303 lines

---

## 2. atoms (Atomic Data Processing)

**Files**: 28 | **Purpose**: Element-specific atomic structure calculations

### Organization Pattern
- Directories named by atomic number + ionization (e.g., 2603 = Fe III, atomic number 26, ionization 3)
- Generic programs in `atoms/PROGRAMS/`

### 2.1 Element-Specific Programs (by directory)

**0602** (unknown element):
- paircoupling.for (120 lines) - Coupling coefficient calculations
- polarization.for (41 lines) - Polarization calculations

**2306** (V I - Vanadium I):
- partfn3007.for (73 lines) - Partition function calculator

**2406** (Cr I - Chromium I):
- ghik.for (29 lines) - g-factor calculations

**2500** (Mn I - Manganese I):
- expand3007.for (223 lines) - Energy level expander
- expandforbidden3007.for (188 lines) - Forbidden transitions

**2507** (Mn VIII):
- ghik.for (29 lines) - g-factor calculations

**2601** (Fe II - Iron II):
- expand3007.for (248 lines) - Energy level expander
- expandforbidden3007.for (199 lines) - Forbidden transitions

**2603** (Fe III):
- expand3007.for (222 lines) - Energy level expander
- expandforbidden3007.for (186 lines) - Forbidden transitions
- gfagafgf.for (39 lines) - gf-value processor

**2604** (Fe IV):
- expand3007.for (222 lines) - Energy level expander
- expandforbidden3007.for (186 lines) - Forbidden transitions
- gfagafgf.for (39 lines) - gf-value processor

**2605** (Fe V):
- expand3007.for (248 lines) - Energy level expander
- expandforbidden3007.for (199 lines) - Forbidden transitions

**2701** (Co II - Cobalt II):
- gfall.for (18 lines) - Line list generator
- gfboth.for (23 lines) - Combined gf processor

**2800** (Ni I - Nickel I):
- expandiso.for (42 lines) - Isotope expander

**2801** (Ni II):
- expand3007.for (105 lines) - Energy level expander
- expand3007p.for (107 lines) - Energy level expander (variant p)

**PF** (Partition Functions):
- pfiron.for (44 lines) - Iron partition functions

### 2.2 Generic Programs (PROGRAMS/)

| File | Lines | Description |
|------|-------|-------------|
| expand3007.for | 247 | Generic energy level expander |
| expandforbidden3007.for | 198 | Generic forbidden transition expander |
| lifetimes.for | 48 | Radiative lifetime calculator |
| partfn3007.for | 66 | Generic partition function calculator |
| gfagafgf.for | 39 | gf-value processor |

**atoms Total**: ~3,400 lines

**Key Observation**: Heavy focus on iron-group elements (Mn, Fe, Co, Ni), critical for stellar atmosphere modeling.

---

## 3. grids (Photometric System Calculators)

**Files**: 15 | **Directory**: `grids/gridP00/`
**Purpose**: Calculate colors and magnitudes in various photometric systems

| File | Lines | Description |
|------|-------|-------------|
| thirteen.for | 490 | 13-color photometry system |
| ubvbuser.for | 395 | UBV Buser system |
| ddo.for | 378 | DDO photometric system |
| vilnius.for | 358 | Vilnius photometric system |
| uvbyca.for | 355 | Strömgren uvby + Ca system |
| uvby.for | 330 | Strömgren uvby system |
| rijkl.for | 321 | RIJKL near-IR system |
| geneva.for | 311 | Geneva photometric system |
| vbluw.for | 300 | Walraven VBLUW system |
| jhkcit.for | 280 | JHK CIT near-IR system |
| cousins.for | 246 | Cousins RI system |
| beta.for | 220 | Hβ photometry |
| redden.for | 141 | Interstellar reddening |
| intensitypack.for | 50 | Intensity packer utility |
| fluxpack.for | 28 | Flux packer utility |

**grids Total**: ~4,403 lines

**Note**: Each photometric system has its own program - suggests these will need dedicated Julia implementations per system.

---

## 4. molecules (Molecular Opacity Processing)

**Files**: 14 | **Purpose**: Molecular line list readers and partition functions

### 4.1 H2O (Water Vapor)
| File | Lines | Description |
|------|-------|-------------|
| rh2oslow.for | 241 | Read slow/accurate H2O lines |
| rh2ofast.for | 189 | Read fast/approximate H2O lines |
| h2opartfn.for | 42 | H2O partition function |
| rh2oir.for | 34 | Read H2O infrared lines |
| rh2ocool.for | 32 | Read H2O cool star lines |
| eh2obin.for | 31 | Encode H2O binary format |

**Subtotal**: 569 lines

### 4.2 TiO (Titanium Oxide)
| File | Lines | Description |
|------|-------|-------------|
| rschwenk.for | 218 | Read Schwenke TiO lines |
| rtiobincard.for | 53 | Read TiO binary card format |
| eschwbin.for | 23 | Encode Schwenke binary |
| tiopart.for | 21 | TiO partition function |
| rtiobinasc.for | 15 | TiO binary to ASCII |

**Subtotal**: 330 lines

### 4.3 H3+ (Trihydrogen Cation)
| File | Lines | Description |
|------|-------|-------------|
| rh3plus.for | 111 | Read H3+ lines |

### 4.4 Top-Level Utilities
| File | Lines | Description |
|------|-------|-------------|
| rmolecasc.for | 744 | Generic molecular line reader (ASCII) |
| eh2obin.for | 31 | H2O binary encoder (duplicate?) |

**molecules Total**: ~1,785 lines

**Note**: H2O dominates with multiple variants for different temperature regimes and accuracy needs.

---

## 5. programs (Main Computation Engines)

**Files**: 88 | **Purpose**: Core stellar atmosphere and synthesis codes
**Total**: ~177,000 lines (86% of all Kurucz code!)

### 5.1 atlas9 (ATLAS9 Stellar Atmosphere Code)
**Files**: 6

| File | Lines | Size | Description |
|------|-------|------|-------------|
| atlas9.for | 18,725 | 1000K | ATLAS9 standard version |
| atlas9mem.for | 18,633 | 995K | Memory-optimized version |
| atlas9v.for | 18,626 | 994K | Vector-optimized version |
| atlas9xlinop.for | 13,014 | 638K | ATLAS9 with explicit line opacity |
| xlinop9.for | 564 | 42K | Explicit line opacity module |
| fluxpack.for | 28 | 1.0K | Flux packer utility |

**Subtotal**: 69,590 lines

**Key Observation**: Multiple optimized versions for different computational environments (memory, vector processors, explicit line opacity).

---

### 5.2 atlas12 (ATLAS12 - Enhanced with Molecules & NLTE)
**Files**: 26

**Main Engine**:
- atlas12.for (22,152 lines, 1.1M) - Main ATLAS12 program

**Auxiliary Codes**:
| File | Lines | Description |
|------|-------|-------------|
| atlas7v.for | 17,045 | Legacy ATLAS7 variant |
| plotpack.for | 5,011 | Plotting package |
| plotsyn.for | 3,883 | Synthetic spectrum plotter |
| synthe.for | 1,659 | Spectrum synthesis |
| readlow.for | 328 | Read low-res lines |
| readhi.for | 281 | Read high-res lines |
| rgfall.for | 404 | Read Kurucz/Fall lines |
| rpackedlines.for | 396 | Read packed lines |
| rotate.for | 381 | Rotational broadening |
| rnlte.for | 365 | Read NLTE data |
| rmolec.for | 350 | Read molecular lines |
| broadenx.for | 346 | Enhanced broadening |
| xnfpelsyn.for | 345 | Synthesis utilities |
| rnlteall.for | 276 | Read all NLTE data |
| broaden.for | 223 | Line broadening |
| integratefilter.for | 190 | Filter integration |
| synbeg.for | 137 | Synthesis initialization |
| split17ldsyn.for | 129 | Split 17-layer synthesis |
| mergesyn.for | 99 | Merge synthetic spectra |
| integrate.for | 57 | Integration utility |
| asciitriplets.for | 49 | ASCII triplet converter |
| resamplesyn.for | 39 | Resample synthetic spectrum |
| spectrv.for | 440 | Spectrum utilities |

**Subtotal**: ~54,580 lines

---

### 5.3 SYNTHE (Standard Synthetic Spectrum Synthesis)
**Files**: 11

| File | Lines | Description |
|------|-------|-------------|
| atlas7v.for | 17,144 | ATLAS7 variant for interpolation |
| synthe.for | 2,985 | Main SYNTHE program |
| rgfall.for | 648 | Read Kurucz/Fall lines |
| rmolecasc.for | 625 | Read molecular lines |
| spectrv.for | 441 | Spectrum utilities |
| xnfpelsyn.for | 398 | Synthesis utilities |
| rotate.for | 378 | Rotational broadening |
| broadenx.for | 343 | Enhanced broadening |
| broaden.for | 224 | Standard broadening |
| synbeg.for | 131 | Initialization |
| airtovac.for | 30 | Air-to-vacuum wavelength conversion |

**Subtotal**: 23,347 lines

---

### 5.4 SYNTHECD (CD-ROM Distribution Version)
**Files**: 36 | **Note**: Appears to be a self-contained distribution with many utilities

**Main Components**:
| File | Lines | Size | Description |
|------|-------|------|-------------|
| atlas7v.for | 8,036 | 344K | Compact ATLAS7 (half size of other versions!) |
| plotpack.for | 4,858 | 177K | Comprehensive plotting |
| plotsyn.for | 3,325 | 106K | Synthetic spectrum plotting |
| synthe.for | 1,355 | 46K | Main synthesis (compact) |

**Raster & Visualization**:
- rasterov.for (634 lines) - Raster overlay
- rasterpo.for (631 lines) - Raster portrait
- spectrv.for (555 lines) - Spectrum utilities

**I/O & Format Utilities**:
- rnlte.for (356 lines) - NLTE data reader
- rotate.for (358 lines) - Rotational broadening
- rgfiron.for (312 lines) - Read iron gf-values
- rline.for (305 lines) - Line reader
- rmolec.for (302 lines) - Molecular line reader
- rbell.for (278 lines) - Read Bell data
- makesola.for (214 lines) - Make solar abundance file
- broaden.for (194 lines) - Line broadening
- varibroa.for (162 lines) - Variable broadening

**Small Utilities** (< 100 lines):
- moldeck.for (106), binary.for (95), mergeplo.for (90), makegfir.for (85), mergesyn.for (80), asciisyn.for (64), psletter.for (64), psledger.for (63), readvec.for (62), laplot.for (61), asciibin.for (57), integrat.for (49), squashsy.for (40), plotgrid.for (34), punchlin.for (33), syntheto.for (33), molbin.for (29), ask.for (18), begtime.for (9), abort.for (4)

**Subtotal**: ~23,000 lines

**Note**: SYNTHECD is significantly more compact than other SYNTHE versions, optimized for CD-ROM distribution in the 1990s.

---

### 5.5 NEWDF (Detailed Opacity Synthesis - "New DF")
**Files**: 9

| File | Lines | Description |
|------|-------|-------------|
| xnfdf.for | 16,203 | Main opacity calculator (MASSIVE!) |
| dfsynthe.for | 3,660 | DFSYNTHE synthesis |
| repackdi.for | 436 | Repack diatomic data |
| repackhi.for | 355 | Repack high-res data |
| repacklow.for | 355 | Repack low-res data |
| repacknlte.for | 294 | Repack NLTE data |
| repackh2o.for | 80 | Repack H2O data |
| repacktio.for | 80 | Repack TiO data |
| separatedf.for | 33 | Separate opacity files |

**Subtotal**: 21,496 lines

**Note**: `xnfdf.for` is the second-largest single file in the entire codebase (after atlas12.for).

---

**programs/ Summary by Component**:
| Component | Files | Lines | % of programs/ |
|-----------|-------|-------|----------------|
| atlas9 | 6 | 69,590 | 39% |
| atlas12 | 26 | 54,580 | 31% |
| SYNTHE | 11 | 23,347 | 13% |
| SYNTHECD | 36 | 23,000 | 13% |
| NEWDF | 9 | 21,496 | 12% |
| **Total** | **88** | **~177,000** | **100%** |

---

## 6. sun (Solar Spectrum Tools)

**Files**: 6 | **Purpose**: Solar-specific analysis tools

### 6.1 fluxatlas/
- makesolarflux.for (214 lines) - Create solar flux atlas

### 6.2 kpk/ (Kitt Peak K-line?)
- plotkpk.for (166 lines) - Plot KPK data
- kpkbinav.for (18 lines) - Binary average
- kpkbinraw.for (14 lines) - Binary raw data

### 6.3 kpnoprelim/ (Kitt Peak NO Prelim?)
- plotkpno.for (145 lines) - Plot KPNO data
- makekpno.for (12 lines) - Make KPNO file

**sun Total**: ~569 lines

---

## Comparative Analysis: Kurucz vs. Castelli

| Metric | Castelli | Kurucz | Ratio |
|--------|----------|--------|-------|
| Total files | 68 | 163 | 2.4× |
| Total lines | 282,000 | 204,690 | 0.73× |
| Avg lines/file | 4,147 | 1,256 | 0.30× |
| Largest file | atlas12.for (23,247) | atlas12.for (22,152) | ~same |
| Organization | 12 component dirs | 6 category dirs | More hierarchical |

**Key Differences**:
1. **Kurucz has MORE files but FEWER lines**: More modular, smaller components
2. **Better organization**: Castelli is component-focused; Kurucz is category-focused
3. **Castelli has duplicates**: Multiple "g" variants inflate line counts
4. **Kurucz has unique capabilities**: Atomic data tools, photometric grids, solar tools
5. **Castelli focuses on core**: Mostly ATLAS/SYNTHE variants and utilities

---

## Code Organization Insights

### Kurucz Advantages:
- **Modular atomic data tools**: Element-specific processing (not in Castelli)
- **Photometric systems**: 15 dedicated calculators (not in Castelli)
- **Multiple SYNTHE variants**: SYNTHE, SYNTHECD for different use cases
- **Solar-specific tools**: Dedicated analysis for our star
- **Better separation**: Programs vs. data processing utilities

### Castelli Advantages:
- **More complete ATLAS variants**: Multiple dated versions for testing
- **Integrated plotting**: More visualization tools in core components
- **Simpler structure**: Easier to navigate initially

---

## Duplicate Detection

### Cross-Repository Matches (files in both Castelli & Kurucz):

**ATLAS Programs**:
- atlas9.for, atlas9mem.for, atlas9v.for (ATLAS9 variants)
- atlas12.for (ATLAS12 - Kurucz: 22,152 lines; Castelli: 23,247 lines)

**SYNTHE Ecosystem**:
- synthe.for, synbeg.for, broaden.for, rotate.for
- atlas7v.for (ATLAS7 variant)
- rgfall.for, rmolecasc.for (line readers)

**DFSYNTHE**:
- dfsynthe.for, xnfdf.for
- repack*.for utilities (h2o, tio, hi, low, nlte, di)
- separatedf.for

**KAPPA/ODF**:
- Castelli has more ODF utilities; Kurucz integrates into programs/

**Question for Phase 2**: Which versions are canonical? Version comparison needed!

---

## Size Rankings (Largest Single Files)

1. atlas12.for (22,152 lines) - ATLAS12 main
2. atlas9.for (18,725 lines) - ATLAS9 standard
3. atlas9mem.for (18,633 lines) - ATLAS9 memory-optimized
4. atlas9v.for (18,626 lines) - ATLAS9 vector
5. atlas7v.for (17,144 lines) - ATLAS7 in SYNTHE/
6. atlas7v.for (17,045 lines) - ATLAS7 in atlas12/
7. xnfdf.for (16,203 lines) - Opacity calculator
8. atlas9xlinop.for (13,014 lines) - ATLAS9 explicit line opacity
9. atlas7v.for (8,036 lines) - ATLAS7 in SYNTHECD/
10. plotpack.for (5,011 lines) - Plotting in atlas12/

**Note**: ATLAS and opacity codes dominate the top 10.

---

## Task 1.2 Status: ✅ COMPLETE

**Key Findings**:
- 163 files, 204,690 lines (comparable to Castelli but more modular)
- Better organized: 6 functional categories vs. 12 component directories
- Unique capabilities: atomic data processing, photometric systems, solar tools
- Significant code sharing with Castelli (need version comparison)
- ATLAS9 has 4 variants; SYNTHE has 3 major distributions

**Next**: Task 1.3 - Combine catalogs and create unified line count analysis
