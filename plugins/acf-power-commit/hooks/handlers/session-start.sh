#!/usr/bin/env bash
# ACF Power Commit - SessionStart Hook
# Initializes and injects git commit conventions into session context.
# Behavior:
# - If docs/acf/git/commit-conventions.md doesn't exist: Create from template
# - If docs/acf/git/commit-conventions.md exists: Read current version (may be user-customized)
# - Inject conventions into session with STRICT compliance wrapper

set -euo pipefail

# Get plugin root using CLAUDE_PLUGIN_ROOT env var
# If not set, fall back to path calculation (3 levels up from this script)
if [ -n "${CLAUDE_PLUGIN_ROOT:-}" ]; then
    PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT}"
else
    PLUGIN_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
fi

TEMPLATE_FILE="${PLUGIN_ROOT}/content/commit-conventions-template.md"
TARGET_FILE="docs/acf/git/commit-conventions.md"

# Initialize or read git conventions
if [ ! -f "$TARGET_FILE" ]; then
    # INITIALIZE: Create from template
    mkdir -p "$(dirname "$TARGET_FILE")"

    if [ -f "$TEMPLATE_FILE" ]; then
        cp "$TEMPLATE_FILE" "$TARGET_FILE"
        conventions=$(cat "$TEMPLATE_FILE")
        status="📚 Initialized docs/acf/git/commit-conventions.md with default conventions (you may customize this file)"
    else
        conventions="# Git Conventions\n\nError loading template: Template file not found"
        status="⚠️ Error initializing git conventions"
    fi
else
    # READ: Load existing conventions (may be user-customized)
    if [ -f "$TARGET_FILE" ]; then
        conventions=$(cat "$TARGET_FILE")
        status="📚 Loaded conventions from docs/acf/git/commit-conventions.md"
    else
        conventions="# Git Conventions\n\nError reading file"
        status="⚠️ Error loading git conventions"
    fi
fi

# Build additional context with enforcement wrapper
additional_context="# ACF Power Commit: STRICT Git Commit Enforcement

${status}

---

## ⚠️ CRITICAL INSTRUCTION: MANDATORY COMPLIANCE

You MUST STRICTLY follow the git commit conventions defined in the document below.

**These are NOT suggestions. These are ABSOLUTE REQUIREMENTS.**

### When creating git commits:

1. **Consult the conventions below FIRST** - Before any commit operation
2. **Apply them EXACTLY** - No approximations, no \"close enough\"
3. **Do NOT deviate** - Unless user explicitly overrides with clear instruction

### Enforcement Rules:

- ✅ All commits MUST follow conventional commit format
- ✅ All file staging MUST be explicit (NEVER git add -A or git add .)
- ✅ All commits MUST be atomic (one logical change per commit)
- ✅ Project MUST build after every commit
- ✅ NEVER include AI attribution or co-authorship
- ✅ NEVER bypass pre-commit hooks (--no-verify)
- ❌ Violations MUST be prevented or corrected immediately

**Power Commit is watching. Every commit perfect. No exceptions.**

---

# Git Commit Conventions

${conventions}

---

## Compliance Verification

To create commits following these conventions, the user can run:
- \`/commit\` - Stage and commit changes following git conventions

To customize conventions, the user can edit:
- \`docs/acf/git/commit-conventions.md\` - Git commit conventions
- Then \`/clear\` to reload session
"

# Escape content for JSON
# 1. Escape backslashes first (must be first!)
additional_context="${additional_context//\\/\\\\}"
# 2. Escape double quotes
additional_context="${additional_context//\"/\\\"}"
# 3. Escape newlines
additional_context="${additional_context//$'\n'/\\n}"
# 4. Escape tabs
additional_context="${additional_context//$'\t'/\\t}"
# 5. Escape carriage returns
additional_context="${additional_context//$'\r'/\\r}"

# Output SessionStart hook JSON
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$additional_context"

exit 0
