#!/bin/bash

VAULT="$HOME/Documents/Obsidian Vault"
REMOTE="gdrive:Obsidian Vault"
LOG="$HOME/.local/logs/obsidian-sync.log"

mkdir -p "$(dirname $LOG)"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Watcher started." >> "$LOG"

# Watch for any create, modify, delete, move events
inotifywait -m -r -e modify,create,delete,move "$VAULT" \
  --exclude ".obsidian/workspace.json" \
  --format '%w%f %e' |
while read CHANGED EVENT; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Change detected: $CHANGED ($EVENT)" >> "$LOG"

    # Small debounce — wait briefly in case multiple files change at once
    sleep 10

    rclone sync "$VAULT" "$REMOTE" \
      --exclude ".obsidian/workspace.json" \
      --exclude ".trash/**" \
      --log-file="$LOG" \
      --log-level INFO

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Sync complete." >> "$LOG"
done
