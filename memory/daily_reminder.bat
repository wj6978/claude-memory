@echo off
echo =========================================
echo   每日记忆记录提醒
echo   时间: %date% %time%
echo =========================================
echo.
echo 现在是 17:00，是时候记录今天的记忆了！
echo 请打开 Claude Code 开始记录 warm/dailies/%date:~0,4%/%date:~5,2%/%date:~8,2%-daily.md
echo.
pause
