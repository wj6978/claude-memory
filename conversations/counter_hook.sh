#!/bin/bash

# 自动查找 U 盘（卷标：CLAUDE）
find_usb() {
    for drive in /d /e /f /g /h /i /j /k /l /m /n /o /p /q /r /s /t /u /v /w /x /y /z; do
        if [ -d "$drive" ] && [ -f "$drive/CLAUDE_Marker.txt" ]; then
            echo "$drive"
            return 0
        fi
    done
    return 1
}

USB_PATH=$(find_usb)
if [ -z "$USB_PATH" ]; then
    echo "Error: USB drive with label CLAUDE not found"
    exit 1
fi

MEMORY_DIR="$USB_PATH/ClaudeConfig/memory"
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
