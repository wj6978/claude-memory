---
name: com_port_detection_method_2026_04_24
description: COM端口占用检测方法及COM8重启方案
type: reference
---

# COM端口占用检测方法记录

## 📋 检测时间
2026-04-24

## 🎯 检测目标
验证COM4（开发板串口）和COM8（DAP仿真器）的占用状态

## 🔧 检测方法

### 方法一：Python + pyserial（推荐）
```bash
# 查看所有COM端口
python -c "
import serial.tools.list_ports
ports = serial.tools.list_ports.comports()
print('所有COM端口:')
for port in sorted(ports, key=lambda x: x.device):
    print(f'  {port.device}: {port.description}')
"
```

### 方法二：Python串口测试
```bash
# 测试端口是否可打开
python -c "
import serial

# 测试COM4
try:
    ser = serial.Serial('COM4', 115200, timeout=1)
    print('COM4 可以打开')
    ser.close()
except:
    print('COM4 无法打开（可能被占用或无设备）')

# 测试COM8
try:
    ser = serial.Serial('COM8', 115200, timeout=1)
    print('COM8 可以打开')
    ser.close()
except:
    print('COM8 无法打开（可能被占用或无设备）')
"
```

### 方法三：Windows PowerShell设备查询
```bash
# 查看所有端口设备
powershell -Command "Get-PnpDevice -Class 'Ports' | Format-Table -AutoSize FriendlyName, Status, InstanceId"

# 查找特定设备
powershell -Command "Get-PnpDevice -Class 'Ports' | Where-Object {$_.FriendlyName -like '*CH340*'} | Format-Table -AutoSize FriendlyName, Status, InstanceId"
```

## 📊 检测结果（2026-04-24）

| 端口 | 用途 | 状态 | 设备描述 |
|------|------|------|---------|
| **COM4** | 开发板串口 | ✅ OK | USB-SERIAL CH340 (COM4) |
| **COM8** | DAP仿真器 | ⚠️ Unknown | USB-SERIAL CH340 (COM8) |

## 🚨 COM8异常处理方案

### 1. 物理重启步骤
1. 完全拔掉COM8对应的USB线缆
2. 等待10秒
3. 重新插入USB线缆
4. 等待系统自动识别设备

### 2. 验证设备识别
```bash
# 查看设备是否重新出现
python -c "
import serial.tools.list_ports
ports = serial.tools.list_ports.comports()
for port in ports:
    if 'COM8' in port.device:
        print(f'COM8已识别: {port.description}')
        break
else:
    print('COM8未识别到')
"
```

### 3. 检查设备管理器
```bash
# 打开设备管理器
devmgmt.msc

# 查找位置：
# 端口(COM和LPT) -> 查看COM8设备状态
```

## 📝 预期结果

### COM4（应该保持）
- ✅ 正常工作
- ✅ 可以打开串口连接
- ✅ LED控制命令可发送

### COM8（重启后应该）
- ✅ 状态变为"OK"
- ✅ 可以使用pyOCD进行烧录
- ✅ 设备描述："USB-SERIAL CH340 (COM8)"

## 🔍 后续检测步骤

重启COM8后，执行以下检测：

```bash
# 1. 查看端口列表
python -c "
import serial.tools.list_ports
ports = serial.tools.list_ports.comports()
print('重启后端口列表:')
for port in sorted(ports, key=lambda x: x.device):
    print(f'  {port.device}: {port.description}')
"

# 2. 测试COM4
python -c "
import serial
try:
    ser = serial.Serial('COM4', 115200, timeout=1)
    ser.write(b'LED_STATUS\r\n')
    response = ser.read(100).decode()
    print('COM4测试成功:', response)
    ser.close()
except Exception as e:
    print('COM4测试失败:', e)
"

# 3. 测试COM8
python -c "
import serial
try:
    ser = serial.Serial('COM8', 115200, timeout=1)
    print('COM8可以打开 - DAP仿真器正常')
    ser.close()
except Exception as e:
    print('COM8仍有问题:', e)
"

# 4. 尝试pyOCD烧录
if COM8正常:
    pyocd list
    pyocd flash -t stm32f407igtx firmware.bin
```

## 💡 注意事项

1. **避免多软件占用**：不要同时打开Arduino IDE、PlatformIO、串口调试工具等
2. **USB端口选择**：尽量使用主板原生USB口，避免延长线或Hub
3. **驱动安装**：确保CH340驱动已正确安装
4. **权限问题**：以管理员权限运行测试命令

## 📞 如果仍有问题

1. 检查是否有其他程序占用COM8
2. 尝试更换USB线缆或USB端口
3. 重新安装CH340驱动
4. 使用其他SWD调试器测试

---

记录时间：2026-04-24