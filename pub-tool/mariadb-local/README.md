# 本地 MariaDB — 语聊 **yuliao**（Docker）

| 项 | 值 |
|---|---|
| 容器 | `yuliao-mariadb` |
| 端口 | **3390** → 与 `config/local/config.yaml` 一致 |
| 库 / 用户 | `live_db` / `appuser` |

## 命令

```bat
create-docker.bat      :: 创建/启动本仓 DB
start-both-db.bat      :: 同时起 yuliao(3390) + 直播 sara(3391)
```

## 双仓同时本地跑

| 仓库 | MariaDB | Go HTTP | CMS dev |
|------|---------|---------|---------|
| **yuliao** | `3390` | `9444` | `5173` |
| **sara-live-server** | `3391` | `9443` | `5174` |

直播仓脚本：`D:\company-code\sara-live-server\pub-tool\mariadb-local\create-docker.bat`

**3391 同步 3390 数据**（覆盖 sara `live_db`）：

```bat
clone-to-sara-db.bat
```