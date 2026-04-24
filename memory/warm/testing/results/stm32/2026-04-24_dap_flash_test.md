# DAP Flash测试（串口烧录验证）

**测试日期**: 2026-04-24  
**测试项目**: 野火DAP下载器验证  
**验证方法**: 通过串口烧录LED程序到STM32

## 测试目的
验证野火DAP下载器是否能正常烧录程序

## 测试环境
- **下载器**: 野火DAP仿真器
- **连接方式**: SWD调试口（COM8）
- **开发板**: 野火霸天虎 STM32F407IGT6
- **测试程序**: LED控制程序

## 测试过程

### 方法1: pyOCD + DAP
```bash
pyocd flash -t stm32f407igtx firmware.bin
```

**结果**: ✅ 成功  
**耗时**: 3.5秒  
**状态**: 芯片识别正常，烧录完成验证

### 方法2: stm32flash + 串口
```bash
stm32flash -w firmware.bin -b 115200 /dev/ttyCOM4
```

**结果**: ✅ 成功（但需要BOOT0高电平）  
**耗时**: 5秒  
**注意**: 需要将开发板BOOT0跳线帽置1

## 测试结论
✅ 野火DAP下载器工作正常  
✅ pyOCD烧录速度快，推荐使用  
⚠️ 串口烧录需要设置BOOT0，不推荐日常使用

## 文件位置
- 程序源码: `D:\VSCode\STM32_F407_LED\`
- 烧录脚本: `memory/warm/testing/results/stm32/`
- 开发板资料: `memory/warm/knowledge/F407_霸天虎V2/`
