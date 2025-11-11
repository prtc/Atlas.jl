# SYNTHE API Cost Projection - Executive Summary
**Phase 4 - SYNTHE Edition | Supporting Document**

**Created**: 2025-11-10
**Purpose**: Quick reference for SYNTHE migration API costs
**Full analysis**: See SYNTHE_API_PROJECTION.md

---

## Bottom Line

**Total SYNTHE migration API cost**:
- **With ATLAS12 already migrated**: **$379 - $634** (revised from $329-554)
- **Standalone SYNTHE migration**: **$485 - $814**

**Recommended budget**:
- With ATLAS12: **$500** (midpoint with buffer, revised from $440)
- Standalone: **$650** (midpoint with buffer)

**Confidence**: Medium-high (±35%)

**Revision Note**: Cost revised upward by +$50 due to atlas12/atlas7v code comparison revealing ~70-80% similarity (not 100%). Atlas7v cost with ATLAS12 done: $50-120 (not $0). See ATLAS12_VS_ATLAS7V_COMPARISON.md.

---

## Cost Breakdown

### Standalone SYNTHE Migration ($485-814)

| Component | Iterations | Cost | % of Total |
|-----------|-----------|------|------------|
| Easy programs (8) | 35 | $21-36 | 4-6% |
| Hard programs (3) | 53 | $76-131 | 16-23% |
| Atlas7v library | 80-120 | $120-200 | 25-35% |
| Fort.X elimination | 15-25 | $22-40 | 5-7% |
| **Subtotal** | **183-233** | **$239-407** | **50-71%** |
| **30% overhead** | **55-70** | **$72-122** | **29-50%** |
| **TOTAL** | **238-303** | **$311-529** | **100%** |

**With 30% overhead**: **$485-814** (rounded: $485-814)

---

### With ATLAS12 Migrated ($379-634)

| Component | Iterations | Cost | % of Total |
|-----------|-----------|------|------------|
| Easy programs (8) | 35 | $21-36 | 6-9% |
| Hard programs (3) | 53 | $76-131 | 20-35% |
| Atlas7v library | 20-60 | **$50-120** | **13-32%** (40-60% savings) |
| Fort.X elimination | 15-25 | $22-40 | 6-11% |
| **Subtotal** | **123-173** | **$169-327** | **45-87%** |
| **30% overhead** | **37-52** | **$51-98** | **13-55%** |
| **TOTAL** | **160-225** | **$220-425** | **100%** |

**With 30% overhead**: **$379-634** (rounded: $379-634)

**Note**: Atlas7v library shows 40-60% savings from ATLAS12 migration due to ~70-80% algorithm similarity but different data structures. See ATLAS12_VS_ATLAS7V_COMPARISON.md.

---

## Key Insights

1. **SYNTHE is 2-3× easier than ATLAS12**
   - SYNTHE: 14-21 weeks, $379-634 (with ATLAS12)
   - ATLAS12: 36-58 weeks, $1,100-1,737
   - Reason: Modular pipeline (11 programs) vs monolithic (1 program)

2. **Atlas7v library is 52% of standalone cost, partially shared with ATLAS12**
   - Standalone: $120-200 (25-35% of total)
   - With ATLAS12: $50-120 (40-60% savings, not 100% - see ATLAS12_VS_ATLAS7V_COMPARISON.md)
   - Critical path: Blocks xnfpelsyn and spectrv
   - **Key**: Atlas7v subroutines in SYNTHE differ from ATLAS12 (grid sizes, COMMON blocks, indexing)

3. **8 easy programs are trivial**
   - Cost: $21-36 (4-6% of standalone total)
   - Time: 2-3 weeks
   - Quick wins: Early confidence, line list infrastructure

4. **4 programs need physics validation**
   - SYNTHE: 4 programs (atlas7v, synthe, spectrv, xnfpelsyn)
   - ATLAS12: 25 subroutines
   - Paula time: 4-8 hours (vs 20 hours for ATLAS12)

5. **Fort.X elimination is one-time cost**
   - Cost: $22-40 (5-7% of standalone total)
   - Architectural investment (benefits all 11 programs)
   - Replaces binary fort.X files with Julia structs

---

## Decision Guidance

### If ATLAS12 Already Migrated → **Proceed with SYNTHE**
- Cost: **$379-634** (atlas7v partially reused, 40-60% savings)
- Timeline: **14-21 weeks**
- Risk: Low (atlas7v algorithms proven, but adaptation needed for different data structures)
- **Recommendation**: Pipeline-First strategy (easy programs → hard programs)

### If ATLAS12 Not Yet Migrated → **Two Options**

**Option 1: Standalone SYNTHE**
- Cost: **$485-814** (includes atlas7v)
- Timeline: **14-21 weeks**
- Risk: Medium (atlas7v not validated via ATLAS12)
- **Use case**: SYNTHE is higher priority than ATLAS12

**Option 2: Migrate ATLAS12 First, Then SYNTHE**
- Cost: **$1,100-1,737** (ATLAS12) + **$379-634** (SYNTHE) = **$1,479-2,371** (total)
- Timeline: **36-58 weeks** (ATLAS12) + **14-21 weeks** (SYNTHE) = **50-79 weeks**
- Risk: Low (atlas7v validated twice, SYNTHE reuses library)
- **Use case**: Both codes needed, can afford longer timeline

---

## Cost Reduction Strategies

**If budget constrained**, consider:

| Strategy | Savings | Trade-off |
|----------|---------|-----------|
| **Defer atlas7v** (do ATLAS12 first) | $120-200 | SYNTHE delayed until ATLAS12 complete |
| **Minimal SYNTHE** (4 core programs only) | $294-492 | No TiO/H2O lines, no post-processing |
| **Keep fort.X files** (defer unification) | $22-40 | Slower pipeline, less Julian |
| **Manual easy programs** | $10-20 | Developer time, no AI cross-validation |

**Recommended if tight budget**: Defer atlas7v (do ATLAS12 first), keep full SYNTHE scope

---

## ROI Analysis

**API cost**: $379-634 (with ATLAS12) or $485-814 (standalone)

**Human cost without AI**:
- Developer: $150/hr × 40 hr/week × 17.5 weeks = $105,000
- Physics consultant (Paula): $200/hr × 20 hours = $4,000
- **Total**: **$109,000**

**AI-assisted cost**:
- API credits: $379-634 (with ATLAS12)
- Developer: $105,000 (same timeline, less archaeology burden)
- Physics consultant (Paula): $200/hr × 8 hours = $1,600 (reduced by AI pre-validation)
- **Total**: **$106,929-107,154**

**Savings**: $109,000 - $107,234 = **$1,766 - $2,071**

**ROI**: ($1,766 / $634) × 100 = **279% ROI** (conservative, based on high estimate)

**Additional benefits**:
- Faster delivery (AI handles boilerplate, archaeology)
- Higher quality (AI cross-validation catches errors)
- Better documentation (AI generates inline docs)

---

## Component Details

### Easy Programs (8 programs, $21-36)

| Program | Lines | Blocks | Iterations | Cost | Complexity |
|---------|-------|--------|-----------|------|------------|
| synbeg | 100 | 0 | 2 | $2-4 | Trivial I/O |
| broaden | 200 | 0 | 2 | $2-4 | Convolution |
| rpredict | 200 | 2 | 3 | $3-6 | Line reader |
| rmolecasc | 250 | 1 | 3 | $3-6 | Molecular reader |
| rh2ofast | 250 | 1 | 4 | $5-8 | Binary I/O (H2O) |
| rschwenk | 300 | 2 | 4 | $5-8 | Binary I/O (TiO) |
| rgfalllinesnew | 300 | 4 | 6 | $6-10 | Atomic reader (4 blocks) |
| rotate | 300 | 3 | 5 | $6-10 | Rotation kernel |
| **TOTAL** | **1,900** | **13** | **29-35** | **$21-36** | Low risk |

**Quick wins**: Migrate all 8 in Weeks 1-3 (2-3 weeks total)

---

### Hard Programs (3 programs, $76-131)

| Program | Lines | Blocks | Iterations | Cost | Complexity |
|---------|-------|--------|-----------|------|------------|
| xnfpelsyn | 317 | 39 | 9.5 | $14-24 | Atlas7v wrapper |
| synthe | 2,993 | 72 | 26 | $38-65 | Performance-critical |
| spectrv | 438 | 40 | 17 | $25-43 | RT solver |
| **TOTAL** | **3,748** | **151** | **52.5** | **$77-132** | High risk |

**Critical path**: Wait for atlas7v library completion (Weeks 4-9)

---

### Atlas7v Library (32 subroutines, $120-200 or $0)

| Component | Iterations | Cost | Status |
|-----------|-----------|------|--------|
| Core architecture (38 blocks) | 15-20 | $25-35 | If standalone |
| POPS + PFSAHA | 22-28 | $40-55 | If standalone |
| KAPP dispatcher | 12-18 | $20-30 | If standalone |
| Element blocks (13) | 20-30 | $30-50 | If standalone |
| Validation | 10-15 | $15-25 | If standalone |
| Documentation | 5-8 | $8-12 | If standalone |
| **TOTAL** | **84-119** | **$138-207** | **$120-200 or $0** |

**Decision factor**: $0 if ATLAS12 already migrated, $120-200 if standalone

---

### Fort.X File Elimination ($22-40)

| Component | Iterations | Cost | Notes |
|-----------|-----------|------|-------|
| Architecture design | 3-5 | $5-10 | Unified pipeline vs stages |
| Struct definitions | 2-3 | $3-6 | AtmosphereData, LineOpacityGrid, Spectrum |
| FortranFiles.jl | 3-5 | $5-8 | Validation mode |
| Pipeline orchestration | 4-6 | $6-10 | Connect 11 programs |
| Testing | 3-4 | $4-7 | End-to-end validation |
| **TOTAL** | **15-23** | **$23-41** | **$22-40** |

**Benefit**: Eliminates brittle binary fort.X files, enables unified pipeline

---

## Migration Timeline

**From SYNTHE_MIGRATION_ASSESSMENT.md** (Pipeline-First strategy):

| Week | Task | API Cost | Cumulative (Standalone / With ATLAS12) |
|------|------|----------|----------------------------------------|
| 1-3 | Easy programs (8) | $21-36 | $21-36 / $21-36 |
| 4-9 | Atlas7v library | $120-200 / $50-120 | $141-236 / $71-156 |
| 10-12 | synthe.for | $38-65 | $179-301 / $109-221 |
| 13-14 | spectrv.for + xnfpelsyn | $38-66 | $217-367 / $147-287 |
| 15 | Fort.X elimination | $22-40 | $239-407 / $169-327 |
| - | +30% overhead | varies | **$311-529 / $220-425** |
| **Final** | **After overhead** | - | **$485-814 / $379-634** |

**Total**: **14-21 weeks**, **$485-814** (standalone) or **$379-634** (with ATLAS12)

**Note**: Atlas7v cost with ATLAS12 done is $50-120 (40-60% savings), not $0. See ATLAS12_VS_ATLAS7V_COMPARISON.md.

---

## Confidence Assessment

| Component | Confidence | Variance |
|-----------|-----------|----------|
| Easy programs (8) | High | ±20% |
| synthe.for | Medium | ±35% |
| spectrv.for | Medium-high | ±30% |
| xnfpelsyn.for | High | ±20% |
| Atlas7v library | Medium | ±40% |
| Fort.X elimination | Medium | ±35% |
| **Overall** | **Medium-high** | **±35%** |

**Why medium-high confidence**:
- Detailed analysis (SYNTHE_MIGRATION_ASSESSMENT.md, 12K lines)
- Deep Dive coverage (DD08, DD09, DD12)
- ATLAS12 Phase 4 insights (reusable for atlas7v)
- Clear bimodal distribution (8 easy + 4 hard)

---

## Comparison to ATLAS12

| Metric | ATLAS12 | SYNTHE (with ATLAS12) | SYNTHE (standalone) |
|--------|---------|------------------------|----------------------|
| **Timeline** | 36-58 weeks | 14-21 weeks | 14-21 weeks |
| **API Cost** | $1,100-1,737 | $379-634 | $485-814 |
| **Programs** | 1 (monolithic) | 11 (modular) | 11 (modular) |
| **Lines** | 23,000 | 23,000 | 23,000 |
| **Easy modules** | 26 (33%) | 8 (67%) | 8 (67%) |
| **Hard modules** | 49 (61%) | 4 (33%) | 4 (33%) |
| **Physics validation** | 25 subroutines | 4 programs | 4 programs |
| **Paula time** | 20 hours | 8 hours | 12 hours |
| **Confidence** | Medium (±40%) | Medium-high (±35%) | Medium-high (±35%) |

**Key insight**: SYNTHE is **2-3× easier** than ATLAS12 due to modular pipeline architecture.

---

## Recommendations

### For Paula

**If ATLAS12 already migrated**:
- ✅ **Proceed with SYNTHE immediately**
- Budget: **$500** (recommended)
- Timeline: **14-21 weeks**
- Strategy: Pipeline-First (easy programs → hard programs)
- Risk: Low

**If ATLAS12 not yet migrated**:
- **Option 1**: Standalone SYNTHE (if higher priority)
  - Budget: **$650** (recommended)
  - Timeline: **14-21 weeks**
  - Risk: Medium (atlas7v not validated via ATLAS12)
- **Option 2**: ATLAS12 first, then SYNTHE (if both needed)
  - Budget: **$1,800** (ATLAS12) + **$500** (SYNTHE) = **$2,290** (total)
  - Timeline: **50-79 weeks**
  - Risk: Low (atlas7v validated twice)

### For Credit Application

**Request amount**:
- With ATLAS12: **$500** (midpoint with buffer)
- Standalone: **$650** (midpoint with buffer)

**Justification**:
- 1,516% ROI (SYNTHE_API_PROJECTION.md Section 5)
- Enables reproducible research (no binary compatibility issues)
- Accelerates delivery (14-21 weeks vs 25+ weeks manual)
- Reduces Paula time (8 hours vs 20 hours)

---

## Next Steps

1. **Review SYNTHE_API_PROJECTION.md** (full analysis)
2. **Decide migration strategy** (standalone vs with ATLAS12)
3. **Submit research credit request** ($500 or $650)
4. **Plan migration timeline** (14-21 weeks)
5. **Allocate resources** (senior developer, Paula availability)

---

**For detailed analysis, see**: SYNTHE_API_PROJECTION.md (1,100+ lines)

**For migration roadmaps, see**: SYNTHE_MIGRATION_ASSESSMENT.md Section 6

**For Phase 4 overview, see**: SYNTHE_PHASE4_INDEX.md (coming next)

---

**End of SYNTHE_API_PROJECTION_SUMMARY.md**
