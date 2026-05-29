#!/usr/bin/env bash
# Runs shellcheck on any .sh file that was just written or edited.
# Called by the PostToolUse hook on Write|Edit events.
# Input: JSON on stdin with tool_input.file_path

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only act on shell scripts
[[ "$FILE" == *.sh ]] || exit 0
[[ -f "$FILE" ]] || exit 0

# shellcheck must be installed; skip silently if not
command -v shellcheck > /dev/null 2>&1 || exit 0

OUTPUT=$(shellcheck "$FILE" 2>&1)
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
  # Print to stderr so Claude Code shows it as context
  echo "shellcheck: $FILE" >&2
  echo "$OUTPUT" >&2
  # Exit 0 (non-blocking): surface as context, don't halt the loop
fi

exit 0
