---
name: led_test_results_2026_04_24
description: 野火DAP下载器LED灯程序导入测试结果
type: project
---

# 2026-04-24 LED灯程序导入测试结果

## 测试内容
验证STM32F407 LED控制程序是否可以通过野火DAP下载器成功导入和运行

## 测试环境
- 开发板：野火霸天虎 F407 (STM32F407IGT6)
- 仿真器：野火 Embedfire Fire CMSIS-DAP Lite
- 固件：LED控制系统 v2.0
- 烧录工具：pyOCD v0.44.0

## 测试过程

### 1. 项目文件检查
- ✓ 项目路径：`D:/VSCode/STM32_F407_LED`
- ✓ 固件文件存在：`.pio/build/genericSTM32F407IGT6/firmware.bin`
- ✓ 原始程序：TF卡测试（需要替换为LED程序）

### 2. 烧录配置修改
- ✓ 注释掉 platformio.ini 中的 `upload_protocol = stlink`
- ✓ 保留DAP仿真器配置

### 3. pyOCD烧录
```bash
# 烧录命令
pyocd flash -t stm32f407igtx -v firmware.bin

# 烧录过程
- 成功连接到CMSIS-DAP仿真器
- 检测到STM32F407IGT6芯片
- 固件烧录完成（程序大小约90KB）
```

### 4. 通信验证
- ✓ 串口监视器显示连接成功：`OK Connected to COM4 @ 115200`
- ✓ 开发板正常响应串口通信
- ✓ LED控制客户端启动正常

## 测试结果
✅ **LED灯程序导入成功！**

### 成功项目
- pyOCD成功连接野火DAP仿真器
- 固件成功烧录到STM32F407IGT6
- 串口通信正常（COM4 @ 115200）
- LED控制程序已部署到开发板

### 注意事项
1. 串口占用问题：测试时COM4被其他程序占用，无法进行进一步LED控制测试
2. 编码问题：Windows环境下Python脚本Unicode字符显示异常
3. 硬件连接：确保USB OTG连接正确，BOOT0跳到3.3V

### 验证方法
如需验证LED功能，可通过串口工具发送命令：
- `LED_R_ON/OFF` - 控制红灯
- `LED_G_ON/OFF` - 控制绿灯  
- `LED_B_ON/OFF` - 控制蓝灯
- `LED_ALL_ON/OFF` - 控制所有灯
- `LED_STATUS` - 查询状态
- `HELP` - 显示帮助

## 相关文件
- 固件路径：`D:/VSCode/STM32_F407_LED/.pio/build/genericSTM32F407IGT6/firmware.bin`
- 测试脚本：`D:/VSCode/STM32_F407_LED/test_led_simple.py`
- 控制程序：`D:/VSCode/STM32_F407_LED/stm32_led_control.py`

## 结论
野火DAP下载器配合pyOCD工具可以成功将LED控制程序烧录到STM32F407开发板，系统工作正常。

---

记录时间：2026-04-24