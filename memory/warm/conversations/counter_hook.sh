#!/bin/bash

MEMORY_DIR="D:/Claude/memory"
COUNTER_FILE="$MEMORY_DIR/warm/conversations/counter.txt"
TRIGGER_FILE="$MEMORY_DIR/warm/conversations/.memory_trigger"
LOG_FILE="$MEMORY_DIR/warm/conversations/conversation_log.txt"
SUMMARY_DIR="$MEMORY_DIR/warm/conversations"

# 追加用户消息到日志（如果提供了参数）
if [ -n "$1" ]; then
    echo "[$(date +%H:%M:%S)] 用户: $1" >> "$LOG_FILE"
fi

COUNT=$(cat "$COUNTER_FILE" 2>/dev/null || echo "0")
COUNT=$((COUNT + 1))
echo "$COUNT" > "$COUNTER_FILE"

if [ "$COUNT" -ge 7 ]; then
    echo "trigger" > "$TRIGGER_FILE"
    echo "0" > "$COUNTER_FILE"

    # 生成会话摘要
    DATE=$(date +%Y-%m-%d)
    TIME=$(date +%H:%M)
    SUMMARY_FILE="$SUMMARY_DIR/${DATE}-${TIME}-session-summary.md"

    # 读取对话日志并生成摘要
    LOG_CONTENT=$(cat "$LOG_FILE" 2>/dev/null || echo "")

    # 调用 Claude 生成摘要
    claude -p --system-prompt "根据以下对话记录，生成一份摘要：
$LOG_CONTENT

格式：
# 会话摘要 $(date +%Y-%m-%d\ %H:%M)

## 主要话题
- 列出主要讨论话题

## 完成事项
- 列出完成的工作

## 重要决策
- 记录做出的决定

## 待跟进
- 列出待解决的问题

直接输出 Markdown 内容。" > "$SUMMARY_FILE" 2>/dev/null

    # 清空对话日志
    > "$LOG_FILE"

    # 自动 git push
    cd "$MEMORY_DIR"
    git add -A
    git commit -m "Auto backup $(date +%Y-%m-%d\ %H:%M) - Session summary"
    git push origin master 2>&1
fi
