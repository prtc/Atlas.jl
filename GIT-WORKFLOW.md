# Git Workflow for Atlas.jl
*Managing merges between Claude Code Web feature branch and main*

## Context

During the 2-week Claude Code Web credit period, work is being done in two places:
- **Claude Code Web** (web interface): Working on `claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS` branch
- **Claude Code** (local): Working directly on `main` branch

This document describes how to merge work from the web interface feature branch into main.

---

## Quick Reference

### See what needs merging
```bash
git fetch origin
git log main..origin/claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS --oneline
```

### Merge in one command
```bash
git fetch origin && \
git merge --no-ff origin/claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS -m "Merge Phase X: [description]" && \
git push origin main
```

---

## Detailed Step-by-Step Workflow

### Step 1: Check what needs merging
```bash
git fetch origin
git log main..origin/claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS --oneline
```
This shows you what new commits are on the feature branch that aren't on main yet.

### Step 2: Update your local feature branch (optional)
If you want to review changes locally first:
```bash
git checkout claude-feature-branch
git pull
```

### Step 3: Switch to main and merge
```bash
git checkout main
git merge --no-ff claude-feature-branch -m "Your descriptive merge message here"
```

Or merge directly from the remote without local checkout:
```bash
git checkout main
git merge --no-ff origin/claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS -m "Your message"
```

The `--no-ff` flag creates a merge commit (not a fast-forward), which preserves the history clearly.

### Step 4: Push to GitHub
```bash
git push origin main
```

---

## Handling Local Uncommitted Changes

If you have uncommitted changes when trying to merge:

```bash
# Commit your local changes first
git add .
git commit -m "Your local changes description"

# Then proceed with merge
git merge --no-ff origin/claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS -m "Merge Phase X: [description]"
git push origin main
```

---

## Tips for Good Merge Messages

Structure your merge commits like this:
```
Merge Phase X: [Short title]

- [Key accomplishment 1]
- [Key accomplishment 2]
- [Files created/modified]
- [Important findings]
```

### Example (Phase 1 completion):
```
Merge Phase 1 completion: Repository Census with comprehensive archaeology reports

- Completed all Phase 1 tasks (1.1-1.6)
- Created 7 archaeology reports (~2,500 lines of analysis):
  * CASTELLI_CATALOG.md - 68 files, 282K lines
  * KURUCZ_CATALOG.md - 163 files, 205K lines
  * CONSOLIDATED_LINE_COUNTS.md + CSV - 231 files, 487K lines
  * FILE_TYPES.md - Architecture analysis
  * DEPENDENCY_MAP.md - Call graph analysis
  * CENSUS_REPORT.md - Comprehensive 550-line final report
- Updated MISSION.md: Phase 1 marked complete
- Key findings: 79% standalone programs, 7 mega-programs (31% of code),
  ATLAS12 & SYNTHE as primary migration targets
```

---

## Branch Information

- **Main branch**: `main`
- **Claude Code Web feature branch**: `claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS`
- **Local tracking branch**: `claude-feature-branch` (tracks the remote feature branch)

**IMPORTANT**: Do NOT delete the feature branch during the 2-week credit period. The Claude Code Web session is linked to this branch.

---

## After the Credit Period

Once the $250 Claude Code Web credit is exhausted or the 2-week period ends:

1. Do a final merge of any remaining work from the feature branch
2. Optionally clean up the feature branch:
   ```bash
   git push origin --delete claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS
   git branch -d claude-feature-branch
   ```
3. Resume normal workflow with all work on `main` branch

---

## Troubleshooting

### "Your local changes would be overwritten"
You have uncommitted changes. Either commit them or stash them:
```bash
git stash
# Do your merge
git stash pop  # Restore your changes after merge
```

### Merge conflicts
If there are conflicts between main and the feature branch:
```bash
# Git will mark conflicted files
git status

# Edit the conflicted files to resolve
# Look for <<<<<<< HEAD markers

# After resolving:
git add [resolved-files]
git commit  # Complete the merge
git push origin main
```

### Want to see what changed without merging?
```bash
git diff main origin/claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS
```

---

*Author: Claude Code (Sonnet 4.5)*
*Last updated: 2025-11-05*
