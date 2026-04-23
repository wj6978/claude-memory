# Memory Index

## 记忆系统使用规则

### 三层记忆检索顺序
1. **热记忆** — `MEMORY.md`（每次会话必读）
2. **温记忆** — `dailies/`（每日摘要按需检索）
3. **冷记忆** — `archives/`（历史归档明确需求读取）

### 触发条件
- 每次对话开始，先读取 MEMORY.md
- 任务相关先搜索 dailies/
- 需要历史信息时再查 archives/

---

## 目录结构
- `dailies/` — 每日工作记录
- `tasks/` — 任务详情
- `conversations/` — 临时会话
- `knowledge/` — skill 和知识
- `projects/` — 研究计划
- `insights/` — 洞察灵感
- `archives/` — 历史归档

---

## 存储路径
- 主目录: `D:/Claude/`
  - `D:/Claude/memory/` — 记忆系统
  - `D:/Claude/sessions/` — 对话历史
- 符号链接: `C:/Users/Administrator/.claude/memory` → `D:/Claude/memory`
- 符号链接: `C:/Users/Administrator/.claude/sessions` → `D:/Claude/sessions`

---

## 最近同步
- 2026-04-23 15:00: 放弃U盘方案，回归本地主存储 D:/Claude/
