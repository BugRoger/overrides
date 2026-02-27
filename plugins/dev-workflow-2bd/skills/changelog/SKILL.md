---
description: Summarize session learnings and changes - changelog, summary, what changed, session log
---

# Changelog

Summarize what was learned and changed in this session.

## Format

```markdown
## [Date] Session Retrospective

### Findings Applied
- [Category]: [Brief description] → [Action taken]

### Insights (No Action)
- [What was learned but didn't require changes]

### Proposed (Pending Approval)
- [Changes from Engineering Dance Off awaiting implementation]
```

## Integration

If the project contains a `CHANGELOG.md`:
- Suggest adding the summary as an entry
- Follow the project's existing changelog format

If no changelog exists:
- Present in the format above
- Offer to create `CHANGELOG.md` if the user wants

## Version Bump Checklist

When releasing a new version:

1. **Update CHANGELOG.md** — Add entry with version and date
2. **Update docs changelog** — Mirror the entry in `docs/` if a separate docs changelog exists
3. **Bump ASCII diagram versions** — Search for version strings in ASCII art/diagrams and update them
4. **Commit changes** — Commit all version-related updates
5. **Tag on GitHub** — Create a git tag with the same version number:
   ```bash
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   git push origin vX.Y.Z
   ```
