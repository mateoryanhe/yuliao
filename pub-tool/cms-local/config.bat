@echo off
call "%~dp0..\project-paths.bat"
REM CMS 本地启动配置
set LOCAL_PROJECT_ROOT=%YULIAO_PROJECT_ROOT%
set CMS_DIR=%LOCAL_PROJECT_ROOT%\cms
set CMS_DEV_URL=http://127.0.0.1:5173
set CMS_API_HINT=http://127.0.0.1:9444
