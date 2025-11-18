# ACF Power Commit

> Conventional commit enforcer for Claude Code - Creates atomic, convention-compliant git commits with explicit file staging

## What is Power Commit?

**Power Commit** is a Claude Code plugin that enforces conventional commit standards with zero tolerance for sloppy git habits. It prevents `git add -A`, enforces atomic commits, and ensures every commit message follows conventional commit format.

## Features

- **Conventional Commits**: Automatic enforcement of `<type>(<scope>): <subject>` format
- **Explicit Staging**: Blocks `git add -A` and `git add .` - forces explicit file staging
- **Atomic Commits**: One logical change per commit, always
- **Project Conventions**: Customizable conventions per project
- **SessionStart Injection**: Conventions loaded automatically at session start
- **Minimal Communication**: Direct, no-nonsense commit feedback

## Installation

### Via Marketplace

1. Add marketplace:
   ```bash
   /plugin marketplace add /path/to/acf-tools-lite
   ```

2. Install plugin:
   ```bash
   /plugin install acf-power-commit@acf-tools-lite
   ```

3. Verify installation:
   ```bash
   /plugin list
   ```

### Manual Installation

```bash
cp -r acf-power-commit ~/.config/claude/plugins/
```

## Usage

### Creating Commits

Use the `/commit` command to create conventional commits:

```bash
/commit
```

Claude will:
1. Analyze changes with `git status`
2. Group changes by logical scope
3. Stage files explicitly (never `git add -A`)
4. Craft conventional commit message
5. Execute commit
6. Verify conventions followed
7. Repeat until all changes committed

### Customizing Conventions

On first run, Power Commit creates `docs/acf/git/commit-conventions.md` in your project with default conventions.

**To customize**:
1. Edit `docs/acf/git/commit-conventions.md`
2. Modify commit types, subject rules, staging rules, etc.
3. Run `/clear` to reload session with updated conventions

### Example Workflow

```bash
# Make changes to your code
# ...

# Create commits
/commit

# Claude analyzes changes
# Output: "Done. Created 3 commits:"
# | Hash | Type | Scope | Subject |
# | abc123 | feat | api | add user authentication endpoint |
# | def456 | test | api | add auth endpoint tests |
# | ghi789 | docs | api | update API documentation |
```

## Conventions Enforced

### Commit Message Format

```
<type>(<scope>): <subject>

[optional body]
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`

**Subject Rules**:
- Imperative mood ("add feature" not "added feature")
- No capitalization
- No period at end
- Max 50 characters

**Body Rules** (optional):
- 72 character wrap
- Explain what/why, not how
- Blank line before body

### File Staging Rules

**FORBIDDEN**:
- ❌ `git add -A`
- ❌ `git add .`
- ❌ `git add --all`
- ❌ `git commit -a`

**REQUIRED**:
- ✅ `git add path/to/specific/file.js`
- ✅ `git add src/component.tsx`
- ✅ Explicit file paths only

### Atomic Commit Rules

- One logical change per commit
- Commit after each completed task
- No "cleanup" or "misc" commits
- Project must build after every commit

### Attribution Rules

- **NEVER** include AI attribution
- **NEVER** add "Co-authored-by: Claude" or similar
- **NEVER** bypass pre-commit hooks with `--no-verify`

## Commands

### `/commit`

Stage and commit changes following conventional commit format.

**Arguments**: None (optional commit scope/type can be provided in conversation)

**Behavior**:
- Reads conventions from `docs/acf/git/commit-conventions.md`
- Enforces all rules strictly
- Creates atomic commits
- Reports success/failure minimally

## Configuration

### Convention File Location

`docs/acf/git/commit-conventions.md` in your project root

### SessionStart Behavior

When you start a Claude Code session:
1. Power Commit checks if `docs/acf/git/commit-conventions.md` exists
2. If not: creates from default template
3. If exists: loads your customized conventions
4. Injects conventions into Claude's context with STRICT enforcement wrapper

### Reloading Conventions

After editing conventions:
```bash
/clear
```

This reloads the session and re-injects updated conventions.

## Communication Style

Power Commit uses minimal, direct communication:

**Success**:
- "Done. Committed 3 files."
- "Done. Created 2 commits: [table]"

**Failure**:
- "Failed. 5 test failures."
- "Quality gates not met."

No sugar-coating. No verbose explanations. Just facts.

## Plugin Architecture

**Type**: Functional plugin (adds `/commit` command + SessionStart hook)

**Files**:
- `.claude-plugin/plugin.json` - Plugin manifest
- `hooks/hooks.json` - SessionStart hook configuration
- `hooks/handlers/session-start.sh` - Bash handler
- `commands/commit.md` - Commit command specification
- `content/commit-conventions-template.md` - Default conventions
- `README.md` - This file
- `LICENSE` - MIT license

**Dependencies**: None (pure bash, no Python required)

## Compatibility

- **Claude Code**: v0.1.0+
- **Git**: v2.0+
- **OS**: macOS, Linux (bash required)

## FAQ

**Q: Can I use `git add .` for convenience?**
A: No. Power Commit enforces explicit staging to prevent accidental commits.

**Q: What if I want to commit everything?**
A: List files explicitly. Atomic commits require conscious staging.

**Q: Can I customize commit types?**
A: Yes. Edit `docs/acf/git/commit-conventions.md` in your project.

**Q: Does Power Commit work with pre-commit hooks?**
A: Yes. Power Commit never bypasses hooks (no `--no-verify`).

**Q: Can I disable Power Commit for a session?**
A: Uninstall the plugin: `/plugin uninstall acf-power-commit@acf-tools-lite`

## License

MIT License - See LICENSE file

## Author

ACF Project - acf@fib7.ai

## Version

v1.0.0

---

**Power Commit: Every commit perfect. No exceptions.**
