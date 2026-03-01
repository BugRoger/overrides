# `/init` Skill Design

## Overview

Refactor `init-claude-md` → `init`. Initialize projects with Michi's canonical convention: a single `.agent/` dotfolder containing all project metadata for Claude and agents.

## Problem

- Project context scattered across multiple locations
- No canonical structure for agent-relevant metadata
- CLAUDE.md files grow too large (>200 lines reduces adherence)
- No alignment between skills in the workflow loop

## Solution

A standardized `.agent/` folder structure that:
- Consolidates all project meta in one location
- Aligns with workflow: init → prime → research → design → plan → implement → status → verify → release → retro
- Keeps CLAUDE.md under 200 lines via imports and references
- Provides invariant defaults + project-specific templates

---

## Folder Structure

```
.agent/
├── CLAUDE.md              # <200 lines, summary + @imports
├── prime/                 # /prime — reference material
│   ├── META.md            # invariant: how to maintain docs
│   ├── AGENTS.md          # invariant: multi-agent safety rules
│   ├── STACK.md           # template: tech stack
│   ├── STRUCTURE.md       # template: directory layout
│   ├── CONVENTIONS.md     # template: naming patterns
│   ├── ARCHITECTURE.md    # template: system design
│   └── TESTING.md         # template: test strategy
├── research/              # /research — discovery, exploration
├── design/                # /design — specs, brainstorming output
├── plan/                  # /plan — implementation plans
├── status/                # /status — current state, milestones
├── verify/                # /verify — verification reports
└── release/               # /release — changelogs, release notes

./CLAUDE.md                # bridge: contains only @.agent/CLAUDE.md
```

---

## Conventions

### Naming
- **UPPERCASE** — invariant meta files (always exist, same structure)
- **lowercase** — variant files (plans, research docs, etc.)

### Folders
- **Verb-based** — aligned with workflow commands
- **Workflow:** init → prime → research → design → plan → implement → status → verify → release → retro

### Relationship to `.claude/`
- **Coexist** — `.agent/` and `.claude/` are independent
- **Bridge** — `./CLAUDE.md` contains only `@.agent/CLAUDE.md`
- `.claude/` stays for Claude Code native: rules/, settings, auto memory

---

## CLAUDE.md Structure

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

**Key points:**
- 1 import: META.md (always in context, <200 lines total)
- 6 references: Claude reads on demand when needed
- Prime Directives: inline only

---

## File Types

### Invariant (pre-filled, universal)

| File | Content |
|------|---------|
| `META.md` | How to maintain docs, writing guidelines, summary update rules |
| `AGENTS.md` | Multi-agent safety, commit rules, git workflow |

### Template (structure + guidelines, project fills in)

| File | Content |
|------|---------|
| `STACK.md` | Tech stack, dependencies, versions |
| `STRUCTURE.md` | Directory layout, where files go, naming |
| `CONVENTIONS.md` | Code patterns, naming conventions, style |
| `ARCHITECTURE.md` | System design, components, data flow |
| `TESTING.md` | Test strategy, commands, coverage |

---

## Skill Behavior

### `/init`

1. Create `.agent/` folder structure (all verb folders)
2. Create invariant files (META.md, AGENTS.md) with pre-filled content
3. Create template files (STACK.md, etc.) with section headers + guidelines
4. Create `.agent/CLAUDE.md` with summary structure
5. Handle `./CLAUDE.md`:
   - If not exists: create bridge with `@.agent/CLAUDE.md`
   - If exists: ask user before replacing with bridge

### Workflow skill alignment

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

---

## Plugin Structure

```
plugins/dev-workflow/
├── README.md              # Plugin documentation
├── skills/
│   ├── init/              # refactor from init-claude-md
│   │   ├── SKILL.md
│   │   └── templates/
│   │       ├── META.md
│   │       ├── AGENTS.md
│   │       ├── STACK.md
│   │       ├── STRUCTURE.md
│   │       ├── CONVENTIONS.md
│   │       ├── ARCHITECTURE.md
│   │       ├── TESTING.md
│   │       └── CLAUDE.md
│   ├── prime/             # exists
│   ├── research/          # stub
│   ├── design/            # stub
│   ├── plan/              # stub
│   ├── status/            # stub
│   ├── verify/            # stub
│   ├── release/           # stub
│   └── retro/             # exists
└── .claude-plugin/
    └── plugin.json
```

### Skill Status

| Skill | Status | Action |
|-------|--------|--------|
| `/init` | refactor | Rename from init-claude-md, implement new structure |
| `/prime` | exists | Update to read from `.agent/prime/` |
| `/research` | stub | Create minimal SKILL.md |
| `/design` | stub | Create minimal SKILL.md |
| `/plan` | stub | Create minimal SKILL.md |
| `/status` | stub | Create minimal SKILL.md |
| `/verify` | stub | Create minimal SKILL.md |
| `/release` | stub | Create minimal SKILL.md |
| `/retro` | exists | No changes needed |
| `/symlink-plugins` | remove | Delete skill folder |

### README.md

Documents:
- What `.agent/` is — the canonical dotfolder convention
- Workflow loop — init → prime → research → design → plan → implement → status → verify → release → retro
- Folder purposes — what each verb-folder contains
- File conventions — UPPERCASE invariant, lowercase variant
- How skills relate — `/init` creates, `/prime` loads, etc.
- CLAUDE.md bridge — why `./CLAUDE.md` imports `.agent/CLAUDE.md`

---

## Migration

Refactor existing `overrides/CLAUDE.md` to new structure:

1. Create `.agent/` folder with full structure
2. Extract current sections to `prime/` files:
   - META - MAINTAINING THIS DOCUMENT → `META.md`
   - Agent-Specific Notes → `AGENTS.md`
   - Refactoring → merge into `AGENTS.md` or `CONVENTIONS.md`
3. Create `.agent/CLAUDE.md` with summary + META.md import
4. Replace `./CLAUDE.md` with bridge: `@.agent/CLAUDE.md`

This serves as the reference implementation.

---

## Open Questions

1. Should `/prime` auto-populate template files by analyzing codebase?
2. Should there be a `/migrate` command to convert existing CLAUDE.md?
3. How should variant files in verb folders be named? (date prefix? topic?)

---

*Design approved: 2026-03-01*
