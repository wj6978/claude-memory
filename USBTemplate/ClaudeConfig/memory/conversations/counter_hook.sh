#!/bin/bash

MEMORY_DIR="D:/Claude/memory"
COUNTER_FILE="$MEMORY_DIR/conversations/counter.txt"
TRIGGER_FILE="$MEMORY_DIR/conversations/.memory_trigger"

COUNT=$(cat "$COUNTER_FILE" 2>/dev/null || echo "0")
COUNT=$((COUNT + 1))
echo "$COUNT" > "$COUNTER_FILE"

if [ "$COUNT" -ge 7 ]; then
    echo "trigger" > "$TRIGGER_FILE"
    echo "0" > "$COUNTER_FILE"

    # 自动 git push
    cd "$MEMORY_DIR"
    git add -A
    git commit -m "Auto backup $(date +%Y-%m-%d\ %H:%M)"
    git push origin master 2>&1
fi
