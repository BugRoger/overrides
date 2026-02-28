# Prime Skill Implementation Plan

> **For Claude:** Use superpowers:executing-plans (simple/fast) or superpowers:subagent-driven-development (fresh context + reviews) to implement this plan.

**Goal:** Add a `/prime` skill to dev-workflow plugin that loads comprehensive project context through structure analysis, documentation reading, and git state inspection.

**Architecture:** Single SKILL.md file that instructs Claude to run bash commands (git ls-files, tree, git log, git status), read core documentation files, identify key files flexibly, and generate a structured report with sections for Project Overview, Architecture, Tech Stack, Core Principles, and Current State.

**Tech Stack:** Markdown skill file using Claude Code tool conventions (Bash, Read, Glob, Grep tools)

---

## Task 1: Create Skill Directory Structure

**Files:**
- Create: `plugins/dev-workflow/skills/prime/SKILL.md`

**Step 1: Create prime skill directory**

Run: `mkdir -p plugins/dev-workflow/skills/prime`
Expected: Directory created successfully

**Step 2: Verify directory exists**

Run: `ls -la plugins/dev-workflow/skills/`
Expected: Should see `prime/` directory listed alongside `retro/` and `init-claude-md/`

---

## Task 2: Write Skill Metadata and Header

**Files:**
- Modify: `plugins/dev-workflow/skills/prime/SKILL.md` (new file)

**Step 1: Write frontmatter and overview**

Write to `plugins/dev-workflow/skills/prime/SKILL.md`:

```markdown
---
description: Prime agent with codebase understanding
---

# Prime: Load Project Context

## Objective

Build comprehensive understanding of the codebase by analyzing structure, documentation, and key files.

## Process
```

**Step 2: Verify frontmatter format**

Run: `head -n 10 plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should show yaml frontmatter with description

**Step 3: Compare with other skills**

Run: `head -n 5 plugins/dev-workflow/skills/retro/SKILL.md plugins/dev-workflow/skills/init-claude-md/SKILL.md`
Expected: Confirm frontmatter format matches existing skills

---

## Task 3: Write Step 1 - Analyze Project Structure

**Files:**
- Modify: `plugins/dev-workflow/skills/prime/SKILL.md:12-30`

**Step 1: Add structure analysis section**

Add to SKILL.md after "## Process":

```markdown
### 1. Analyze Project Structure

List all tracked files:
```bash
git ls-files
```

Show directory structure:
```bash
tree -L 3 -I 'node_modules|__pycache__|.git|dist|build'
```

**Note:** If tree command fails or is unavailable, skip silently and continue without tree output.
```

**Step 2: Verify markdown formatting**

Run: `cat plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Markdown renders correctly with code blocks

---

## Task 4: Write Step 2 - Read Core Documentation

**Files:**
- Modify: `plugins/dev-workflow/skills/prime/SKILL.md:32-60`

**Step 1: Add documentation reading section**

Add after Step 1:

```markdown
### 2. Read Core Documentation

Read the following files if they exist. If a file is missing, note it in the report and try alternatives:

**Primary targets:**
- PRD.md or similar spec file
- CLAUDE.md or similar global rules file
- README files at project root and major directories
- Any architecture documentation
- Drizzle config (for database schema understanding)

**Fallback alternatives when files don't exist:**
- No package.json → try pyproject.toml, requirements.txt, Cargo.toml, go.mod
- No PRD.md → try SPEC.md, docs/requirements.md, docs/prd.md
- No architecture docs → try docs/architecture.md, ARCHITECTURE.md, docs/design.md

**Tools to use:**
- Use Read tool for reading known files
- Use Glob tool for finding alternatives (e.g., `**/README*.md`, `**/*config*`)
- Use Grep tool for searching specific patterns
```

**Step 2: Verify section is complete**

Run: `grep -A 20 "### 2. Read Core Documentation" plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should show all primary targets and fallbacks

---

## Task 5: Write Step 3 - Identify Key Files

**Files:**
- Modify: `plugins/dev-workflow/skills/prime/SKILL.md:62-80`

**Step 1: Add key files section**

Add after Step 2:

```markdown
### 3. Identify Key Files

Based on the project structure, identify and read key files in these categories. Use your judgment to determine which files are most important:

**Target categories:**
- Main entry points (main.py, index.ts, app.py, server.js, etc.)
- Core configuration files (pyproject.toml, package.json, tsconfig.json, Cargo.toml)
- Key model/schema definitions
- Important service or controller files

**Approach:**
- Don't hardcode specific filenames
- Look for common patterns but adapt to what you find
- Use Glob to find candidates: `**/*.config.{js,ts}`, `**/main.*`, `**/models/**`, `**/schema/**`
- Prioritize files that appear to be central to the application
```

**Step 2: Verify flexibility is emphasized**

Run: `grep "judgment\|adapt\|flexible" plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should confirm language about flexibility

---

## Task 6: Write Step 4 - Understand Current State

**Files:**
- Modify: `plugins/dev-workflow/skills/prime/SKILL.md:82-100`

**Step 1: Add git state section**

Add after Step 3:

```markdown
### 4. Understand Current State

Check recent activity and current branch:

```bash
git log -10 --oneline
```

```bash
git status
```

**Error handling:**
- If not a git repository, skip git commands and note in report
- If git commands fail, skip that step and continue
```

**Step 2: Verify error handling is included**

Run: `grep -A 5 "Error handling" plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should show error handling instructions

---

## Task 7: Write Output Report Structure

**Files:**
- Modify: `plugins/dev-workflow/skills/prime/SKILL.md:102-160`

**Step 1: Add report structure section**

Add after Step 4:

```markdown
## Output Report

Provide a concise summary covering:

### Project Overview
- Purpose and type of application
- Primary technologies and frameworks
- Current version/state

### Architecture
- Overall structure and organization
- Key architectural patterns identified
- Important directories and their purposes

### Tech Stack
- Languages and versions
- Frameworks and major libraries
- Build tools and package managers
- Testing frameworks

### Core Principles
- Code style and conventions observed
- Documentation standards
- Testing approach

### Current State
- Active branch
- Recent changes or development focus
- Any immediate observations or concerns

**Formatting requirements:**
- Make this summary easy to scan
- Use bullet points and clear headers
- Note any missing files explicitly
- Keep it concise but comprehensive
```

**Step 2: Verify all report sections are present**

Run: `grep "^### " plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should show all 5 report sections: Project Overview, Architecture, Tech Stack, Core Principles, Current State

**Step 3: Compare structure with design doc**

Run: `grep "^### " .plans/2026-02-28-prime-skill-design.md | head -5`
Expected: Report sections match the design document

---

## Task 8: Update Plugin Manifests

**Files:**
- Modify: `plugins/dev-workflow/.claude-plugin/plugin.json:3`
- Modify: `.claude-plugin/marketplace.json:13-14`

**Step 1: Update plugin.json description**

Change in `plugins/dev-workflow/.claude-plugin/plugin.json`:

```json
{
  "name": "dev-workflow",
  "description": "Development workflow skills including session retrospective and project context loading",
  "version": "0.0.2",
  "author": {
    "name": "bugroger"
  }
}
```

**Step 2: Verify plugin.json is valid**

Run: `cat plugins/dev-workflow/.claude-plugin/plugin.json | python3 -m json.tool`
Expected: Valid JSON output

**Step 3: Update marketplace.json version**

Change version from `0.0.1` to `0.0.2` and update description in `.claude-plugin/marketplace.json`:

```json
    {
      "name": "dev-workflow",
      "description": "Development workflow skills including session retrospective and project context loading",
      "version": "0.0.2",
      "source": "./plugins/dev-workflow"
    },
```

**Step 4: Verify marketplace.json is valid**

Run: `cat .claude-plugin/marketplace.json | python3 -m json.tool`
Expected: Valid JSON output

**Step 5: Verify both versions match**

Run: `grep '"version"' plugins/dev-workflow/.claude-plugin/plugin.json .claude-plugin/marketplace.json`
Expected: Both show `"version": "0.0.2"`

---

## Task 9: Test Skill File Validity

**Files:**
- Test: `plugins/dev-workflow/skills/prime/SKILL.md`

**Step 1: Check file exists and is readable**

Run: `test -f plugins/dev-workflow/skills/prime/SKILL.md && echo "File exists" || echo "File missing"`
Expected: "File exists"

**Step 2: Verify complete structure**

Run: `cat plugins/dev-workflow/skills/prime/SKILL.md | wc -l`
Expected: Should have ~160 lines

**Step 3: Verify all sections present**

Run: `grep "^## " plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should show: Objective, Process, Output Report

**Step 4: Verify all process steps present**

Run: `grep "^### [1-4]" plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Should show steps 1-4

**Step 5: Check markdown syntax**

Run: `grep '```' plugins/dev-workflow/skills/prime/SKILL.md | wc -l`
Expected: Even number (all code blocks properly closed)

---

## Task 10: Final Review and Commit

**Files:**
- Review: `plugins/dev-workflow/skills/prime/SKILL.md`
- Review: `plugins/dev-workflow/.claude-plugin/plugin.json`
- Review: `.claude-plugin/marketplace.json`

**Step 1: Review complete SKILL.md**

Run: `cat plugins/dev-workflow/skills/prime/SKILL.md`
Expected: Complete skill with all sections, proper formatting, matches design

**Step 2: Review all changes**

Run: `git diff`
Expected: Shows new SKILL.md file and updated manifests

**Step 3: Check git status**

Run: `git status`
Expected: Shows 3 files changed/created

**Step 4: Stage all changes**

Run: `git add plugins/dev-workflow/skills/prime/SKILL.md plugins/dev-workflow/.claude-plugin/plugin.json .claude-plugin/marketplace.json`
Expected: Files staged

**Step 5: Create commit**

Run:
```bash
git commit -m "$(cat <<'EOF'
Add /prime skill to dev-workflow plugin

Implements comprehensive project context loading skill that:
- Analyzes project structure via git ls-files and tree
- Reads core documentation (PRD, CLAUDE.md, README, architecture docs)
- Identifies key files flexibly based on project type
- Checks git state and recent activity
- Generates structured report with Project Overview, Architecture, Tech Stack, Core Principles, and Current State sections

Updates plugin version to 0.0.2 in both plugin.json and marketplace.json.

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```
Expected: Commit created successfully

**Step 6: Verify commit**

Run: `git log -1 --oneline`
Expected: Shows new commit with "Add /prime skill" message

---

## Summary

This plan creates a `/prime` skill for the dev-workflow plugin that:
- Follows the skill file pattern used by other dev-workflow skills
- Implements the 4-step process: structure analysis, doc reading, key file identification, git state
- Generates a structured report matching the design specification
- Handles missing files gracefully with fallbacks
- Updates plugin manifests according to CLAUDE.md rules
- Single commit at completion
