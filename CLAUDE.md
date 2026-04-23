# Claude 工作环境配置

## 记忆系统

### 核心规则
1. **每次对话开始，先读取 MEMORY.md**
2. **任务相关先搜索 dailies/**
3. **需要历史信息时再查 archives/**

### 三层记忆检索
| 层级 | 位置 | 时机 |
|------|------|------|
| 热记忆 | `memory/MEMORY.md` | 每次会话必读 |
| 温记忆 | `memory/dailies/` | 按需检索 |
| 冷记忆 | `memory/archives/` | 明确需求读取 |

### 记忆触发机制
- 每 7 条消息自动触发记忆记录
- 触发文件: `memory/conversations/.memory_trigger`
- 检测到触发后，完善当日记忆并同步 GitHub

## 目录结构
```
D:/Claude/
├── memory/           ← 记忆系统（GitHub 同步）
│   ├── MEMORY.md     ← 热记忆
│   ├── dailies/      ← 每日记录
│   ├── knowledge/    ← 知识库
│   └── ...
├── sessions/         ← 对话历史（本地，不上传）
└── CLAUDE.md        ← 本文件
```

## GitHub 同步
- 仓库: `https://github.com/wj6978/claude-memory`
- 代理: `127.0.0.1:10808`

## 重要项目
- 野火霸天虎F407: `memory/knowledge/ebf_stm32f407_link.md`
