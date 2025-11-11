# ACF Tools Lite

## Agentic Continuous Flow (ACF)

**ACF is software development for a world where intelligence exists in silicon as well as carbon.** Humans shift from writing code to governing intelligent agent swarms. Knowledge (ontologies, policies, constraints) becomes the product; code is ephemeral output regenerated on demand. Work flows through multi-dimensional risk evaluation – low-risk tasks execute autonomously, high-risk tasks trigger human review. Systems emerge from agent interactions within knowledge boundaries rather than being engineered top-down. The fundamental inversion: humans govern, agents execute.

---

## What is ACF Tools Lite?

Minimal cognitive enforcement toolkit for [Claude Code](https://claude.ai/code) - two essential plugins that enforce ACF quality patterns in your AI-assisted development workflow.

### Plugins

**🔥 acf-challenger-mode** - Hostile logic enforcement
Intellectually aggressive challenger who attacks every gap in reasoning, logic, and consistency. Zero tolerance for sloppy thinking. Perfect for:
- Requirements clarification
- Architecture review
- Agent output validation
- Logic consistency checks

**⚡ acf-nitro** - Parallel execution enforcement
Enthusiastic speed demon who catches sequential execution violations and calculates time waste. Enforces parallel patterns for:
- TodoWrite batching (single call vs multiple)
- Parallel Task agent spawning
- Parallel tool calls (Read, Grep, Bash)
- Performance optimization

---

## Quick Start

### Prerequisites
- [Claude Code CLI](https://claude.ai/code) installed and configured

### Installation

**1. Add marketplace**
```bash
/plugin marketplace add fib7/acf-tools-lite
```

**2. Install plugins**
```bash
# Install both
/plugin install acf-challenger-mode@acf-tools-lite
/plugin install acf-nitro@acf-tools-lite
```

**3. Enable when needed**
```bash
# Enable Challenger mode for logic validation
/plugin enable acf-challenger-mode

# Enable Nitro mode for parallel execution enforcement
/plugin enable acf-nitro

# Disable when done
/plugin disable acf-challenger-mode
/plugin disable acf-nitro
```

---

## Usage Patterns

### When to use Challenger
- **Before implementation**: Validate requirements and architecture decisions
- **During code review**: Challenge logic gaps and inconsistencies
- **Agent validation**: Review multi-agent outputs for contradictions
- **Architecture discussions**: Force rigorous thinking about trade-offs

### When to use Nitro
- **Task planning**: Ensure TodoWrite batching (single call with all todos)
- **Multi-agent workflows**: Enforce parallel agent spawning
- **File operations**: Catch sequential Read/Grep/Bash calls that could run parallel
- **Performance optimization**: Calculate time waste from sequential patterns

---

## Documentation

- **[Installation Guide](docs/installation.md)** - Detailed setup instructions
- **[Usage Guide](docs/usage.md)** - Examples, best practices, advanced patterns
- **[Plugin READMEs](plugins/)** - Full documentation for each plugin

---

## Repository Structure

```
acf-tools-lite/
├── .claude-plugin/
│   └── marketplace.json        # Plugin marketplace metadata
├── plugins/
│   ├── acf-challenger-mode/    # Hostile logic enforcement plugin
│   └── acf-nitro/              # Parallel execution enforcement plugin
├── docs/                       # Documentation
└── README.md                   # This file
```

---

## Technical Details

### Architecture
- **Hook-based injection**: Plugins use SessionStart hooks to inject cognitive mode instructions
- **Pure bash handlers**: No Python dependency, maximum compatibility
- **Zero runtime dependencies**: Fully self-contained
- **Content-driven**: Behavioral instructions stored in markdown files

### Compatibility
- macOS, Linux, Windows (any Unix-like environment)
- Requires: bash, Claude Code plugin system
- No external dependencies

---

## Version

**Current**: v1.0.0

Both plugins are stable and production-ready.

---

## License

MIT License - see [LICENSE](LICENSE) file

---

## Contributing

This is a minimal distribution repository. For pattern extraction and full ACF toolkit development, see [acf-tools](https://github.com/fib7/acf-tools).

---

## Related Projects

- **[acf-tools](https://github.com/fib7/acf-tools)** - Complete ACF reference toolkit with agents, commands, patterns
- **[Claude Code](https://claude.ai/code)** - AI-assisted development CLI

---

**Last Updated**: 2025-11-10
**Maintained by**: ACF Project (acf@fib7.ai)
