---
name: ebf_stm32f407_link
description: 野火霸天虎F407开发板资料链接
type: reference
---

# 野火霸天虎 F407 资料链接

**网址**: https://doc.embedfire.com/products/link/zh/latest/index.html

**说明**: 野火霸天虎 STM32F407 开发板官方资料文档，包含：
- 硬件手册
- 例程代码
- 原理图
- 教程文档

**用于**: STM32F407 开发、嵌入式学习

---

# 开发环境

## PlatformIO IDE

**已安装**: VS Code + PlatformIO IDE

**官网**: https://platformio.org/

**用途**: 直接与开发板连接，进行代码编写、编译和下载

**特点**:
- 支持 ARM Cortex-M 系列（包括 STM32F4）
- 内置 DAP-Link/J-Link/ST-Link 等调试器支持
- 提供统一的项目管理界面

## DAP 下载

**连接方式**: USB Device 接口

**COM8**: DAP-Link（用于下载调试）
**COM4**: 串口（用于通信/日志）

**说明**: 开发板通过 USB 连接电脑，DAP-Link 设备会被识别

**测试状态**: 电脑已识别 COM8 为 DAP，COM4 为串口

**重要更新 (2026-04-23)**:
- COM8 (DAP-Link) 状态显示 Unknown，SWD 烧录失败
- COM4 串口正常工作，用于程序下载和调试
- 串口烧录命令: `stm32flash -b 57600 -w firmware.bin -v -R COM4`
