# overrides - Claude Code Guidelines
This document contains project-specific guidelines and best practices for Claude Code when working on this codebase.

## Important Prime Directives
- You must always refer to me as Michi

## Rules Summary

### 1. Meta - Maintaining This Document
See all rules in section **## META - MAINTAINING THIS DOCUMENT**
1. When adding new rules to detailed sections below, always update this summary section with a corresponding one-sentence summary
2. Each rule in this summary must reference its corresponding detailed section
3. Follow the writing guidelines when adding new rules

### 2. Agent-Specific Notes
See all rules in section **## Agent-Specific Notes**
1. ALWAYS verify in code; NEVER guess
2. NEVER create/apply/drop git stash entries unless explicitly requested
3. ALWAYS assume other agents may be working; keep unrelated WIP untouched
4. NEVER create/remove/modify git worktrees unless explicitly requested
5. NEVER switch branches unless explicitly requested
6. When user says "push": you may `git pull --rebase` to integrate latest changes
7. When user says "commit": scope to your changes only
8. When user says "commit all": commit everything in grouped chunks

### 3. Refactoring
See all rules in section **## Refactoring**
1. Implementation plans in `.plans/` are authoritative over existing documentation during refactoring

### 4. Plugin Development
See all rules in section **## Plugin Development**
1. ALWAYS keep `marketplace.json` and `plugin.json` in sync when modifying plugins
2. ALWAYS bump versions in both `marketplace.json` and `plugin.json`

---

## META - MAINTAINING THIS DOCUMENT

### Keeping the Summary Section Up to Date

**Rule**: Whenever you add, modify, or remove rules in the detailed sections below, you MUST update the "Rules Summary" section at the top of this document.

**Process**:
1. Add the new rule to the appropriate detailed section below
2. Add a corresponding one-sentence summary to the Rules Summary section
3. Ensure the summary references the detailed section using the format: "See all rules in section **## SECTION NAME**"
4. If creating a new topic, add both a new numbered topic in the summary AND a new detailed section below

**Example**:
If you add a new rule about async patterns in the detailed "ASYNC PATTERNS" section, you must add:
- A new topic in Rules Summary: "4. Async Patterns - See all rules in section **## ASYNC PATTERNS**"
- A one-sentence summary under that topic

### Writing Effective Guidelines

When adding new rules to this document, follow these principles:

**Core Principles (Always Apply):**
1. **Use absolute directives** - Start with "NEVER" or "ALWAYS" for non-negotiable rules
2. **Lead with why** - Explain the problem/rationale before showing the solution (1-3 bullets max)
3. **Be concrete** - Include actual commands/code for project-specific patterns
4. **Minimize examples** - One clear point per code block
5. **Bullets over paragraphs** - Keep explanations concise
6. **Action before theory** - Put immediate takeaways first

**Optional Enhancements (Use Strategically):**
- **Bad/Good examples**: Only when the antipattern is subtle or common
- **"Why" or "Rationale" section**: Keep to 1-3 bullets explaining the underlying reason
- **"Warning Signs" section**: Only for gradual/easy-to-miss violations
- **"General Principle"**: Only when the abstraction is non-obvious
- **Decision trees**: Only for 3+ factor decisions with multiple considerations

**Anti-Bloat Rules:**
- Don't add "Warning Signs" to obvious rules (e.g., "imports at top")
- Don't show bad examples for trivial mistakes
- Don't create decision trees for simple binary choices
- Don't add "General Principle" when the section title already generalizes
- Don't write paragraphs explaining what bullets can convey
- Don't write long "Why" explanations - 1-3 bullets maximum

---

## Agent-Specific Notes

- **High-confidence answers only**: verify in code; do not guess
- **Multi-agent safety**: do not create/apply/drop git stash entries unless explicitly requested (includes `git pull --rebase --autostash`)
- **Multi-agent safety**: assume other agents may be working; keep unrelated WIP untouched; avoid cross-cutting state changes
- **Multi-agent safety**: do not create/remove/modify git worktree checkouts unless explicitly requested
- **Multi-agent safety**: do not switch branches or check out a different branch unless explicitly requested
- **Multi-agent safety**: running multiple agents is OK as long as each agent has its own session
- **When user says "push"**: you may `git pull --rebase` to integrate latest changes (never discard other agents' work)
- **When user says "commit"**: scope to your changes only
- **When user says "commit all"**: commit everything in grouped chunks
- **Unrecognized files**: keep going; focus on your changes and commit only those
- **Reports**: focus on your edits; avoid guard-rail disclaimers unless truly blocked; end with brief "other files present" note only if relevant

---

## Refactoring

- **Implementation plans are authoritative**: when executing a `.plans/*.md` file, the plan takes precedence over existing documentation or code comments that may be outdated
- **Grep for old names**: when renaming/deleting, run `grep -r "old-name" .` to find all references that need updating

---

## Plugin Development

- **Keep manifests in sync**: when adding, renaming, or modifying plugins, ALWAYS update both `.claude-plugin/marketplace.json` and `plugins/<name>/.claude-plugin/plugin.json`
- **Bump versions together**: ALWAYS increment version in both `marketplace.json` and `plugin.json` when making changes
