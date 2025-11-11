# ACF Tools Lite - AI Assistant Instructions

## Agentic Continuous Flow (ACF)

**ACF is software development for a world where intelligence exists in silicon as well as carbon.** Humans shift from writing code to governing intelligent agent swarms. Knowledge (ontologies, policies, constraints) becomes the product; code is ephemeral output regenerated on demand. Work flows through multi-dimensional risk evaluation – low-risk tasks execute autonomously, high-risk tasks trigger human review. Systems emerge from agent interactions within knowledge boundaries rather than being engineered top-down. The fundamental inversion: humans govern, agents execute.

---

## Repository Overview

**What acf-tools-lite IS**:
- Lightweight plugin distribution for Claude Code
- Two cognitive enforcement plugins: Challenger (logic validation) + Nitro (parallel execution)
- Minimal, focused, production-ready
- Zero dependencies (bash-only hooks)

**What acf-tools-lite is NOT**:
- NOT a development repository (no active feature work)
- NOT a pattern extraction toolkit (see main acf-tools for that)
- NOT implementing full ACF workflow (this IS a distribution artifact)

**Primary users**: Developers using Claude Code who want cognitive enforcement plugins

---

## Directory Structure

```
acf-tools-lite/
├── .claude-plugin/
│   └── marketplace.json          # Plugin marketplace metadata
├── plugins/
│   ├── acf-challenger-mode/      # Hostile logic enforcement
│   │   ├── .claude-plugin/
│   │   │   └── plugin.json       # Plugin metadata
│   │   ├── content/
│   │   │   └── cognitive-mode.md # Behavioral instructions
│   │   ├── hooks/
│   │   │   ├── hooks.json        # Hook configuration
│   │   │   └── handlers/
│   │   │       └── session-start.sh  # Bash hook handler
│   │   ├── LICENSE
│   │   └── README.md
│   └── acf-nitro/                # Parallel execution enforcement
│       ├── .claude-plugin/
│       │   └── plugin.json
│       ├── content/
│       │   └── parallel-enforcement.md
│       ├── hooks/
│       │   ├── hooks.json
│       │   └── handlers/
│       │       └── session-start.sh
│       ├── LICENSE
│       └── README.md
├── docs/
│   ├── README.md                 # Documentation hub
│   ├── installation.md           # Installation guide
│   └── usage.md                  # Usage patterns
├── .gitignore
├── LICENSE
├── README.md                     # Repository overview
└── CLAUDE.md                     # This file
```

---

## Plugin Architecture

### How Plugins Work

1. **SessionStart Hook**: Triggers when Claude Code session starts
2. **Bash Handler**: `session-start.sh` executes (pure bash, no Python)
   - Reads markdown content from `content/*.md`
   - Strips YAML frontmatter (between `---` delimiters)
   - Outputs JSON: `{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"..."}}`
3. **Cognitive Mode Injection**: Content injected as additional context transforms Claude's behavior

### Hook Handler Implementation

**Key features**:
- Uses `CLAUDE_PLUGIN_ROOT` env var for plugin root path
- Falls back to relative path calculation if env var not set
- Pure bash (no external dependencies)
- JSON escaping for quotes, backslashes, newlines, tabs, carriage returns
- Error handling with JSON error output to stderr

---

## Git Commit Conventions

**Format**: Conventional Commits

```
<type>(<scope>): <subject>

[optional body]
```

### Types

- `feat` - New plugin features or enhancements
- `fix` - Bug fixes in plugins or documentation
- `docs` - Documentation updates
- `chore` - Maintenance (dependency updates, version bumps)
- `refactor` - Code restructuring without behavior changes

### Scopes

- `challenger` - acf-challenger-mode plugin
- `nitro` - acf-nitro plugin
- `marketplace` - Marketplace configuration
- `docs` - Documentation

### Examples

```bash
feat(challenger): enhance logic gap detection patterns
fix(nitro): correct parallel execution time calculation
docs: update installation guide with troubleshooting
chore(marketplace): bump plugins to v1.1.0
```

---

## Maintenance Workflow

### Version Updates

**When to bump versions**:
- **Patch** (1.0.1): Bug fixes, typo corrections in content
- **Minor** (1.1.0): New enforcement patterns, enhanced detection
- **Major** (2.0.0): Breaking changes to plugin behavior or API

**Update process**:
1. Modify plugin content or hook handlers
2. Update `version` in plugin's `.claude-plugin/plugin.json`
3. Update `version` in `.claude-plugin/marketplace.json`
4. Commit with conventional commit message
5. Tag release: `git tag v1.1.0`
6. Push with tags: `git push && git push --tags`

### Content Updates

**Cognitive mode improvements**:
- Edit `plugins/*/content/*.md` files
- Test locally: `/plugin enable [plugin-name]`
- Verify injection works correctly
- Follow version update process

**Hook handler fixes**:
- Edit `plugins/*/hooks/handlers/session-start.sh`
- Test JSON output: `bash session-start.sh | jq .`
- Verify escaping works correctly
- Follow version update process

---

## Quality Standards

**Before committing**:
- Test both plugins locally with `/plugin enable`
- Verify hooks execute without errors
- Check JSON output is valid
- Ensure documentation stays synchronized
- Validate marketplace.json schema

**Documentation requirements**:
- Keep README.md synchronized with plugin changes
- Update plugin READMEs for new patterns
- Maintain version numbers across all files
- Keep installation/usage docs accurate

---

## Working with This Repository

### Typical Tasks

**Updating cognitive mode content**:
1. Edit relevant `.md` file in `plugins/*/content/`
2. Test injection locally
3. Update version if content changed significantly
4. Commit with clear description

**Fixing hook handlers**:
1. Edit `plugins/*/hooks/handlers/session-start.sh`
2. Test bash script: `bash script.sh`
3. Verify JSON output validity
4. Update version for fixes
5. Commit with fix description

**Documentation updates**:
1. Edit relevant doc files
2. Ensure cross-references valid
3. Commit with docs type

**Version releases**:
1. Update all version fields
2. Create conventional commit
3. Tag with `git tag vX.Y.Z`
4. Push with tags

---

## Important Notes

### This is NOT acf-tools (Full Toolkit)

**Differences**:
| Aspect | acf-tools (Full) | acf-tools-lite |
|--------|------------------|----------------|
| Purpose | Reference patterns, agents, commands | Plugin distribution |
| Size | 168 files, 1.2MB | 18 files, ~100KB |
| Plugins | 8 plugins | 2 plugins |
| Workflow | Pattern extraction | Plugin maintenance |
| Target | ACF implementers | Plugin users |

**Don't add**:
- ❌ Full ACF workflow (.backlog/, agents/, commands/)
- ❌ Pattern templates and documentation
- ❌ Other plugins from acf-tools
- ❌ Complex development infrastructure

**Do maintain**:
- ✅ High-quality plugin code and content
- ✅ Clear, concise documentation
- ✅ Version synchronization
- ✅ Proper git conventions

---

## Related Repositories

- **acf-tools**: Full ACF reference toolkit - https://github.com/fib7/acf-tools
- Pattern extraction, agent manifests, commands, comprehensive documentation

---

**Last Updated**: 2025-11-10
**Repository Type**: Plugin Distribution
**Maintenance Focus**: Plugin quality and version management
