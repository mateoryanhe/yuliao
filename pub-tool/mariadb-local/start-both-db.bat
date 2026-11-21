@echo off
echo Start local MariaDB for yuliao (3390) + sara-live-server (3391) ...
call "%~dp0create-docker.bat"
if errorlevel 1 exit /b 1
call "D:\company-code\sara-live-server\pub-tool\mariadb-local\create-docker.bat"
exit /b %ERRORLEVEL%