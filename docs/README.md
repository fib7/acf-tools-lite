# ACF Tools Lite Documentation

Complete documentation for ACF cognitive enforcement plugins.

---

## Quick Navigation

### Getting Started
- **[Installation Guide](installation.md)** - Setup and configuration
- **[Usage Guide](usage.md)** - Patterns, examples, best practices

### Plugin Documentation
- **[acf-challenger-mode](../plugins/acf-challenger-mode/README.md)** - Hostile logic enforcement
- **[acf-nitro](../plugins/acf-nitro/README.md)** - Parallel execution enforcement

### Repository
- **[Main README](../README.md)** - Repository overview
- **[CLAUDE.md](../CLAUDE.md)** - AI assistant instructions

---

## Documentation Structure

```
docs/
├── README.md           # This file - documentation hub
├── installation.md     # Marketplace setup, plugin installation
└── usage.md           # Usage patterns, examples, best practices
```

---

## Plugin Overview

### acf-challenger-mode
**Purpose**: Hostile logic enforcement - validates reasoning consistency

**Use cases**:
- Requirements clarification
- Architecture review
- Agent output validation
- Logic gap detection

**Behavior**: Intellectually aggressive challenger attacks every gap in logic, consistency, and reasoning. Binary outcomes, zero tolerance for sloppy thinking.

---

### acf-nitro
**Purpose**: Parallel execution enforcement - eliminates sequential waste

**Use cases**:
- TodoWrite batching validation
- Parallel Task spawning enforcement
- Parallel tool call detection
- Performance optimization

**Behavior**: Enthusiastic speed demon catches sequential violations, calculates time waste, enforces parallel patterns.

---

## Key Concepts

### Cognitive Modes
Behavioral transformations injected via SessionStart hooks. Transform Claude's personality and enforcement patterns for specific use cases.

### Hook Architecture
- SessionStart hook triggers on session creation
- Bash handler reads markdown content
- Content injected as additional context
- Zero runtime dependencies

### Enable/Disable Pattern
```bash
# Enable when needed
/plugin enable [plugin-name]

# Work with enforcement active
# ...

# Disable when done
/plugin disable [plugin-name]
```

---

## Common Workflows

### Logic Validation Workflow
1. Enable Challenger mode: `/plugin enable acf-challenger-mode`
2. Present requirements or architecture
3. Challenger attacks logic gaps
4. Iterate until consistency achieved
5. Disable: `/plugin disable acf-challenger-mode`

### Performance Optimization Workflow
1. Enable Nitro mode: `/plugin enable acf-nitro`
2. Work on task planning or multi-agent coordination
3. Nitro catches sequential violations
4. Fix parallel execution patterns
5. Disable: `/plugin disable acf-nitro`

---

## Additional Resources

- **[Claude Code Documentation](https://docs.claude.com/)** - Official Claude Code docs
- **[ACF Full Toolkit](https://github.com/fib7/acf-tools)** - Complete ACF patterns and agents

---

**Last Updated**: 2025-11-10
