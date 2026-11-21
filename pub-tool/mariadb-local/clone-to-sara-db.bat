@echo off
setlocal
cd /d "%~dp0"
call "%~dp0config.bat"

set DUMP=%TEMP%\yuliao_live_db_clone.sql
set SARA_BAT=D:\company-code\sara-live-server\pub-tool\mariadb-local\create-docker.bat

echo Clone yuliao live_db (3390) -^> sara (3391) ...
where docker >nul 2>&1 || (echo ERROR: docker not found. & exit /b 1)

docker ps --format "{{.Names}}" | findstr /i "^yuliao-mariadb$" >nul || (
  echo ERROR: yuliao-mariadb not running. Run create-docker.bat first.
  exit /b 1
)

if exist "%SARA_BAT%" call "%SARA_BAT%" >nul
docker ps --format "{{.Names}}" | findstr /i "^sara-live-mariadb$" >nul || (
  echo ERROR: sara-live-mariadb not running.
  exit /b 1
)

echo [1/2] Dump from yuliao-mariadb ...
docker exec yuliao-mariadb mariadb-dump -u%MARIADB_USER% -p%MARIADB_PASSWORD% --single-transaction --quick live_db > "%DUMP%"
if errorlevel 1 (
  echo ERROR: dump failed
  exit /b 1
)

echo [2/2] Import into sara-live-mariadb (overwrites live_db) ...
docker exec -i sara-live-mariadb mariadb -u%MARIADB_USER% -p%MARIADB_PASSWORD% live_db < "%DUMP%"
if errorlevel 1 (
  echo ERROR: import failed
  exit /b 1
)

del "%DUMP%" >nul 2>&1
docker exec sara-live-mariadb mariadb -u%MARIADB_USER% -p%MARIADB_PASSWORD% -N -e "SELECT COUNT(*) AS tables FROM information_schema.tables WHERE table_schema='live_db';"
echo Done.
exit /b 0