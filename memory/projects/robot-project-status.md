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

### 技术配置
| 项目 | 配置 |
|------|------|
| 开发板 | 野火霸天虎 STM32F407IGT6 |
| 烧录器 | DAP仿真器 (CMSIS-DAP) |
| 烧录工具 | pyOCD |
| 通信接口 | USART1 (USB转串口 CH340) |
| 通信端口 | COM4 |
| 波特率 | 115200 |
| 项目路径 | D:\VSCode\STM32_F407_LED |

### 下一步方向
1. 连接本地LLM（Ollama或API方案）
2. 添加视觉（摄像头）
3. 添加语音（麦克风+语音合成）
4. ROS2学习

## 相关文件
- 开发板PDF：桌面[野火EmbedFire]STM32库开发实战指南
- 野火资料站：https://doc.embedfire.com
