#!/bin/sh

# These notification commands are available on macOS.
if [ ! -x /usr/bin/osascript ] || [ ! -x /usr/bin/afplay ]; then
    printf '{}\n'
    exit 0
fi

# Desktop sessions normally lack terminal environment variables.
if [ -n "${TERM_PROGRAM:-}${TMUX:-}" ] || { [ -n "${TERM:-}" ] && [ "$TERM" != dumb ]; }; then
    /usr/bin/osascript - "$1" >/dev/null <<'APPLESCRIPT'
on run argv
    display notification (item 1 of argv) with title "Codex CLI"
end run
APPLESCRIPT
    /usr/bin/afplay "$HOME/.codex/human-male-aggro.wav"
fi

printf '{}\n'
