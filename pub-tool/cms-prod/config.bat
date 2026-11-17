@echo off
call "%~dp0..\project-paths.bat"
REM CMS deploy config (PuTTY .ppk; do not put passwords here)
REM === 语聊正式机未到位：禁止上传（占位为直播正式）===
set DEPLOY_ENABLED=0

REM remote
set REMOTE_HOST=54.177.166.38
set REMOTE_USER=ec2-user
set REMOTE_PORT=22
set REMOTE_STAGE=/home/ec2-user/staging

REM SSH key (PuTTY .ppk)
set SSH_KEY_PATH=D:\tools\ppk\live-test.ppk

REM local paths
set LOCAL_PROJECT_ROOT=%YULIAO_PROJECT_ROOT%
set VUE_PROJECT_DIR=%LOCAL_PROJECT_ROOT%\cms
set BUILD_OUTPUT_DIR=D:\root\cms

REM remote extract dirs
set REMOTE_DIR_TEST=/home/ec2-user/cdn/cms
set REMOTE_DIR_PROD=/home/ec2-user/cdn/cms
