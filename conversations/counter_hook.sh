#!/bin/bash

COUNTER_FILE="C:/Users/Administrator/.claude/projects/C--Users-Administrator/memory/conversations/counter.txt"
MEMORY_DIR="C:/Users/Administrator/.claude/projects/C--Users-Administrator/memory"
TRIGGER_FILE="$MEMORY_DIR/conversations/.memory_trigger"

COUNT=$(cat "$COUNTER_FILE" 2>/dev/null || echo "0")
COUNT=$((COUNT + 1))
echo "$COUNT" > "$COUNTER_FILE"

if [ "$COUNT" -ge 7 ]; then
    echo "trigger" > "$TRIGGER_FILE"
    echo "0" > "$COUNTER_FILE"
fi
