# Memory Index

## 记忆系统使用规则

### 三层记忆检索顺序
1. **热记忆** — `MEMORY.md`（每次会话必读）
2. **温记忆** — `warm/`（按需检索）
3. **冷记忆** — `archives/`（历史归档）

### 触发条件
- 每次对话开始，先读取 MEMORY.md
- 任务相关先搜索 warm/ 下各目录
- 需要历史信息时再查 archives/

### 触发机制
- 每 7 条消息自动触发记忆记录
- 触发文件: `warm/conversations/.memory_trigger`
- 检测到触发后，完善当日记忆并同步 GitHub

---

## 目录结构
```
memory/
├── MEMORY.md      ← 热记忆
├── warm/          ← 温记忆
│   ├── dailies/      — 每日工作记录
│   ├── tasks/        — 任务详情
│   ├── conversations/ — 临时会话
│   ├── knowledge/    — 知识库
│   ├── projects/     — 研究计划
│   └── insights/     — 洞察灵感
└── archives/      ← 冷记忆
```

---

## 存储路径
- 主目录: `D:/Claude/memory/`
- 符号链接: `C:/Users/Administrator/.claude/memory` → `D:/Claude/memory`

---

## 最近同步
- 2026-04-23 15:00: 放弃U盘方案，回归本地主存储 D:/Claude/
- 2026-04-23 16:30: STM32F407 串口烧录成功，LED 控制测试通过，SWD 烧录存在问题已记录
- 2026-04-23 17:00: 解决中文 PDF 读取问题，使用 pdfminer.six
