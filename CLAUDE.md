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

## 文件存储规范

**所有文件统一存放在 `D:/Claude/` 目录下：**

```
D:/Claude/
├── projects/          ← 项目代码和程序文件
├── documents/         ← PDF、文档、资料
├── images/            ← 图片、截图
├── downloads/         ← 临时下载文件
├── temp/             ← 临时文件
├── memory/           ← 记忆系统
├── sessions/         ← 对话历史
└── CLAUDE.md        ← 本文件
```

**规则：**
- 程序文件 → `D:/Claude/projects/`
- 图片/截图 → `D:/Claude/images/`
- PDF/文档 → `D:/Claude/documents/`
- 不确定的文件 → 先问用户

## 目录结构
```
D:/Claude/
├── CLAUDE.md        ← 本文件
├── memory/         ← 记忆系统
├── sessions/       ← 对话历史
├── projects/       ← 项目文件
├── documents/      ← 文档资料
├── images/         ← 图片
└── ...
```

## GitHub 同步
- 仓库: `https://github.com/wj6978/claude-memory`
- 代理: `127.0.0.1:10808`

## 重要项目
- 野火霸天虎F407: `memory/knowledge/ebf_stm32f407_link.md`
