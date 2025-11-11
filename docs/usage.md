# Usage Guide

Comprehensive patterns and examples for ACF Tools Lite plugins.

---

## Quick Reference

| Plugin | Enable | Use Case | Disable |
|--------|--------|----------|---------|
| **acf-challenger-mode** | `/plugin enable acf-challenger-mode` | Logic validation, requirements clarification | `/plugin disable acf-challenger-mode` |
| **acf-nitro** | `/plugin enable acf-nitro` | Parallel execution enforcement | `/plugin disable acf-nitro` |

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

## Combined Usage

### When to Use Both Plugins

**Never simultaneously** - they serve different purposes and can conflict:
- Challenger is hostile, Nitro is enthusiastic
- Challenger validates logic, Nitro optimizes execution
- Different cognitive modes don't mix well

**Sequential usage pattern**:
```bash
# Phase 1: Validate requirements (Challenger)
/plugin enable acf-challenger-mode
# ... requirements clarification ...
/plugin disable acf-challenger-mode

# Phase 2: Plan implementation (Nitro)
/plugin enable acf-nitro
# ... task planning with parallel optimization ...
/plugin disable acf-nitro

# Phase 3: Implement (no plugins)
# ... actual coding work ...
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

### Pattern 3: Architecture Review → Task Planning

**Challenger then Nitro**:
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

# Step 3: Implement (no plugins)
# ... coding work ...
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

**Problem**: Both plugins enabled, confusing output

**Solution**:
- **Never enable both simultaneously**
- Use sequential pattern (Challenger first, then Nitro)
- Disable one before enabling the other

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

---

## Next Steps

**After mastering these patterns**:
1. Read plugin READMEs for complete behavior documentation
2. Explore ACF full toolkit for more patterns: https://github.com/fib7/acf-tools
3. Share your usage patterns and improvements

---

**Last Updated**: 2025-11-10
