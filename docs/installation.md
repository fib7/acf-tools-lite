# Installation Guide

Complete instructions for installing ACF Tools Lite plugins.

---

## Prerequisites

### Required
- **Claude Code CLI** installed and configured
- **Git** (for marketplace cloning)
- **Bash** (standard on macOS/Linux, WSL on Windows)

### Verify Claude Code Installation
```bash
# Check Claude Code is available
claude --version

# Or if using the /command syntax
/help
```

If Claude Code is not installed, visit [Claude Code documentation](https://docs.claude.com/) for setup instructions.

---

## Installation Methods

### Method 1: Marketplace Installation (Recommended)

**Step 1: Add Marketplace**
```bash
/plugin marketplace add fib7/acf-tools-lite
```

This clones the marketplace repository locally and makes plugins available for installation.

**Step 2: Install Plugins**
```bash
# Install all three plugins
/plugin install acf-challenger-mode@acf-tools-lite
/plugin install acf-nitro@acf-tools-lite
/plugin install acf-power-commit@acf-tools-lite

# Or install individually
/plugin install acf-challenger-mode@acf-tools-lite
# Then later...
/plugin install acf-nitro@acf-tools-lite
# And...
/plugin install acf-power-commit@acf-tools-lite
```

**Step 3: Verify Installation**
```bash
/plugin list
```

You should see:
```
acf-challenger-mode (acf-tools-lite) - disabled
acf-nitro (acf-tools-lite) - disabled
acf-power-commit (acf-tools-lite) - enabled
```

---

### Method 2: Local Installation

**For development or testing**:

**Step 1: Clone Repository**
```bash
git clone git@github.com:fib7/acf-tools-lite.git ~/acf-tools-lite
```

**Step 2: Install Locally**
```bash
/plugin marketplace add ~/acf-tools-lite
/plugin install acf-challenger-mode@acf-tools-lite
/plugin install acf-nitro@acf-tools-lite
/plugin install acf-power-commit@acf-tools-lite
```

---

## Plugin Management

### Enable/Disable Plugins

**Enable plugin**:
```bash
/plugin enable acf-challenger-mode
# or
/plugin enable acf-nitro
```

**Disable plugin**:
```bash
/plugin disable acf-challenger-mode
# or
/plugin disable acf-nitro
```

**Check status**:
```bash
/plugin list
```

### Update Plugins

**Update to latest version**:
```bash
/plugin update acf-challenger-mode
/plugin update acf-nitro
/plugin update acf-power-commit
```

**Update all plugins**:
```bash
/plugin update --all
```

### Uninstall Plugins

**Remove individual plugin**:
```bash
/plugin uninstall acf-challenger-mode
# or
/plugin uninstall acf-nitro
# or
/plugin uninstall acf-power-commit
```

**Remove marketplace**:
```bash
/plugin marketplace remove acf-tools-lite
```

---

## Verification

### Test Challenger Mode

**1. Enable plugin**:
```bash
/plugin enable acf-challenger-mode
```

**2. Test with vague statement**:
```
User: "Make the system more robust and scalable"
```

**Expected behavior**: Claude challenges vague terms, demands specifics:
- "Define 'robust'"
- "Scalable to what? Users? Data? Requests?"
- "Missing: performance criteria"

**3. Disable when done**:
```bash
/plugin disable acf-challenger-mode
```

---

### Test Nitro Mode

**1. Enable plugin**:
```bash
/plugin enable acf-nitro
```

**2. Test with sequential TodoWrite**:
```
User: "Create 5 tasks sequentially"
```

**Expected behavior**: Claude catches violation:
- "🏎️ SEQUENTIAL TodoWrite DETECTED!"
- Calculates time waste
- Shows correct parallel pattern

**3. Disable when done**:
```bash
/plugin disable acf-nitro
```

---

### Test Power Commit

**1. Power Commit is always enabled** (SessionStart hook)

**2. Test `/commit` command**:
```bash
/commit
```

**Expected behavior**: Claude analyzes changes, creates conventional commits:
- "Done. Created 2 commits:"
- Follows conventional commit format
- Explicitly stages files (never `git add -A`)
- Atomic commits per logical change

**3. Check conventions file**:
```bash
cat docs/acf/git/commit-conventions.md
```

If file doesn't exist, it's created from template on first session.

---

## Troubleshooting

### Plugin Not Found

**Problem**: `/plugin install acf-challenger-mode@acf-tools-lite` fails with "not found"

**Solution**:
1. Verify marketplace added: `/plugin marketplace list`
2. If missing, add: `/plugin marketplace add fib7/acf-tools-lite`
3. Retry installation

### Hook Not Executing

**Problem**: Plugin enabled but behavior unchanged

**Solution**:
1. Check plugin status: `/plugin list`
2. Verify "enabled" status
3. Restart Claude Code session
4. Check hook handler is executable:
   ```bash
   ls -la ~/path/to/marketplace/acf-tools-lite/plugins/*/hooks/handlers/
   ```
5. Test hook directly:
   ```bash
   bash ~/path/to/plugin/hooks/handlers/session-start.sh | jq .
   ```

### JSON Parse Error

**Problem**: Hook executes but JSON invalid

**Solution**:
1. Test hook output:
   ```bash
   bash session-start.sh | jq .
   ```
2. Check for escaping issues in content markdown
3. Verify no special characters in content files
4. Report issue: https://github.com/fib7/acf-tools-lite/issues

### Permission Denied

**Problem**: Cannot execute hook handler

**Solution**:
```bash
chmod +x ~/path/to/plugin/hooks/handlers/session-start.sh
```

---

## Configuration

### Plugin Directories

Default plugin directories (Claude Code managed):
```
~/.claude/plugins/marketplaces/acf-tools-lite/
```

### Environment Variables

Hook handlers use:
- `CLAUDE_PLUGIN_ROOT` - Plugin root directory (set by Claude Code)

No user configuration needed.

---

## System Requirements

### Operating Systems
- ✅ macOS (tested on macOS 13+)
- ✅ Linux (tested on Ubuntu 22.04+)
- ✅ Windows WSL (bash required)

### Dependencies
- Bash 4.0+ (standard on modern systems)
- No Python, Node.js, or external dependencies

### Resource Usage
- Negligible CPU impact (hook executes once per session)
- <100KB disk space per plugin
- <50KB memory per plugin

---

## Next Steps

After installation:
1. Read [Usage Guide](usage.md) for patterns and examples
2. Review plugin READMEs for detailed behavior:
   - [acf-challenger-mode README](../plugins/acf-challenger-mode/README.md)
   - [acf-nitro README](../plugins/acf-nitro/README.md)
   - [acf-power-commit README](../plugins/acf-power-commit/README.md)
3. Enable cognitive plugins (challenger, nitro) when needed, disable when done
4. Use `/commit` command for power-commit (always active)

---

## Support

**Issues**: https://github.com/fib7/acf-tools-lite/issues
**Email**: acf@fib7.ai
**Documentation**: [docs/README.md](README.md)

---

**Last Updated**: 2025-11-10
