# Git Workflow for Atlas.jl
*Managing merges between Claude Code Web feature branches and main*

## Context

During the Claude Code Web credit period, work is being done in two places:
- **Claude Code Web** (web interface): Working on dynamically-named feature branches (e.g., `claude/phase-2b-documentation-architecture-011CUtZTwX29Tt1LCdtuf9pf`)
- **Claude Code** (local): Working directly on `main` branch or reviewing/merging work

When a web session breaks or restarts, a **new feature branch with a different name** will be created. This document describes how to manage these branches and merge work into main.

---

## Quick Reference

### Check branch status (do this first!)
```bash
git fetch origin
git branch -a  # See all local and remote branches
git log main..origin/HEAD --oneline  # See what's new on the current tracked branch
```

### See all active web session branches
```bash
git branch -r | grep claude/
```

### Merge current active web session work to main
```bash
# First, identify the active web session branch by checking the web interface
git fetch origin
git merge --no-ff <ACTIVE_BRANCH_NAME> -m "Merge Phase X: [description]"
git push origin main
```

### Clean up completed/stale branches (after merging)
```bash
git fetch origin
git branch -r | grep claude/  # List all web session branches
git push origin --delete <COMPLETED_BRANCH_NAME>  # Delete from remote
git branch -d <LOCAL_BRANCH_NAME>  # Delete local tracking branch if it exists
```

---

## Detailed Step-by-Step Workflow

### Step 1: Identify the active web session branch
Check the Claude Code Web interface to see which feature branch it's currently working on. The branch name will be in the format: `claude/[task-description]-[random-id]`

You can also see it in the branch selector dropdown or in session information.

### Step 2: Check what needs merging
```bash
git fetch origin
git log main..<ACTIVE_BRANCH_NAME> --oneline
```
Replace `<ACTIVE_BRANCH_NAME>` with the actual branch name (e.g., `origin/claude/phase-2b-documentation-architecture-011CUtZTwX29Tt1LCdtuf9pf`).

This shows you what new commits are on the feature branch that aren't on main yet.

### Step 3: Review changes (optional)
If you want to review the changes locally first:
```bash
git diff main..<ACTIVE_BRANCH_NAME>
```

### Step 4: Switch to main and merge
```bash
git checkout main
git merge --no-ff <ACTIVE_BRANCH_NAME> -m "Merge Phase X: [description]"
```

The `--no-ff` flag creates a merge commit (not a fast-forward), which preserves the history clearly.

### Step 5: Push to GitHub
```bash
git push origin main
```

---

## Managing Multiple Web Sessions and Stale Branches

When a web session breaks or restarts, a **new feature branch with a different name** will be created. This section covers how to keep things clean.

### Identifying stale branches
After merging work from a web session, the old branch becomes stale. You can identify these:

```bash
git branch -r | grep claude/  # Show all web session branches
```

### Checking if a branch is fully merged to main
Before deleting a branch, verify all its work is already in main:

```bash
git merge-base --is-ancestor origin/<BRANCH_NAME> origin/main && \
  echo "Branch is fully merged" || \
  echo "Branch has unmerged commits - do NOT delete!"
```

### Cleaning up stale branches
Once you've merged a web session branch to main, clean it up:

```bash
# Delete from remote
git push origin --delete <STALE_BRANCH_NAME>

# Delete local tracking branch if it exists
git branch -d <LOCAL_BRANCH_NAME>
```

### Common scenario during the credit period
1. Web session 1 creates: `claude/phase-2a-analysis-XXXXX` → Merge to main → Delete
2. Web session 1 breaks, Session 2 creates: `claude/phase-2b-documentation-YYYYY` → Still working...
3. You're here: Keep the active session branch, clean up completed ones

---

## Handling Local Uncommitted Changes

If you have uncommitted changes on `main` when trying to merge:

```bash
# Commit your local changes first
git add .
git commit -m "Your local changes description"

# Then proceed with merge
git checkout main
git merge --no-ff <ACTIVE_BRANCH_NAME> -m "Merge Phase X: [description]"
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

## Branch Naming Convention

Claude Code Web creates feature branches with a standard naming pattern:
```
claude/[task-description]-[session-id]
```

Examples:
- `claude/clone-repo-structure-011CUobdc216xNwRVc7QdFCS` (Session 1)
- `claude/phase-2b-documentation-architecture-011CUtZTwX29Tt1LCdtuf9pf` (Session 2)

The session ID is randomly generated and ensures each web session has a unique branch.

**IMPORTANT**: Do NOT delete the **active** feature branch. The Claude Code Web session is linked to it. Only delete branches after:
1. Merging their work to `main`
2. Verifying they're fully merged with `git merge-base --is-ancestor`
3. Confirming a new session has started (web interface shows different branch name)

---

## After the Credit Period

Once the Claude Code Web credit is exhausted or the credit period ends:

1. Identify any remaining active web session branches:
   ```bash
   git fetch origin
   git branch -r | grep claude/
   ```

2. Do a final merge of any remaining work to `main`:
   ```bash
   git checkout main
   git merge --no-ff <FINAL_ACTIVE_BRANCH> -m "Final merge: [description]"
   git push origin main
   ```

3. Clean up all web session branches:
   ```bash
   # Delete all claude/* branches from remote
   git branch -r | grep claude/ | sed 's|origin/||' | xargs -I {} git push origin --delete {}

   # Delete any local tracking branches
   git branch -d $(git branch | grep claude/)
   ```

4. Resume normal workflow with all work on `main` branch

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

*Author: Claude Code (Haiku 4.5)*
*Last updated: 2025-11-07*
