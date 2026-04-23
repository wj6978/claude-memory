---
name: ebf_stm32f407_dap_flash_solution
description: 野火霸天虎F407通过DAP仿真器烧录的解决方案
type: reference
---

# 野火霸天虎 F407 DAP 仿真器烧录解决方案

## 问题描述
- OpenOCD + stlink.cfg：报错 "Error: open failed"
- OpenOCD + cmsis-dap.cfg：报错 "Error connecting DP: cannot read IDR"
- PlatformIO 直接烧录失败

## 原因分析
- 野火 DAP 是 **CMSIS-DAP** 协议，不是 ST-Link
- OpenOCD 的 cmsis-dap 接口连接不稳定
- PlatformIO 的 upload_protocol 不支持 cmsis-dap

## 解决方案
**使用 pyOCD 烧录**

## 烧录命令

```bash
# 单次烧录
pyocd flash -t stm32f407igtx firmware.bin

# 带验证
pyocd flash -t stm32f407igtx -v firmware.bin
```

## 前置条件
1. 安装 pyOCD：`pip install pyocd`
2. 安装芯片 pack（首次）：`pyocd pack install stm32f407igtx`

## 完整烧录流程
1. 连接 DAP 仿真器到电脑和开发板
2. 开发板上电
3. 编译固件：`pio run`
4. 转换 ELF 到 BIN：`arm-none-eabi-objcopy -O binary firmware.elf firmware.bin`（仅 stm32flash 需要）
5. 烧录：`pyocd flash -t stm32f407igtx .pio/build/genericSTM32F407IGT6/firmware.bin`
6. 验证：串口发送命令测试

## 验证命令（通过 COM4 串口）
```bash
# 查看状态
LED_STATUS

# 控制 LED
LED_R_ON/OFF  - 红灯
LED_G_ON/OFF  - 绿灯
LED_B_ON/OFF  - 蓝灯
LED_ALL_ON/OFF - 所有灯
```

## 补充说明
- 波特率：115200
- 串口端口：COM4
- 芯片型号：STM32F407IGT6
- 调试器：野火 Embedfire Fire CMSIS-DAP Lite

## 相关文件
- 项目路径：`D:/VSCode/STM32_F407_LED`
- PDF 文档：`D:/Claude/memory/knowledge/开发板说明.pdf`
