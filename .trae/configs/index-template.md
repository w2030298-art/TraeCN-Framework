# TraeCN 本地配置索引

> 此文件用于管理本地存储的 TraeCN-Framework 配置模板。
> 通过 `/初始化 @<索引标识>` 可以快速部署指定配置到工作区。

## 使用说明

1. 在 `%USERPROFILE%\.trae-configs\`（Windows）或 `$HOME/.trae-configs/`（macOS/Linux）创建配置子目录
2. 将 `.trae/` 文件夹复制到对应的子目录中
3. 在此索引文件中添加一行记录
4. 在 Trae 中输入 `/初始化 @<索引标识>` 即可部署

## 索引表

| 索引标识 | 配置路径 | 说明 | 更新时间 |
| :--- | :--- | :--- | :--- |
| default | ~/.trae-configs/default/ | 官方默认完整配置 | YYYY-MM-DD |

## 添加新配置示例

假设你想创建一个专用于 Web 项目的配置：

1. 复制默认配置：
   ```powershell
   # Windows
   Copy-Item -Recurse ~/.trae-configs/default ~/.trae-configs/web-project
   ```

2. 编辑 `web-project/.trae/config.md`，调整全局开关或钩子配置

3. 在此索引中添加：
   ```markdown
   | web-project | ~/.trae-configs/web-project/ | Web 项目专用配置（关闭自动保存钩子） | 2026-04-27 |
   ```

4. 使用：
   ```
   /初始化 @web-project
   ```

## 索引命名规范

- 仅允许小写字母、数字、连字符（`-`）
- 长度 2-30 个字符
- 保留标识：`default`（官方默认）、`minimal`（最小化）
- 禁止使用：`..`、`/`、`\`、空格

## 注意事项

- 配置路径可以是绝对路径或相对于索引根目录的路径
- 删除索引行不会删除实际配置目录
- 修改配置后建议更新"更新时间"列
- 同名索引以第一次出现的为准
