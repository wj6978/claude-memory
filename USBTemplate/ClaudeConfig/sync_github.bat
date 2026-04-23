@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: =========================================
:: Claude 记忆同步 GitHub
:: =========================================

set "USB_LABEL=CLAUDE"
set "USB_CLAUDE_CONFIG="

:: 查找U盘
for %%i in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%i:\ (
        for /f "tokens=1,2 delims= " %%a in ('vol %%i: 2^>nul') do (
            if /i "%%a"=="%%i:" (
                if /i "%%b"=="%USB_LABEL%" (
                    set "USB_CLAUDE_CONFIG=%%i:\ClaudeConfig"
                )
            )
        )
    )
)

if "!USB_CLAUDE_CONFIG!"=="" (
    echo [错误] 未找到U盘
    pause
    exit /b 1
)

set "MEMORY_DIR=!USB_CLAUDE_CONFIG!\memory"

if not exist "!MEMORY_DIR!" (
    echo [错误] 未找到 memory 目录
    pause
    exit /b 1
)

cd /d "!MEMORY_DIR!"

echo [信息] 正在同步到 GitHub...
git add -A
git commit -m "Auto sync %date% %time%"
git push origin master

echo.
echo [完成] 已同步到 GitHub
pause
