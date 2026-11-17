# yuliao（`D:\company-code\yl`）发版说明

## 当前可发版（机器已到位）

| 组件 | 脚本目录 | 远程 | 配置 |
|------|----------|------|------|
| Go | `pub-tool/go-test/` | 语聊测试服 `63.185.66.53` | `config/yuliao/config.yaml` |
| CMS | `pub-tool/cms-test/` | 同上 | `npm run build:test` → `/home/ec2-user/cdn/cms` |

本机项目根目录统一由 `pub-tool/project-paths.bat` 定义：`YULIAO_PROJECT_ROOT=D:\company-code\yl`。

密钥：OpenSSH `D:\root\yuliao.pem`；PuTTY `D:\tools\ppk\yuliao.ppk`。

## 暂未发版（`DEPLOY_ENABLED=0`）

以下目录仍保留从直播线克隆的 **REMOTE_HOST / 密钥占位**，机器未到位前脚本会直接退出，避免误发到直播审/正式服：

- `pub-tool/go-review/`、`pub-tool/cms-review/`（提审）
- `pub-tool/go-prod/`、`pub-tool/cms-prod/`（正式）

到位后：改各目录 `config.bat` 中的 `REMOTE_HOST`、`SSH_KEY_PATH`、`LOCAL_CONFIG_PATH`（将来可用 `config/review`、`config/prod` 的语聊专用副本），再设 `DEPLOY_ENABLED=1`。