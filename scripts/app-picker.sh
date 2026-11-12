#!/usr/bin/env bash

TERMINAL="${TERMINAL:-foot}"
export PATH="$PATH:$HOME/.local/bin"

sel=$(
  find /usr/bin /usr/local/bin ~/.local/bin \
    -maxdepth 1 \( -type f -o -type l \) -executable -printf '%f\n' 2>/dev/null |
    sort -u |
    noctalia dmenu -p "Run"
) || exit 0

[ -n "$sel" ] || exit 0

if [[ "$sel" == '!'* ]]; then
  # "!htop" -> TUI: run in a terminal
  cmd=${sel#!}
  setsid -f "$TERMINAL" -e bash -c "$cmd" >/dev/null 2>&1
else
  # GUI: detached
  setsid -f bash -c "$sel" >/dev/null 2>&1
fi
