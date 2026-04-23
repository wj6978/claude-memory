@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: =========================================
:: Claude 随身配置启动器
:: 自动查找 U 盘并同步配置
:: =========================================

set "USB_LABEL=CLAUDE"
set "LOCAL_CLAUDE=%USERPROFILE%\.claude"
set "USB_CLAUDE_CONFIG="
set "FOUND=0"

:: 遍历所有盘符，查找卷标为 CLAUDE 的U盘
for %%i in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%i:\ (
        for /f "tokens=1,2 delims= " %%a in ('vol %%i: 2^>nul') do (
            if /i "%%a"=="%%i:" (
                if /i "%%b"=="%USB_LABEL%" (
                    set "USB_CLAUDE_CONFIG=%%i:\ClaudeConfig"
                    set "FOUND=1"
                )
            )
        )
    )
)

if "!FOUND!"=="0" (
    echo [错误] 未找到卷标为 %USB_LABEL% 的U盘
    echo 请确保U盘已插入，且卷标设置为 %USB_LABEL%
    echo.
    echo 设置卷标方法：
    echo 1. 右键U盘 -> 属性
    echo 2. 修改卷标为: %USB_LABEL%
    echo 3. 点击确定
    pause
    exit /b 1
)

echo [成功] 找到U盘: !USB_CLAUDE_CONFIG!
echo [信息] 开始同步配置...

:: 复制 settings.json 到本地
if exist "!USB_CLAUDE_CONFIG!\settings.json" (
    copy /Y "!USB_CLAUDE_CONFIG!\settings.json" "%LOCAL_CLAUDE%\settings.json" >nul
    echo [完成] settings.json 已同步
) else (
    echo [警告] U盘中未找到 settings.json
)

:: 复制 memory 目录
if exist "!USB_CLAUDE_CONFIG!\memory" (
    if not exist "%LOCAL_CLAUDE%\memory" mkdir "%LOCAL_CLAUDE%\memory"
    xcopy /E /Y /Q "!USB_CLAUDE_CONFIG!\memory" "%LOCAL_CLAUDE%\memory\" >nul 2>&1
    echo [完成] memory 目录已同步
)

:: 复制 hook 脚本
if exist "!USB_CLAUDE_CONFIG!\counter_hook.sh" (
    if not exist "%LOCAL_CLAUDE%\projects\C--Users-Administrator\memory\conversations" mkdir "%LOCAL_CLAUDE%\projects\C--Users-Administrator\memory\conversations" 2>nul
    copy /Y "!USB_CLAUDE_CONFIG!\counter_hook.sh" "%LOCAL_CLAUDE%\projects\C--Users-Administrator\memory\conversations\" >nul 2>&1
    echo [完成] counter_hook.sh 已同步
)

echo.
echo [成功] 配置同步完成！
echo [提示] 现在可以启动 Claude Code 开始工作
echo.
pause
