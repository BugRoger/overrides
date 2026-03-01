# `/design` Skill Design

## Overview

Implement the `/design` skill for dev-workflow by copying the brainstorming skill (dev-skills-superpowers) verbatim with minimal adaptations.

## Decisions

| Aspect | Brainstorming | /design |
|--------|---------------|---------|
| Output location | `.plans/` | `.agent/design/` |
| Filename | `YYYY-MM-DD-<topic>-design.md` | `YYYY-MM-DD-<topic>.md` |
| Terminal state | Invoke `writing-plans` | None (finish after doc) |
| Plugin | dev-skills-superpowers | dev-workflow |

## Changes from Brainstorming

1. **Frontmatter** — name: `design`, description updated for dev-workflow context
2. **Title** — `# /design` instead of `# Brainstorming Ideas Into Designs`
3. **Checklist** — Step 5 path changed to `.agent/design/`, step 6 removed
4. **Process flow** — Terminal state is "Write design doc", removed `writing-plans` edge
5. **Removed** — "After the Design" section entirely
6. **Added** — "Output" and "Workflow" sections (dev-workflow conventions)

## What Stays the Same

- HARD-GATE on no implementation before approval
- Anti-pattern warning about "too simple"
- The Process section (questions, approaches, presenting)
- Key Principles

## Files

```
plugins/dev-workflow/skills/design/
└── SKILL.md    # Rewrite from stub
```

No templates needed — process skill, not scaffolding skill.

---

*Design approved: 2026-03-01*
