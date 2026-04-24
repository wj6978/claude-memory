---
name: stm32f407_led_control
description: 野火霸天虎F407 LED控制系统详细文档
type: reference
---

# STM32F407 LED 控制系统 v2.0

## 硬件配置

| LED颜色 | GPIO引脚 | 定时器通道 | 复用功能 |
|---------|----------|-----------|----------|
| 红灯 | PF6 | TIM10_CH1 | AF3 |
| 绿灯 | PF7 | TIM11_CH1 | AF3 |
| 蓝灯 | PF8 | TIM13_CH1 | AF9 |

## 项目路径
`D:/VSCode/STM32_F407_LED/`

## 指令集

### GPIO 控制（手动开关）
```
LED_R_ON      - 红灯点亮
LED_R_OFF     - 红灯熄灭
LED_G_ON      - 绿灯点亮
LED_G_OFF     - 绿灯熄灭
LED_B_ON      - 蓝灯点亮
LED_B_OFF     - 蓝灯熄灭
LED_ALL_ON    - 所有灯点亮
LED_ALL_OFF   - 所有灯熄灭
```

### 呼吸灯模式
```
LED_BREATH_R    - 红色呼吸灯
LED_BREATH_G    - 绿色呼吸灯
LED_BREATH_B    - 蓝色呼吸灯
LED_BREATH_ALL  - 全彩呼吸灯（三色同时）
LED_BREATH_STOP - 停止呼吸灯，恢复手动模式
```

### 系统指令
```
LED_STATUS   - 查询当前状态（模式和灯状态）
HELP         - 显示帮助信息
```

## 技术实现

### 软件框架
- Arduino STM32 框架
- HardwareTimer 实现定时器中断
- analogWrite() 实现 PWM 输出

### 呼吸灯原理
- 定时器每 1ms 中断一次
- 占空比 0→100%→0 循环，约 2 秒一个呼吸周期
- PWM 频率约 1kHz

### 模式切换
- 切换呼吸灯模式时自动停止当前模式
- 切换手动模式时恢复之前的 GPIO 状态

## 烧录方法

### pyOCD 烧录（推荐）
```bash
pyocd flash -t stm32f407igtx .pio/build/genericSTM32F407IGT6/firmware.bin
```

### BOOT0 串口烧录（备用）
1. BOOT0 接 3.3V
2. 按复位键
3. 运行：`stm32flash -b 57600 -w firmware.bin -v -R COM4`
4. 拔掉 BOOT0 跳线

## 串口配置
- 端口：COM4
- 波特率：115200
- 数据位：8
- 校验：无
- 停止位：1

## 代码结构
```
src/main.cpp   - 主程序，包含所有 LED 控制逻辑
platformio.ini - PlatformIO 项目配置
```
