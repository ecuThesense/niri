#!/bin/sh
# manmenu.sh - search man pages with noctalia dmenu, or open a random one (single file)
TERM_CMD="${TERMINAL:-foot}" # your terminal emulator
RANDOM_ENTRY="[ Random page ]"

# "name, alias (section)" lines, description stripped
list_pages() {
  man -k . 2>/dev/null | sed 's/ *- .*//' | sort -u
}

choice=$({
  echo "$RANDOM_ENTRY"
  list_pages
} | noctalia dmenu -p "man:")
[ -z "$choice" ] && exit 0

[ "$choice" = "$RANDOM_ENTRY" ] && choice=$(list_pages | shuf -n 1)
[ -z "$choice" ] && exit 1

name=$(printf '%s\n' "$choice" | awk '{print $1}' | sed 's/[(,].*//')
section=$(printf '%s\n' "$choice" | grep -o '([^)]*)' | head -n 1 | tr -d '()')

if [ -n "$section" ]; then
  exec $TERM_CMD -e man "$section" "$name"
else
  exec $TERM_CMD -e man "$name"
fi
