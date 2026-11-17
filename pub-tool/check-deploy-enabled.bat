@echo off
REM 在 call config.bat 之后调用；DEPLOY_ENABLED=0 时拒绝发版/重启远程
if not "%DEPLOY_ENABLED%"=="0" exit /b 0
echo.
echo [已禁止] 当前脚本对应环境的机器尚未到位 ^(config.bat: DEPLOY_ENABLED=0^).
echo 语聊 yuliao 目前仅以下目录可发版:
echo   - pub-tool\go-test   ^(语聊测试服 63.185.66.53^)
echo   - pub-tool\cms-test  ^(同上^)
echo 提审/正式机到位后: 改对应 config.bat 的 REMOTE_* 与密钥, 设 DEPLOY_ENABLED=1
echo.
exit /b 1