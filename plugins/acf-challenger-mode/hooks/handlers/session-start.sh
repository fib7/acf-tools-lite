#!/usr/bin/env bash
# ACF Challenger Mode - SessionStart Hook
# Injects cognitive mode instructions from external markdown file.
# Content stored in ../../content/cognitive-mode.md for maintainability.

set -euo pipefail

# Get plugin root using CLAUDE_PLUGIN_ROOT env var
# If not set, fall back to path calculation (3 levels up from this script)
if [ -n "${CLAUDE_PLUGIN_ROOT:-}" ]; then
    PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT}"
else
    PLUGIN_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
fi

CONTENT_FILE="${PLUGIN_ROOT}/content/cognitive-mode.md"

# Check if content file exists
if [ ! -f "$CONTENT_FILE" ]; then
    echo "{\"error\": \"Content file not found: ${CONTENT_FILE}\"}" >&2
    exit 1
fi

# Read file and strip YAML frontmatter
in_frontmatter=0
content=""

while IFS= read -r line; do
    # Check for frontmatter delimiters (---)
    if [ "$line" = "---" ]; then
        in_frontmatter=$((in_frontmatter + 1))
        continue
    fi

    # Only collect content after second --- (or if no frontmatter)
    if [ $in_frontmatter -ge 2 ] || [ $in_frontmatter -eq 0 ]; then
        content="${content}${line}"$'\n'
    fi
done < "$CONTENT_FILE"

# Strip leading/trailing whitespace
content=$(echo "$content" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

# Escape content for JSON
# 1. Escape backslashes first (must be first!)
content="${content//\\/\\\\}"
# 2. Escape double quotes
content="${content//\"/\\\"}"
# 3. Escape newlines
content="${content//$'\n'/\\n}"
# 4. Escape tabs
content="${content//$'\t'/\\t}"
# 5. Escape carriage returns
content="${content//$'\r'/\\r}"

# Output SessionStart hook JSON
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$content"

exit 0
