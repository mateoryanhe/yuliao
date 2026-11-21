@echo off
call "%~dp0..\project-paths.bat"
REM 与 config/local/config.yaml 中 database.default.link 一致
set MARIADB_HOST_PORT=3390
set MARIADB_DATABASE=live_db
set MARIADB_USER=appuser
set MARIADB_PASSWORD=Appledev882116
set MARIADB_ROOT_PASSWORD=Appledev882116
set COMPOSE_PROJECT_NAME=yuliao-mariadb