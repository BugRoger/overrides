# `/init` Skill Implementation Plan

> **For Claude:** Use superpowers:executing-plans (simple/fast) or superpowers:subagent-driven-development (fresh context + reviews) to implement this plan.

**Goal:** Refactor `init-claude-md` → `init` skill that creates the canonical `.agent/` folder structure for projects.

**Architecture:** Skill creates `.agent/` directory with verb-based subfolders aligned to workflow, populates `prime/` with invariant + template files, and creates a bridge `./CLAUDE.md` that imports `.agent/CLAUDE.md`.

**Tech Stack:** Claude Code skill (SKILL.md + templates/)

**Design Doc:** `.plans/2026-03-01-init-skill-design.md`

---

## Task 1: Remove symlink-plugins skill

**Files:**
- Delete: `plugins/dev-workflow/skills/symlink-plugins/` (entire directory)

**Step 1: Delete the skill directory**

Run: `rm -rf plugins/dev-workflow/skills/symlink-plugins`

**Step 2: Verify removal**

Run: `ls plugins/dev-workflow/skills/`
Expected: `init-claude-md  prime  retro` (no symlink-plugins)

---

## Task 2: Rename init-claude-md to init

**Files:**
- Rename: `plugins/dev-workflow/skills/init-claude-md/` → `plugins/dev-workflow/skills/init/`

**Step 1: Rename the directory**

Run: `mv plugins/dev-workflow/skills/init-claude-md plugins/dev-workflow/skills/init`

**Step 2: Verify rename**

Run: `ls plugins/dev-workflow/skills/`
Expected: `init  prime  retro`

---

## Task 3: Create template directory structure

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/`

**Step 1: Create templates directory**

Run: `mkdir -p plugins/dev-workflow/skills/init/templates`

**Step 2: Verify creation**

Run: `ls plugins/dev-workflow/skills/init/`
Expected: `SKILL.md  templates`

---

## Task 4: Create META.md template (invariant)

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/META.md`

**Step 1: Create META.md**

```markdown
# META - Maintaining Project Documentation

## Purpose

This file defines how to maintain the `.agent/` documentation structure. It is always imported into CLAUDE.md to ensure consistent documentation practices.

## Rules Summary Updates

**Rule**: When adding, modifying, or removing rules in any `prime/` file, update the corresponding summary in `.agent/CLAUDE.md`.

**Process**:
1. Add the rule to the appropriate `prime/*.md` file
2. Add a one-sentence summary to the Rules Summary section in CLAUDE.md
3. Ensure the summary references the file: "See .agent/prime/FILENAME.md"

## Writing Guidelines

**Core Principles:**
1. **Use absolute directives** — Start with "NEVER" or "ALWAYS" for non-negotiable rules
2. **Lead with why** — Explain rationale before solution (1-3 bullets max)
3. **Be concrete** — Include actual commands/code for project-specific patterns
4. **Minimize examples** — One clear point per code block
5. **Bullets over paragraphs** — Keep explanations concise
6. **Action before theory** — Put immediate takeaways first

**Anti-Bloat Rules:**
- Don't add "Warning Signs" to obvious rules
- Don't show bad examples for trivial mistakes
- Don't write paragraphs explaining what bullets can convey
- Don't write long "Why" explanations — 1-3 bullets maximum

## File Conventions

- **UPPERCASE.md** — Invariant meta files (always exist, same structure)
- **lowercase.md** — Variant files (plans, research docs, date-prefixed)

## Folder Structure

```
.agent/
├── CLAUDE.md       # <200 lines, summary + @imports
├── prime/          # Reference material (loaded by /prime)
├── research/       # Discovery, exploration
├── design/         # Specs, brainstorming output
├── plan/           # Implementation plans
├── status/         # Current state, milestones
├── verify/         # Verification reports
└── release/        # Changelogs, release notes
```
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/META.md | head -20`
Expected: Shows META.md header content

---

## Task 5: Create AGENTS.md template (invariant)

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/AGENTS.md`

**Step 1: Create AGENTS.md**

```markdown
# AGENTS - Multi-Agent Safety & Workflow

## Purpose

Rules for Claude and agents working on this project. Ensures safe multi-agent collaboration and consistent git workflow.

## Core Rules

- **High-confidence answers only**: ALWAYS verify in code; NEVER guess
- **Multi-agent safety**: NEVER create/apply/drop git stash entries unless explicitly requested
- **Multi-agent safety**: ALWAYS assume other agents may be working; keep unrelated WIP untouched
- **Multi-agent safety**: NEVER create/remove/modify git worktrees unless explicitly requested
- **Multi-agent safety**: NEVER switch branches unless explicitly requested

## Git Workflow

- **When user says "push"**: You may `git pull --rebase` to integrate latest changes (never discard other agents' work)
- **When user says "commit"**: Scope to your changes only
- **When user says "commit all"**: Commit everything in grouped chunks
- **Unrecognized files**: Keep going; focus on your changes and commit only those

## Refactoring

- **Implementation plans are authoritative**: When executing a `.agent/plan/*.md` file, the plan takes precedence over existing documentation or code comments
- **Grep for old names**: When renaming/deleting, run `grep -r "old-name" .` to find all references

## Reports

- Focus on your edits
- Avoid guard-rail disclaimers unless truly blocked
- End with brief "other files present" note only if relevant
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/AGENTS.md | head -20`
Expected: Shows AGENTS.md header content

---

## Task 6: Create STACK.md template

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/STACK.md`

**Step 1: Create STACK.md**

```markdown
# STACK - Technology Stack

## Purpose

Documents the technology stack, dependencies, and versions used in this project.

## Core Stack

<!-- Fill in your project's core technologies -->

**Runtime:**
- Language: [e.g., TypeScript 5.x, Python 3.12]
- Runtime: [e.g., Node.js 20.x, Bun 1.x]

**Framework:**
- [e.g., Next.js 14, FastAPI, SvelteKit]

**Database:**
- [e.g., PostgreSQL 16, SQLite, MongoDB]

## Key Dependencies

<!-- List important dependencies and their purpose -->

| Package | Purpose |
|---------|---------|
| [package] | [what it's used for] |

## Development Tools

**Build:**
- [e.g., Vite, esbuild, Webpack]

**Testing:**
- [e.g., Vitest, pytest, Jest]

**Linting:**
- [e.g., ESLint, Ruff, Prettier]

## Commands

```bash
# Install dependencies
[command]

# Run development server
[command]

# Run tests
[command]

# Build for production
[command]
```
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/STACK.md | head -20`
Expected: Shows STACK.md header content

---

## Task 7: Create STRUCTURE.md template

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/STRUCTURE.md`

**Step 1: Create STRUCTURE.md**

```markdown
# STRUCTURE - Codebase Structure

## Purpose

Documents the directory layout and where different types of files belong.

## Directory Layout

<!-- Fill in your project's structure -->

```
project-root/
├── src/              # Source code
├── tests/            # Test files
├── docs/             # Documentation
└── ...
```

## Key Directories

<!-- Describe purpose of each major directory -->

**src/**
- Purpose: [what lives here]
- Contains: [types of files]

## Key File Locations

**Entry Points:**
- [path]: [purpose]

**Configuration:**
- [path]: [purpose]

**Core Logic:**
- [path]: [purpose]

## Naming Conventions

**Files:**
- [pattern]: [example]

**Directories:**
- [pattern]: [example]

## Where to Add New Code

**New Feature:**
- Primary code: [directory]
- Tests: [directory]

**New Component:**
- Implementation: [directory]
- Types: [directory]
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/STRUCTURE.md | head -20`
Expected: Shows STRUCTURE.md header content

---

## Task 8: Create CONVENTIONS.md template

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/CONVENTIONS.md`

**Step 1: Create CONVENTIONS.md**

```markdown
# CONVENTIONS - Code Conventions

## Purpose

Documents naming patterns, code style, and project-specific conventions.

## Naming

**Files:**
- [pattern]: [example]

**Variables:**
- [pattern]: [example]

**Functions:**
- [pattern]: [example]

**Types/Interfaces:**
- [pattern]: [example]

## Code Style

<!-- Project-specific style rules -->

**Imports:**
- [convention]

**Exports:**
- [convention]

**Error Handling:**
- [convention]

## Patterns

<!-- Common patterns used in this codebase -->

**[Pattern Name]:**
```
[code example]
```

## Anti-Patterns

<!-- Things to avoid -->

- NEVER [anti-pattern]
- AVOID [anti-pattern]
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/CONVENTIONS.md | head -20`
Expected: Shows CONVENTIONS.md header content

---

## Task 9: Create ARCHITECTURE.md template

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/ARCHITECTURE.md`

**Step 1: Create ARCHITECTURE.md**

```markdown
# ARCHITECTURE - System Architecture

## Purpose

Documents the system design, component relationships, and data flow.

## Overview

<!-- High-level description of the system -->

[2-3 sentences about what this system does and how it's structured]

## Components

<!-- Major components/modules -->

**[Component Name]:**
- Purpose: [what it does]
- Location: [where it lives]
- Dependencies: [what it depends on]

## Data Flow

<!-- How data moves through the system -->

```
[input] → [component] → [component] → [output]
```

## Key Decisions

<!-- Important architectural decisions and why -->

**[Decision]:**
- Context: [why this came up]
- Decision: [what was decided]
- Rationale: [why]

## Boundaries

<!-- System boundaries and interfaces -->

**External APIs:**
- [API]: [purpose]

**Internal Boundaries:**
- [boundary]: [purpose]
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/ARCHITECTURE.md | head -20`
Expected: Shows ARCHITECTURE.md header content

---

## Task 10: Create TESTING.md template

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/TESTING.md`

**Step 1: Create TESTING.md**

```markdown
# TESTING - Test Strategy

## Purpose

Documents the testing approach, commands, and conventions.

## Test Commands

```bash
# Run all tests
[command]

# Run specific test file
[command]

# Run with coverage
[command]

# Run in watch mode
[command]
```

## Test Structure

**Unit Tests:**
- Location: [path]
- Naming: [convention]

**Integration Tests:**
- Location: [path]
- Naming: [convention]

## Conventions

**Test File Naming:**
- [pattern]

**Test Function Naming:**
- [pattern]

**Fixtures/Mocks:**
- Location: [path]
- Usage: [convention]

## Coverage

**Target:** [percentage]

**Critical Paths:**
- [path/module]: [why critical]
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/TESTING.md | head -20`
Expected: Shows TESTING.md header content

---

## Task 11: Create CLAUDE.md template

**Files:**
- Create: `plugins/dev-workflow/skills/init/templates/CLAUDE.md`

**Step 1: Create CLAUDE.md**

```markdown
# {project-name}

@.agent/prime/META.md

## Prime Directives

- You must always refer to me as Michi

## Rules Summary

### 1. Agents
See .agent/prime/AGENTS.md
- ALWAYS verify in code; NEVER guess
- NEVER create/drop git stash unless explicitly requested
- ALWAYS assume other agents may be working

### 2. Stack
See .agent/prime/STACK.md
- [one-liner about tech stack]

### 3. Structure
See .agent/prime/STRUCTURE.md
- [one-liner about where files go]

### 4. Conventions
See .agent/prime/CONVENTIONS.md
- [one-liner about naming patterns]

### 5. Architecture
See .agent/prime/ARCHITECTURE.md
- [one-liner about system design]

### 6. Testing
See .agent/prime/TESTING.md
- [one-liner about test strategy]
```

**Step 2: Verify file created**

Run: `cat plugins/dev-workflow/skills/init/templates/CLAUDE.md`
Expected: Shows full CLAUDE.md template

---

## Task 12: Update SKILL.md for /init

**Files:**
- Modify: `plugins/dev-workflow/skills/init/SKILL.md`

**Step 1: Rewrite SKILL.md**

```markdown
---
name: init
description: Initialize a project with the .agent/ folder structure for Claude and agents. Creates canonical workflow folders and prime/ reference templates.
---

# /init

Initialize a project with Michi's canonical `.agent/` folder structure.

## What It Creates

```
.agent/
├── CLAUDE.md           # <200 lines, summary + @imports
├── prime/              # Reference material
│   ├── META.md         # How to maintain docs (invariant)
│   ├── AGENTS.md       # Multi-agent safety (invariant)
│   ├── STACK.md        # Tech stack (template)
│   ├── STRUCTURE.md    # Directory layout (template)
│   ├── CONVENTIONS.md  # Naming patterns (template)
│   ├── ARCHITECTURE.md # System design (template)
│   └── TESTING.md      # Test strategy (template)
├── research/           # /research output
├── design/             # /design output
├── plan/               # /plan output
├── status/             # /status output
├── verify/             # /verify output
└── release/            # /release output

./CLAUDE.md             # Bridge: @.agent/CLAUDE.md
```

## Instructions

1. Create `.agent/` directory structure with all verb folders
2. Copy invariant files from templates (META.md, AGENTS.md) - pre-filled
3. Copy template files from templates (STACK.md, etc.) - section headers + guidelines
4. Copy CLAUDE.md template to `.agent/CLAUDE.md`
5. Replace `{project-name}` with actual project name
6. Handle `./CLAUDE.md`:
   - If not exists: create with content `@.agent/CLAUDE.md`
   - If exists: ask user before replacing

## Templates

Templates are in [templates/](templates/):
- [META.md](templates/META.md) - invariant
- [AGENTS.md](templates/AGENTS.md) - invariant
- [STACK.md](templates/STACK.md) - template
- [STRUCTURE.md](templates/STRUCTURE.md) - template
- [CONVENTIONS.md](templates/CONVENTIONS.md) - template
- [ARCHITECTURE.md](templates/ARCHITECTURE.md) - template
- [TESTING.md](templates/TESTING.md) - template
- [CLAUDE.md](templates/CLAUDE.md) - template

## Workflow

Part of: init → prime → research → design → plan → implement → status → verify → release → retro
```

**Step 2: Verify SKILL.md updated**

Run: `cat plugins/dev-workflow/skills/init/SKILL.md | head -30`
Expected: Shows new SKILL.md header with updated name and description

---

## Task 13: Create stub skills

**Files:**
- Create: `plugins/dev-workflow/skills/research/SKILL.md`
- Create: `plugins/dev-workflow/skills/design/SKILL.md`
- Create: `plugins/dev-workflow/skills/plan/SKILL.md`
- Create: `plugins/dev-workflow/skills/status/SKILL.md`
- Create: `plugins/dev-workflow/skills/verify/SKILL.md`
- Create: `plugins/dev-workflow/skills/release/SKILL.md`

**Step 1: Create research skill stub**

```bash
mkdir -p plugins/dev-workflow/skills/research
```

```markdown
---
name: research
description: Conduct discovery and exploration for a project. Outputs to .agent/research/. Part of workflow: init → prime → research → design → plan → implement → status → verify → release → retro
---

# /research

Research and discovery for the project.

## Output

Writes to: `.agent/research/`

## Status

🚧 Stub - not yet implemented
```

**Step 2: Create design skill stub**

```bash
mkdir -p plugins/dev-workflow/skills/design
```

```markdown
---
name: design
description: Brainstorm and create design specs. Outputs to .agent/design/. Part of workflow: init → prime → research → design → plan → implement → status → verify → release → retro
---

# /design

Design and specification creation.

## Output

Writes to: `.agent/design/`

## Status

🚧 Stub - not yet implemented
```

**Step 3: Create plan skill stub**

```bash
mkdir -p plugins/dev-workflow/skills/plan
```

```markdown
---
name: plan
description: Create implementation plans. Outputs to .agent/plan/. Part of workflow: init → prime → research → design → plan → implement → status → verify → release → retro
---

# /plan

Implementation planning.

## Output

Writes to: `.agent/plan/`

## Status

🚧 Stub - not yet implemented
```

**Step 4: Create status skill stub**

```bash
mkdir -p plugins/dev-workflow/skills/status
```

```markdown
---
name: status
description: Track current project state and milestones. Reads/writes .agent/status/. Part of workflow: init → prime → research → design → plan → implement → status → verify → release → retro
---

# /status

Project status tracking.

## Output

Reads/writes: `.agent/status/`

## Status

🚧 Stub - not yet implemented
```

**Step 5: Create verify skill stub**

```bash
mkdir -p plugins/dev-workflow/skills/verify
```

```markdown
---
name: verify
description: Run verification and create reports. Outputs to .agent/verify/. Part of workflow: init → prime → research → design → plan → implement → status → verify → release → retro
---

# /verify

Verification and testing reports.

## Output

Writes to: `.agent/verify/`

## Status

🚧 Stub - not yet implemented
```

**Step 6: Create release skill stub**

```bash
mkdir -p plugins/dev-workflow/skills/release
```

```markdown
---
name: release
description: Create changelogs and release notes. Outputs to .agent/release/. Part of workflow: init → prime → research → design → plan → implement → status → verify → release → retro
---

# /release

Release management and changelogs.

## Output

Writes to: `.agent/release/`

## Status

🚧 Stub - not yet implemented
```

**Step 7: Verify all stubs created**

Run: `ls plugins/dev-workflow/skills/`
Expected: `design  init  plan  prime  release  research  retro  status  verify`

---

## Task 14: Update plugin README.md

**Files:**
- Modify: `plugins/dev-workflow/README.md`

**Step 1: Rewrite README.md**

```markdown
# dev-workflow

Michi's canonical workflow for Claude and agents.

## Installation

```bash
/plugin marketplace add bugroger/overrides-marketplace
/plugin install dev-workflow@overrides-marketplace
```

## The `.agent/` Convention

All project metadata lives in a single `.agent/` folder:

```
.agent/
├── CLAUDE.md       # <200 lines, summary + @imports from prime/
├── prime/          # Reference material (invariant + templates)
├── research/       # Discovery, exploration
├── design/         # Specs, brainstorming output
├── plan/           # Implementation plans
├── status/         # Current state, milestones
├── verify/         # Verification reports
└── release/        # Changelogs, release notes
```

**Bridge:** `./CLAUDE.md` contains only `@.agent/CLAUDE.md`

## Workflow

```
init → prime → research → design → plan → implement → status → verify → release → retro
```

| Skill | Folder | Purpose |
|-------|--------|---------|
| `/init` | creates `.agent/` | Initialize structure |
| `/prime` | reads `prime/` | Load project context |
| `/research` | writes `research/` | Discovery, exploration |
| `/design` | writes `design/` | Brainstorming output |
| `/plan` | writes `plan/` | Implementation plans |
| `/status` | reads/writes `status/` | Current state |
| `/verify` | writes `verify/` | Verification reports |
| `/release` | writes `release/` | Changelogs, notes |
| `/retro` | reads all | Session retrospective |

## File Conventions

- **UPPERCASE.md** — Invariant meta files (always exist, same structure)
- **lowercase.md** — Variant files (plans, research docs, etc.)

## Skills

| Skill | Status | Description |
|-------|--------|-------------|
| `/init` | ✅ | Initialize `.agent/` structure |
| `/prime` | ✅ | Load project context |
| `/research` | 🚧 | Discovery and exploration |
| `/design` | 🚧 | Brainstorming and specs |
| `/plan` | 🚧 | Implementation plans |
| `/status` | 🚧 | Project state tracking |
| `/verify` | 🚧 | Verification reports |
| `/release` | 🚧 | Changelogs and releases |
| `/retro` | ✅ | Session retrospective |

## License

MIT
```

**Step 2: Verify README.md updated**

Run: `cat plugins/dev-workflow/README.md | head -30`
Expected: Shows new README header

---

## Task 15: Update plugin.json version

**Files:**
- Modify: `plugins/dev-workflow/.claude-plugin/plugin.json`

**Step 1: Update plugin.json**

```json
{
  "name": "dev-workflow",
  "description": "Michi's canonical workflow for Claude and agents. Initialize projects with .agent/ structure and workflow skills.",
  "version": "0.1.0",
  "author": {
    "name": "bugroger"
  }
}
```

**Step 2: Verify plugin.json updated**

Run: `cat plugins/dev-workflow/.claude-plugin/plugin.json`
Expected: Shows version 0.1.0 and updated description

---

## Task 16: Update marketplace.json

**Files:**
- Modify: `.claude-plugin/marketplace.json`

**Step 1: Update dev-workflow entry in marketplace.json**

Find the dev-workflow entry and update version to `0.1.0` and description to match plugin.json.

**Step 2: Verify marketplace.json updated**

Run: `grep -A5 '"dev-workflow"' .claude-plugin/marketplace.json`
Expected: Shows version 0.1.0

---

## Task 17: Commit all changes

**Step 1: Check status**

Run: `git status`
Expected: Shows all changed files

**Step 2: Stage changes**

Run: `git add plugins/dev-workflow/ .claude-plugin/marketplace.json`

**Step 3: Commit**

Run:
```bash
git commit -m "$(cat <<'EOF'
Refactor init-claude-md to init with .agent/ convention

- Rename init-claude-md skill to init
- Add .agent/ folder structure with verb-based workflow folders
- Add invariant templates: META.md, AGENTS.md
- Add project templates: STACK.md, STRUCTURE.md, CONVENTIONS.md, ARCHITECTURE.md, TESTING.md
- Add CLAUDE.md template with <200 line structure
- Create stub skills: research, design, plan, status, verify, release
- Remove symlink-plugins skill
- Update README.md with workflow documentation
- Bump version to 0.1.0

Workflow: init → prime → research → design → plan → implement → status → verify → release → retro

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
EOF
)"
```

**Step 4: Verify commit**

Run: `git log --oneline -1`
Expected: Shows commit message

---

*Plan complete: 17 tasks*
