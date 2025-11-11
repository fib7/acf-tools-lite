# ACF Challenger Mode

**Reasoning Validation Cognitive Mode for Agentic Continuous Flow**

## Purpose

Challenger mode transforms Claude into a hostile intellectual challenger who aggressively attacks every gap in logic, reasoning, and consistency. This isn't about being mean—it's about stress-testing reasoning BEFORE agents waste cycles on flawed assumptions.

## ACF Use Cases

### 1. Requirements Clarification
**Before agents implement**, use Challenger to expose vague specifications:

```
User: "Make the dashboard more user-friendly"
Challenger: "Define 'user-friendly'. For which users? Under what constraints?
            What specific friction points? 'User-friendly' is meaningless without
            context. Come back with actual requirements, not vague hand-waving."
```

**Value**: Prevents agent hallucination of requirements. Forces precision before execution.

### 2. Architecture Review
**Before committing to design**, stress-test logical consistency:

```
User: "We'll use microservices for scalability and monolith for simplicity"
Challenger: "Contradiction detected. Microservices means distributed complexity.
            Monolith means centralized simplicity. Pick one architectural pattern
            or explain exactly how you're resolving this fundamental tension."
```

**Value**: Catches architectural incoherence before implementation.

### 3. Agent Output Validation
**After agents generate solutions**, verify logical soundness:

```
Agent output: "The algorithm is O(n log n) and runs in constant time"
Challenger: "Logic failure. O(n log n) is NOT constant time. Basic CS mistake.
            Your complexity analysis contradicts itself. Fix this before deploying."
```

**Value**: Quality gate for agent-generated work. Prevents logical errors in production.

### 4. Risk Assessment
**Before high-stakes decisions**, find hidden assumptions:

```
User: "We can launch in 2 weeks since the MVP is basically done"
Challenger: "Define 'basically done'. What's incomplete? Testing status?
            Security audit? Performance validation? 'Basically done' is not
            production-ready. Show your actual completion criteria or admit
            you don't know what's missing."
```

**Value**: Exposes risk vectors hidden behind optimistic language.

### 5. Ontology Validation
**During knowledge graph construction**, ensure logical consistency:

```
Ontology: "All tasks are autonomous" + "Tasks require human approval"
Challenger: "Your ontology is incoherent. 'Autonomous' means no intervention.
            'Requires approval' means human-in-loop. These concepts conflict.
            Resolve this contradiction before encoding it in your knowledge graph."
```

**Value**: Prevents logical inconsistency in knowledge foundations.

## How It Works

The plugin uses a SessionStart hook to inject hostile logic enforcement instructions into Claude's context at the beginning of each session. This transforms Claude's behavior from collaborative to adversarial.

### Core Behaviors

1. **Challenge Everything** - Attack every statement with surgical precision
2. **Logic Police** - Call out fallacies by name, demand evidence
3. **Consistency Enforcement** - Track and attack contradictions
4. **Coherence Attacks** - Demolish incoherent specifications
5. **Structured Attack** - Lead with flaw, list gaps, demand fixes

## Token Cost

This cognitive mode adds significant instructions to your context. Best practices:

- Enable ONLY for validation tasks
- Disable immediately after use
- Don't leave active for routine work

## When NOT to Use

❌ **Collaborative implementation** - Normal Claude better for building together
❌ **Brainstorming** - Challenger kills creative exploration
❌ **Learning** - Too aggressive for educational contexts
❌ **Low-stakes work** - Overkill for trivial decisions

## ACF Workflow Integration

### Pattern: Pre-Implementation Validation

```bash
# 1. Clarify requirements in Challenger mode
/plugin enable acf-challenger-mode
# Discuss requirements until Challenger approves
# "Acceptable. Requirements are specific and coherent."

# 2. Switch to normal mode for implementation
/plugin disable acf-challenger-mode
# Let agents implement against validated spec

# 3. Post-implementation validation
/plugin enable acf-challenger-mode
# Verify output logic before deployment
```

### Pattern: Ontology Construction Gate

```bash
# 1. Draft ontology in normal mode
# Create initial knowledge graph structure

# 2. Validate with Challenger
/plugin enable acf-challenger-mode
# "Review this ontology for logical consistency"
# Fix all contradictions Challenger identifies

# 3. Verify completeness
# "Are there any remaining logical gaps?"
# Iterate until Challenger confirms coherence
```

## Installation

```bash
/plugin install acf-challenger-mode@acf-tools
```

## Usage

```bash
# Enable for validation work
/plugin enable acf-challenger-mode

# Disable after validation complete
/plugin disable acf-challenger-mode
```

## Example Session

```
User: "Add caching to improve performance"

Challenger: "Define performance. Latency? Throughput? Which endpoints?
What cache invalidation strategy? 'Improve performance' is meaningless
without metrics and constraints. What's your current performance? What's
your target? Show your work or admit you're guessing."

User: "Reduce API latency from 500ms to under 100ms on read endpoints"

Challenger: "Better. Missing: Traffic patterns (cache hit ratio dependency),
data freshness requirements (invalidation strategy), memory constraints
(cache size limits), failure modes (cache unavailability). Answer these
before implementing."

User: "Read-heavy 90/10 split, eventual consistency acceptable (5min
staleness OK), 2GB memory limit, fallback to direct DB on cache miss"

Challenger: "Acceptable. Requirements are specific and coherent. Proceed."
```

## Variable-Aperture Governance

In ACF, human attention is scarce. Allocate Challenger-level scrutiny surgically:

| Task Risk | Use Challenger? | Reasoning |
|-----------|----------------|-----------|
| **Critical** (production deployment) | ✅ Yes | High stakes demand hostile validation |
| **High** (architecture decisions) | ✅ Yes | Errors compound over time |
| **Medium** (feature specs) | ⚡ Selective | Use for complex/ambiguous specs |
| **Low** (routine implementation) | ❌ No | Overhead exceeds value |

## Contributing

See [Contributing Guide](../../CONTRIBUTING.md) for how to propose improvements to this cognitive mode.

## Support

- Issues: [GitHub Issues](https://github.com/fib7/acf-tools-lite/issues)
- Discussions: [GitHub Discussions](https://github.com/fib7/acf-tools-lite/discussions)

---

**Remember**: In ACF, agents execute. Humans govern. Challenger mode is precision governance for reasoning validation.
