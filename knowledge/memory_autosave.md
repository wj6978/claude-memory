---
name: memory_autosave
description: 自动记忆触发器逻辑
type: knowledge
---

# 自动记忆记录机制

## 触发条件
- 对话次数达到7次时触发
- 触发文件: `memory/conversations/.memory_trigger`

## 当检测到触发文件时

1. **立即行动**: 读取今天的记忆文件 `dailies/YYYY/MM/DD-记忆.md`
2. **完善记忆**: 根据对话上下文，补全以下内容：
   - 今日完成的工作
   - 重要决策和讨论
   - 技术方案或洞察
   - 未完成的事项
3. **写入文件**: 使用 Edit 工具追加到记忆文件
4. **清除触发**: 删除 `.memory_trigger` 文件

## 格式要求
```markdown
## 记忆片段 (HH:MM:SS)

### 完成事项
- 具体完成的内容

### 重要讨论
- 关键决策或方案

### 洞察
- 学到的新知识或想法

---
```
