# Prime Skill Design

## Overview

Create a `/prime` skill for the dev-workflow plugin that loads comprehensive project context at the start of a session. The skill analyzes project structure, reads core documentation, identifies key files, and generates a structured summary report.

## Design Decisions

### Invocation
- **Manual only** - User explicitly runs `/prime` when they want context
- No auto-run, no auto-suggest

### Comprehensiveness
- **Full analysis** - Maps entire project structure, reads all core docs, identifies key files, checks git state
- Based on proven prior art pattern

### File Handling
- **Note missing files** - Explicitly mention which expected files weren't found
- **Graceful fallbacks** - Try alternatives (e.g., if no package.json, look for pyproject.toml, requirements.txt)
- **Flexible identification** - Leave logic for identifying "key files" up to Claude's judgment at execution time

### Output
- **Display only** - Show report in conversation, don't save to disk
- **Structured format** - Use exact report structure from prior art

## File Structure

```
plugins/dev-workflow/
  skills/
    prime/
      SKILL.md          # Main skill file
```

## Skill Metadata

```yaml
---
description: Prime agent with codebase understanding
---
```

## Process Flow

### 1. Analyze Project Structure

**Commands:**
- `git ls-files` - List all tracked files
- `tree -L 3 -I 'node_modules|__pycache__|.git|dist|build'` (Linux only)

**Handling:**
- If tree command fails or is unavailable, skip silently and continue

### 2. Read Core Documentation

**Target files:**
- PRD.md or similar spec file
- CLAUDE.md or similar global rules file
- README files at project root and major directories
- Any architecture documentation
- Drizzle config (for database schema understanding)

**Handling:**
- Note which files are missing in the report
- Try alternatives when primary files don't exist
  - No package.json → try pyproject.toml, requirements.txt, Cargo.toml, go.mod
  - No PRD.md → try SPEC.md, docs/requirements.md, docs/prd.md
  - No architecture docs → try docs/architecture.md, ARCHITECTURE.md, docs/design.md

### 3. Identify Key Files

**Target categories (flexible identification):**
- Main entry points (main.py, index.ts, app.py, etc.)
- Core configuration files (pyproject.toml, package.json, tsconfig.json)
- Key model/schema definitions
- Important service or controller files

**Handling:**
- Leave identification logic flexible - Claude determines based on structure
- Use common patterns but adapt to what's found
- Don't hardcode specific filenames

### 4. Understand Current State

**Commands:**
- `git log -10 --oneline` - Recent activity
- `git status` - Current branch and status

## Report Structure

The skill generates a structured report with these sections:

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

**Formatting:**
- Easy to scan
- Use bullet points
- Clear headers
- Note missing files explicitly

## Error Handling

**Missing commands:**
- tree not available → skip silently, continue without tree output

**Missing files:**
- Expected file doesn't exist → note in report, try alternatives

**Git errors:**
- Not a git repo → skip git commands, note in report
- Git commands fail → skip that step, continue with others

## Implementation Notes

- Use Bash tool for all shell commands
- Use Read tool for reading files
- Use Glob/Grep tools for finding alternatives
- Keep the skill concise - direct translation of prior art
- Don't over-engineer the file identification logic
- Focus on getting comprehensive context quickly
