# Usage Guide

Comprehensive patterns and examples for ACF Tools Lite plugins.

---

## Quick Reference

| Plugin | Enable | Use Case | Disable |
|--------|--------|----------|---------|
| **acf-challenger-mode** | `/plugin enable acf-challenger-mode` | Logic validation, requirements clarification | `/plugin disable acf-challenger-mode` |
| **acf-nitro** | `/plugin enable acf-nitro` | Parallel execution enforcement | `/plugin disable acf-nitro` |
| **acf-power-commit** | Always enabled (SessionStart hook) | Conventional commits via `/commit` | `/plugin uninstall acf-power-commit` |

---

## acf-challenger-mode Usage

### Purpose
Hostile logic enforcement - attacks reasoning gaps, logic holes, and inconsistencies.

### When to Enable

**Before Implementation**:
- Validating requirements
- Reviewing architecture decisions
- Clarifying ambiguous specifications

**During Review**:
- Checking agent output for contradictions
- Validating multi-step logic
- Ensuring consistency across components

**In Discussions**:
- Forcing rigorous thinking
- Challenging assumptions
- Exposing unstated premises

---

### Example Workflows

#### Workflow 1: Requirements Clarification

**Context**: Vague feature request from stakeholder

**Steps**:
```bash
# 1. Enable Challenger
/plugin enable acf-challenger-mode

# 2. Present requirements
User: "We need a scalable user authentication system that's secure and fast"

# 3. Challenger attacks vague terms
Claude: "Define 'scalable' - users? requests/sec? geographic regions?
         Define 'secure' - OAuth2? JWT? MFA required?
         Define 'fast' - response time threshold? 50ms? 200ms?
         Missing: user data model, session management, password policy"

# 4. Iterate until specific
User: "Authentication for 10k concurrent users, <200ms response, JWT with refresh tokens"

Claude: "Better. Still missing:
         - Token expiration time?
         - Refresh token rotation?
         - Rate limiting strategy?
         - Password requirements?"

# 5. Disable when requirements clear
/plugin disable acf-challenger-mode
```

**Outcome**: Concrete, testable requirements replacing vague hand-waving.

---

#### Workflow 2: Architecture Review

**Context**: Reviewing proposed system design

**Steps**:
```bash
# 1. Enable Challenger
/plugin enable acf-challenger-mode

# 2. Present architecture
User: "API Gateway → Service Mesh → Microservices → PostgreSQL cluster"

# 3. Challenger attacks holes
Claude: "Logic failure - you want high availability but single PostgreSQL primary.
         Contradiction - 'service mesh' for 3 services? Overhead exceeds benefit.
         Missing: how does Gateway handle service discovery?
         Missing: data consistency model across microservices?
         Your premise assumes distributed transactions work magically."

# 4. Iterate on design
User: "Actually we need read replicas for PostgreSQL, and we'll use eventual consistency"

Claude: "Define 'eventual consistency' timeline. 1ms? 1sec? 10sec?
         How do you handle write conflicts?
         What's your read vs write ratio to justify replicas?"

# 5. Disable when design solid
/plugin disable acf-challenger-mode
```

**Outcome**: Rigorous architecture with explicit trade-offs documented.

---

#### Workflow 3: Multi-Agent Output Validation

**Context**: Multiple agents produced code, need consistency check

**Steps**:
```bash
# 1. Enable Challenger
/plugin enable acf-challenger-mode

# 2. Review agent outputs
User: "Agent 1 says use Redis for caching. Agent 2 uses in-memory cache. Agent 3 has no cache."

# 3. Challenger catches contradiction
Claude: "Contradiction detected across agents:
         - Agent 1: external cache (Redis)
         - Agent 2: internal cache (in-memory)
         - Agent 3: no cache

         These are mutually exclusive approaches. Pick ONE strategy:
         1. Redis (shared, persistent, network overhead)
         2. In-memory (fast, isolated, memory cost)
         3. No cache (simplest, may have performance issues)

         Justify your choice with data access patterns and latency requirements."

# 4. Disable after alignment
/plugin disable acf-challenger-mode
```

**Outcome**: Consistent approach across all agent outputs.

---

### Best Practices

**DO**:
- ✅ Enable for requirements gathering and architecture
- ✅ Use to challenge your own assumptions
- ✅ Iterate until no gaps remain
- ✅ Disable after validation complete

**DON'T**:
- ❌ Keep enabled for implementation (too hostile for coding)
- ❌ Use when requirements already crystal clear
- ❌ Take criticism personally (it's validating logic, not judging you)

---

## acf-nitro Usage

### Purpose
Parallel execution enforcement - catches sequential violations, calculates time waste.

### When to Enable

**Task Planning**:
- Creating TodoWrite lists
- Ensuring batch operations
- Planning multi-step workflows

**Multi-Agent Workflows**:
- Spawning Task agents
- Coordinating specialist agents
- Parallel research tasks

**File Operations**:
- Reading multiple files
- Parallel grep searches
- Batch bash operations

---

### Example Workflows

#### Workflow 1: TodoWrite Batching

**Context**: Planning multi-step implementation

**Steps**:
```bash
# 1. Enable Nitro
/plugin enable acf-nitro

# 2. Start task planning
User: "Create tasks for new API endpoint"

# 3. If Claude tries sequential TodoWrite, Nitro catches it
Claude: [Makes TodoWrite call 1]
Nitro: "🏎️ SEQUENTIAL TodoWrite DETECTED!
        You're running drag races back-to-back instead of side-by-side!

        ⏱️ PERFORMANCE IMPACT:
        - 4 extra round-trips
        - ~12-20 seconds wasted
        - 80% slower than batching

        💨 NITRO BOOST:
        TodoWrite({
          todos: [
            { content: 'Task 1', status: 'pending', ... },
            { content: 'Task 2', status: 'pending', ... },
            { content: 'Task 3', status: 'pending', ... },
            { content: 'Task 4', status: 'pending', ... },
            { content: 'Task 5', status: 'pending', ... }
          ]
        })

        Single call. All todos. Maximum speed! 🏁"

# 4. Disable after planning
/plugin disable acf-nitro
```

**Outcome**: Single TodoWrite call with all tasks batched.

---

#### Workflow 2: Parallel Task Spawning

**Context**: Need multiple specialist agents

**Steps**:
```bash
# 1. Enable Nitro
/plugin enable acf-nitro

# 2. Request multi-agent work
User: "I need backend, frontend, and database agents to implement this feature"

# 3. If Claude spawns sequentially, Nitro enforces parallel
Claude: [About to spawn Task agents sequentially]
Nitro: "🏎️ SEQUENTIAL AGENT SPAWNING!

        You're running agents ONE-BY-ONE? That's running three drag races
        back-to-back instead of side-by-side!

        ⏱️ PERFORMANCE IMPACT:
        - Sequential: 3 agents × 2 min each = 6 minutes total
        - Parallel: max(2, 2, 2) = 2 minutes total
        - 67% time waste
        - 4 MINUTES LOST

        💨 NITRO BOOST:
        Single message with multiple Task calls:
        Task({ subagent_type: 'backend-engineer', ... })
        Task({ subagent_type: 'frontend-engineer', ... })
        Task({ subagent_type: 'database-engineer', ... })

        All agents execute in parallel! 🚀"

# 4. Claude spawns parallel
Claude: [Makes 3 Task calls in one message]

# 5. Disable after spawning
/plugin disable acf-nitro
```

**Outcome**: 3 agents execute in parallel, saving 4 minutes.

---

#### Workflow 3: Parallel File Reads

**Context**: Need to analyze multiple files

**Steps**:
```bash
# 1. Enable Nitro
/plugin enable acf-nitro

# 2. Request file analysis
User: "Read config.ts, api.ts, and utils.ts"

# 3. If Claude reads sequentially, Nitro catches
Claude: [About to Read files one by one]
Nitro: "🏎️ SEQUENTIAL TOOL CALLS DETECTED!

        Three independent Read operations running sequentially?
        You're cruising when you should be RACING!

        ⏱️ PERFORMANCE IMPACT:
        - 2 extra round-trips
        - ~3-6 seconds wasted
        - 50% slower than parallel

        🏁 CROSS THE FINISH LINE FASTER:
        Read({ file_path: 'config.ts' })
        Read({ file_path: 'api.ts' })
        Read({ file_path: 'utils.ts' })

        Single message, all reads parallel! 💨"

# 4. Claude reads parallel
Claude: [Makes 3 Read calls in one message]

# 5. Disable after reads
/plugin disable acf-nitro
```

**Outcome**: 3 files read in parallel, saving 3-6 seconds.

---

### Best Practices

**DO**:
- ✅ Enable during task planning and multi-agent coordination
- ✅ Use to optimize TodoWrite batching
- ✅ Apply to parallel file operations
- ✅ Disable after planning phase complete

**DON'T**:
- ❌ Keep enabled when operations have dependencies (Nitro respects dependencies)
- ❌ Use for single-task workflows (no parallelization possible)
- ❌ Ignore time waste calculations (they're accurate!)

---

## acf-power-commit Usage

### Purpose
Conventional commit enforcement - creates atomic, convention-compliant git commits with explicit file staging.

### When to Use

**Creating Commits**:
- After completing implementation work
- When ready to commit changes
- Need conventional commit format
- Want atomic commits per logical change

**Enforcing Standards**:
- Project has git commit conventions
- Team requires consistent commit messages
- Need explicit file staging discipline
- Want to prevent `git add -A`

---

### Example Workflows

#### Workflow 1: Basic Commit Creation

**Context**: Completed feature implementation, ready to commit

**Steps**:
```bash
# Make changes to your code
# ...

# Create commits using /commit command
/commit

# Power Commit analyzes changes
# Output: "Done. Created 3 commits:"
# | Hash    | Type | Scope | Subject                          |
# | abc123  | feat | api   | add user authentication endpoint |
# | def456  | test | api   | add auth endpoint tests          |
# | ghi789  | docs | api   | update API documentation         |
```

**Outcome**: Three atomic commits, each following conventional format, explicitly staged.

---

#### Workflow 2: Custom Project Conventions

**Context**: Project has specific commit conventions

**Steps**:
```bash
# 1. Edit project conventions
vim docs/acf/git/commit-conventions.md

# 2. Customize:
# - Allowed commit types
# - Scope rules
# - Subject format
# - Staging rules

# 3. Reload session
/clear

# 4. Create commits (now uses custom conventions)
/commit

# Power Commit uses your custom conventions
# Enforces project-specific rules
```

**Outcome**: Commits follow project-specific conventions, not just defaults.

---

#### Workflow 3: Multi-Scope Changes

**Context**: Changes span multiple areas

**Steps**:
```bash
# Modified files:
# - src/api/auth.ts (new feature)
# - src/api/auth.test.ts (tests)
# - docs/api.md (documentation)
# - README.md (readme update)

/commit

# Power Commit groups by scope:
# Commit 1: feat(api): add user authentication
#   - src/api/auth.ts
# Commit 2: test(api): add auth tests
#   - src/api/auth.test.ts
# Commit 3: docs(api): update API documentation
#   - docs/api.md
# Commit 4: docs: update README with auth instructions
#   - README.md
```

**Outcome**: Four atomic commits, each focused on single logical change.

---

### Best Practices

**DO**:
- ✅ Use `/commit` for all commits (enforces conventions)
- ✅ Customize conventions in `docs/acf/git/commit-conventions.md`
- ✅ Reload session (`/clear`) after editing conventions
- ✅ Let Power Commit group changes by scope

**DON'T**:
- ❌ Manually run `git add -A` (Power Commit prevents this)
- ❌ Create commits outside `/commit` (bypasses enforcement)
- ❌ Mix unrelated changes in one commit (atomic commits required)
- ❌ Edit conventions without reloading session

---

### Commit Message Format

Power Commit enforces this format:

```
<type>(<scope>): <subject>

[optional body]
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`

**Subject rules**:
- Imperative mood ("add feature" not "added feature")
- No capitalization
- No period at end
- Max 50 characters

**Example commits**:
```
feat(api): add user authentication endpoint
fix(auth): resolve token expiration bug
docs: update installation guide
test(api): add integration tests for auth flow
refactor(db): extract query builder to separate module
```

---

### Conventions File

**Location**: `docs/acf/git/commit-conventions.md`

**Behavior**:
- Created from template on first session (if missing)
- Loaded via SessionStart hook every session
- Customizable per project
- Reload with `/clear` after editing

**Customization example**:
```markdown
## Commit Message Format

<type>(<scope>): <subject>

**Types**: feat, fix, docs, refactor, test, chore, breaking

**Scopes**: api, ui, db, auth, deploy

**Subject**: Max 72 chars, imperative mood
```

---

## Combined Usage

### When to Use Multiple Plugins

**Cognitive plugins (Challenger, Nitro): Never simultaneously**
- Challenger and Nitro have different personalities (rigorous vs enthusiastic)
- Different enforcement modes can conflict
- Use sequentially, not together

**Power Commit: Always active**
- SessionStart hook loads conventions automatically
- `/commit` command available anytime
- Compatible with all other plugins

**Recommended workflow**:
```bash
# Phase 1: Validate requirements (Challenger)
/plugin enable acf-challenger-mode
# ... requirements clarification ...
/plugin disable acf-challenger-mode

# Phase 2: Plan implementation (Nitro)
/plugin enable acf-nitro
# ... task planning with parallel optimization ...
/plugin disable acf-nitro

# Phase 3: Implement (no cognitive plugins)
# ... actual coding work ...

# Phase 4: Commit (Power Commit always active)
/commit
# ... creates conventional commits ...
```

---

## Performance Metrics

### Nitro Time Savings (Real Data)

| Pattern | Sequential | Parallel | Savings | Use Case |
|---------|-----------|----------|---------|----------|
| **TodoWrite (5 tasks)** | 15-20 sec | 3 sec | 80% | Task planning |
| **Task agents (3)** | 6 min | 2 min | 67% | Multi-agent work |
| **Read files (5)** | 10 sec | 4 sec | 60% | Code analysis |
| **Grep searches (4)** | 12 sec | 5 sec | 58% | Pattern search |

**Cumulative savings**: 4-6 minutes per workflow with multiple parallel opportunities.

---

## Advanced Patterns

### Pattern 1: Iterative Requirements Refinement

**Use Challenger in loop**:
```bash
/plugin enable acf-challenger-mode

# Iteration 1: Initial requirements
User: "Build user management system"
Claude: [Attacks vague terms, demands specifics]

# Iteration 2: Add specifics
User: "JWT auth, 10k users, <200ms response"
Claude: [Finds new gaps]

# Iteration 3: Fill gaps
User: "Refresh tokens, rate limiting, bcrypt passwords"
Claude: [Validates consistency, checks for contradictions]

# Iteration 4: Requirements solid
Claude: "No logical gaps detected. Requirements are concrete and testable."

/plugin disable acf-challenger-mode
```

---

### Pattern 2: Parallel Research Tasks

**Use Nitro for multi-topic research**:
```bash
/plugin enable acf-nitro

User: "Research authentication methods, database options, and deployment strategies"

# Nitro enforces parallel agent spawning
Claude: [Spawns 3 Task research agents in parallel]
# Agent 1: Authentication research
# Agent 2: Database research
# Agent 3: Deployment research
# All execute simultaneously

/plugin disable acf-nitro
```

**Savings**: 10-15 minutes vs sequential research.

---

### Pattern 3: Architecture Review → Task Planning → Commit

**Challenger → Nitro → Power Commit**:
```bash
# Step 1: Validate architecture (Challenger)
/plugin enable acf-challenger-mode
User: [Presents system design]
Claude: [Attacks logic holes]
# ... iterations until solid ...
/plugin disable acf-challenger-mode

# Step 2: Plan implementation (Nitro)
/plugin enable acf-nitro
User: "Break this architecture into tasks"
Claude: [Creates TodoWrite with all tasks batched]
/plugin disable acf-nitro

# Step 3: Implement (no cognitive plugins)
# ... coding work ...

# Step 4: Commit changes (Power Commit)
/commit
Claude: [Creates atomic conventional commits]
# Done. Created 5 commits with proper types and scopes
```

---

### Pattern 4: Customized Conventions Per Project

**Project-specific git standards**:
```bash
# Setup phase (once per project)
# 1. Install Power Commit
/plugin install acf-power-commit@acf-tools-lite

# 2. Customize conventions for project
vim docs/acf/git/commit-conventions.md
# - Define allowed types (feat, fix, breaking, etc.)
# - Define scopes (api, ui, db, etc.)
# - Set subject rules (length, format)
# - Document staging rules

# 3. Reload to activate
/clear

# Usage (every commit)
/commit
# Uses your custom conventions automatically
```

---

## Troubleshooting

### Challenger Too Aggressive

**Problem**: Challenger attacks even solid requirements

**Solution**:
- Provide more specific details upfront
- Cite data/benchmarks to back claims
- Be explicit about constraints and trade-offs
- Disable if requirements truly are complete

### Nitro Misses Parallel Opportunity

**Problem**: Sequential execution not caught

**Solution**:
- Verify Nitro is enabled: `/plugin list`
- Check if operations have dependencies (Nitro respects those)
- Restart session if behavior changed
- Report issue with example

### Plugin Conflict

**Problem**: Both cognitive plugins (Challenger + Nitro) enabled, confusing output

**Solution**:
- **Never enable both simultaneously**
- Use sequential pattern (Challenger first, then Nitro)
- Disable one before enabling the other
- Power Commit is compatible with all plugins

### Power Commit Convention Not Loading

**Problem**: Changes to `docs/acf/git/commit-conventions.md` not applied

**Solution**:
- Reload session after editing: `/clear`
- Verify file location: `docs/acf/git/commit-conventions.md`
- Check file syntax (valid markdown)
- Verify conventions are in markdown format, not code blocks

### Power Commit Creates Wrong Commit Type

**Problem**: Commit type doesn't match change (e.g., "docs" instead of "feat")

**Solution**:
- Power Commit infers type from file changes
- If wrong, provide explicit scope in conversation: "This is a feature change"
- Customize type mappings in `docs/acf/git/commit-conventions.md`
- Review commit before push, amend if needed

---

## Tips & Tricks

### Tip 1: Pre-emptive Enabling
Enable Challenger BEFORE presenting vague requirements - forces you to be specific from the start.

### Tip 2: Nitro for Audits
Enable Nitro to audit existing code for sequential inefficiencies.

### Tip 3: Document Decisions
When Challenger identifies trade-offs, document them explicitly in architecture docs.

### Tip 4: Batch Everything
With Nitro active, think "what else could run in parallel?" - file reads, agent spawns, searches.

### Tip 5: Iterate Until Silent
Keep iterating with Challenger until it has no more objections - that's when requirements are solid.

### Tip 6: Customize Conventions Early
Set up `docs/acf/git/commit-conventions.md` at project start - prevents inconsistent commits later.

### Tip 7: Use Power Commit for All Commits
Always use `/commit` instead of manual git commands - ensures convention compliance.

### Tip 8: Review Generated Commits
Power Commit creates commits automatically, but review with `git log` before pushing.

---

## Next Steps

**After mastering these patterns**:
1. Read plugin READMEs for complete behavior documentation
2. Explore ACF full toolkit for more patterns: https://github.com/fib7/acf-tools
3. Share your usage patterns and improvements

---

**Last Updated**: 2025-11-10
