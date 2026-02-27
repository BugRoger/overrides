---
name: parallel-batch-execution
description: Use when executing plans with independent task groups that can run as parallel subagents in the same worktree
---

# Parallel Batch Execution

Execute plan by grouping tasks into independent batches, then launching parallel subagents to work on all batches simultaneously within the same worktree. Each batch uses subagent-driven-development internally.

**Core principle:** Batch independence + parallel subagents = maximum throughput in single worktree

## When to Use

**Use when:**
- Plan has 6+ tasks that can be grouped into 2+ independent batches
- Batches touch different files/subsystems (no conflicts)
- You want N batches completed in time of 1

**Don't use when:**
- Tasks are tightly coupled
- Batches would modify same files (conflicts)
- Plan is small (< 6 tasks) - overhead not worth it

## The Process

### Step 1: Set Up Worktree

**REQUIRED:** Use superpowers:using-git-worktrees to create isolated workspace.

### Step 2: Analyze Plan and Create Batches

Read the plan and group tasks into independent batches:

```markdown
## Batch Analysis

**Batch 1: Authentication (Tasks 1-3)**
- Files: src/auth/*, tests/auth/*
- Independent: Yes

**Batch 2: User Profile (Tasks 4-6)**
- Files: src/profile/*, tests/profile/*
- Independent: Yes

**Batch 3: Notifications (Tasks 7-9)**
- Files: src/notifications/*, tests/notifications/*
- Independent: Yes

**Conflicts:** None - batches touch different subsystems
```

### Step 3: Launch Parallel Subagents

Dispatch one subagent per batch, all in parallel:

```
[Dispatch in parallel]

Subagent 1 → Batch 1 (Tasks 1-3)
  "Implement these tasks using subagent-driven-development approach:
   [Full text of tasks 1-3]"

Subagent 2 → Batch 2 (Tasks 4-6)
  "Implement these tasks using subagent-driven-development approach:
   [Full text of tasks 4-6]"

Subagent 3 → Batch 3 (Tasks 7-9)
  "Implement these tasks using subagent-driven-development approach:
   [Full text of tasks 7-9]"
```

Each subagent:
- Gets full task text (don't make them read the plan)
- Uses subagent-driven-development internally (fresh subagent per task + reviews)
- Works on its designated files only

### Step 4: Collect Results and Complete

When all subagents return:
- Review each batch's changes
- Run full test suite
- Use superpowers:finishing-a-development-branch to complete

## Batch Independence Checklist

Before launching parallel subagents, verify:

- [ ] **No file overlap** - Batches don't modify same files
- [ ] **No import dependencies** - Batch A doesn't import new code from Batch B
- [ ] **No test interference** - Tests don't share mutable state

## Example

```
You: I'm using parallel-batch-execution.

[Set up worktree]
[Read plan: 9 tasks]

Batch analysis:
- Batch 1 (Tasks 1-3): API - src/api/*
- Batch 2 (Tasks 4-6): Frontend - src/components/*
- Batch 3 (Tasks 7-9): Jobs - src/jobs/*

No conflicts. Launching 3 parallel subagents...

[All 3 subagents work simultaneously]

Results:
- Batch 1: ✅ API complete
- Batch 2: ✅ Frontend complete
- Batch 3: ✅ Jobs complete

Running full test suite... All passing.
Using finishing-a-development-branch to complete.
```

## Comparison

| | **subagent-driven-development** | **parallel-batch-execution** |
|---|---|---|
| **Execution** | Sequential (one task at a time) | Parallel (all batches at once) |
| **Throughput** | 1x | Nx (N batches) |
| **Overhead** | Medium | Higher |
| **Best for** | Any plan | Large plans with independent batches |

## Red Flags

**Never:**
- Launch parallel subagents on overlapping files
- Skip batch independence analysis
- Skip the final test suite run

## Integration

**Required workflow skills:**
- **superpowers:using-git-worktrees** - Set up isolated workspace first
- **superpowers:subagent-driven-development** - Each subagent uses this internally
- **superpowers:finishing-a-development-branch** - Complete after all batches done
