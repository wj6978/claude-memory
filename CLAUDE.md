# Claude 工作环境配置

## 三层记忆系统（每次必读）

### 第一层：热记忆 — MEMORY.md
- **位置**: `D:/Claude/memory/MEMORY.md`
- **时机**: 每次对话开始必须读取
- **内容**: 记忆系统索引、规则、同步状态

### 第二层：温记忆 — dailies/
- **位置**: `D:/Claude/memory/dailies/`
- **时机**: 任务相关时按需检索
- **内容**: 每日工作记录、任务进展
- **命名**: `YYYY/MM/DD-记忆.md`

### 第三层：冷记忆 — archives/
- **位置**: `D:/Claude/memory/archives/`
- **时机**: 明确需要历史信息时读取
- **内容**: 长期归档、历史项目

## 记忆触发机制
- 每 7 条消息自动触发记忆记录
- 触发文件: `memory/conversations/.memory_trigger`
- 检测到触发后，完善当日记忆并同步 GitHub

## 文件存储规范

**所有文件统一存放在 `D:/Claude/` 目录下：**

| 文件类型 | 存放位置 |
|----------|----------|
| 程序代码 | `D:/Claude/projects/` |
| PDF/文档 | `D:/Claude/documents/` |
| 图片/截图 | `D:/Claude/images/` |
| 临时文件 | `D:/Claude/temp/` 或 `downloads/` |

## 目录结构
```
D:/Claude/
├── CLAUDE.md        ← 本文件（每次自动读取）
├── memory/         ← 记忆系统
│   ├── MEMORY.md  ← 热记忆
│   ├── dailies/   ← 温记忆
│   └── archives/  ← 冷记忆
├── sessions/       ← 对话历史（本地，不上传）
├── projects/       ← 项目代码
├── documents/      ← PDF/文档
├── images/         ← 图片
└── ...
```

## GitHub 同步
- 仓库: `https://github.com/wj6978/claude-memory`
- 代理: `127.0.0.1:10808`

## 重要项目
- 野火霸天虎F407: `memory/knowledge/ebf_stm32f407_link.md`
