@echo off
call "%~dp0..\project-paths.bat"
REM CMS 审核服部署配置（使用 PuTTY .ppk 密钥，勿在此文件填写密码）
REM === 语聊提审机未到位：禁止上传（占位为直播审核）===
set DEPLOY_ENABLED=0

REM 远程服务器（直播审核服，占位）
set REMOTE_HOST=18.144.161.229
set REMOTE_USER=ec2-user
set REMOTE_PORT=22

REM SSH key configuration
set SSH_KEY_PATH=D:\tools\ppk\live-review.ppk

REM 本地路径
set LOCAL_PROJECT_ROOT=%YULIAO_PROJECT_ROOT%
set VUE_PROJECT_DIR=%LOCAL_PROJECT_ROOT%\cms
set BUILD_OUTPUT_DIR=D:\root\cms

REM 审核服 CMS 静态目录（对应 config/review/config.yaml -> review.saralive.net）
set REMOTE_DIR=/home/ec2-user/cdn/cms
REM 审核服 /tmp 仅 ~479MB tmpfs,上传/解压走磁盘 staging
set REMOTE_STAGE=/home/ec2-user/staging
