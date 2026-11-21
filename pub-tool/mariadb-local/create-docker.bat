@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"
call "%~dp0config.bat"

echo ========================================
echo   yuliao MariaDB (Docker) :%MARIADB_HOST_PORT%
echo ========================================

where docker >nul 2>&1 || (echo ERROR: docker not in PATH. & exit /b 1)
docker info >nul 2>&1 || (echo ERROR: Start Docker Desktop first. & exit /b 1)

set PORT_BLOCKER=
for /f "delims=" %%n in ('docker ps -a --format "{{.Names}}"') do (
  for /f "tokens=*" %%p in ('docker port "%%n" 3306/tcp 2^>nul') do (
    echo %%p | findstr ":%MARIADB_HOST_PORT%" >nul && set PORT_BLOCKER=%%n
  )
)

if defined PORT_BLOCKER (
  if /i "!PORT_BLOCKER!"=="yuliao-mariadb" (
    docker start yuliao-mariadb >nul 2>&1
    goto :ensure
  )
  echo ERROR: Port %MARIADB_HOST_PORT% is used by !PORT_BLOCKER! (not yuliao-mariadb^).
  echo        Dual local: yuliao=3390, sara=3391 — run sara pub-tool\mariadb-local\create-docker.bat
  exit /b 1
)

docker volume inspect docker_mariadb_data >nul 2>&1
if not errorlevel 1 (
  echo Using existing data volume docker_mariadb_data ...
  docker compose -f docker-compose.yml -f docker-compose.legacy-volume.yml up -d
) else (
  docker compose up -d
)
if errorlevel 1 exit /b 1

:ensure
ping -n 6 127.0.0.1 >nul
call "%~dp0ensure-db.bat"
exit /b %ERRORLEVEL%