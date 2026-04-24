---
name: robot-project-status
description: 智能机器人项目当前状态和配置
type: project
---

## 项目目标
智能机器人：硬件(STM32) + 视觉 + 听感 + 语音 + 本地LLM Agent

## 用户技术背景
- 51/STM32单片机基础
- 电脑配置：G1840 CPU + 2x Tesla M40 12G + 800元购入（性价比方案）
- 预算有限，追求性价比

## 当前进度

### 已完成
1. VSCode 安装在 D:/VSCode
2. PlatformIO 配置完成
3. pyOCD + CMSIS-DAP 烧录方式配置成功
4. STM32F407 LED控制程序烧录成功
5. USART1 串口通信测试成功
6. **2026-04-23 更新**：BOOT0 串口烧录验证成功，LED 控制正常
7. **LED 控制系统 v2.0**：GPIO 控制 + PWM 呼吸灯（2026-04-23 完成）

### 技术配置
| 项目 | 配置 |
|------|------|
| 开发板 | 野火霸天虎 STM32F407IGT6 |
| 烧录器 | DAP仿真器 (CMSIS-DAP) |
| 烧录工具 | pyOCD / stm32flash (串口) |
| 通信接口 | USART1 (USB转串口 CH340) |
| 通信端口 | COM4 |
| 波特率 | 115200 |
| 项目路径 | D:\VSCode\STM32_F407_LED |

### 重要发现：SWD 烧录问题
- **问题**：OpenOCD/pyOCD 通过 SWD 连接失败，芯片检测返回 PARTNO 0x0
- **现象**：SWD 通信能建立（DPIDR 0x2ba01477），但无法识别芯片
- **解决**：使用 BOOT0 串口方式烧录正常工作
- **操作流程**：
  1. BOOT0 接 3.3V
  2. 按复位键
  3. 运行 `stm32flash -b 57600 -w firmware.bin -v -R COM4`
  4. 拔掉 BOOT0 跳线
  5. 正常启动

### DAP 仿真器烧录（2026-04-23 解决）
- **问题**：OpenOCD stlink 报 "open failed"，cmsis-dap 报 "cannot read IDR"
- **原因**：野火 DAP 是 CMSIS-DAP 协议，OpenOCD 连接不稳定
- **解决**：使用 **pyOCD** 烧录
- **命令**：`pyocd flash -t stm32f407igtx firmware.bin`
- **详细文档**：`memory/knowledge/ebf_stm32f407_dap_flash_solution.md`

### 下一步方向
1. 连接本地LLM（Ollama或API方案）
2. 添加视觉（摄像头）
3. 添加语音（麦克风+语音合成）
4. ROS2学习

## 相关文件
- 开发板PDF：桌面[野火EmbedFire]STM32库开发实战指南
- 野火资料站：https://doc.embedfire.com
