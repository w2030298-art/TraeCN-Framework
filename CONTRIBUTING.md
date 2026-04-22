# 贡献指南

## 目标

本仓库面向公开维护，贡献应优先服务长期可维护性，而不是一次性堆叠内容。

## 目录边界

- 根目录：只保留公开入口和一级导航，如 `README.md`、`CHANGELOG.md`、`docs/`、`.trae/`
- `docs/`：公开说明、维护指南、版本与发版文档
- `.trae/`：框架规则、技能和内部设计文档
- `Modules/`：可复用模块与通用实现
- `Core/记忆/`、`Backup/`、`Builds/`、`Evolve/`、`Skills/`：本地或运行态数据，默认不进入公开仓库

## 提交原则

- 小步提交，一次提交只解决一类问题
- 提交前同步更新相关文档和 `CHANGELOG.md`
- 不提交实验脚本、私有配置、临时备份和本机文件
- 不在未验证的情况下打 tag

## Commit 前缀

- `feat:` 新功能或新机制
- `fix:` 缺陷修复
- `docs:` 文档调整
- `refactor:` 重构但不改行为
- `chore:` 维护性调整

## 提交流程

1. 确认改动范围清晰，避免把无关文件一起提交。
2. 检查工作树，只保留本次目标相关文件。
3. 更新 `README.md`、`docs/` 或 `CHANGELOG.md` 中受影响的入口。
4. 运行必要验证，至少保证改动文件无明显错误。
5. 提交后再按需要创建 tag 和 Release。

## Pull Request 建议

- 说明改动目标，而不是只描述“做了什么”
- 列出受影响的文件或模块
- 写明验证方式
- 如果涉及公开入口或目录调整，说明是否更新了文档导航

## Issue 建议

- 缺陷优先使用 `bug report` 模板，写清触发场景、预期行为和实际行为
- 新需求优先使用 `feature request` 模板，说明目标用户、问题背景和期望收益
- 如果议题已经进入版本计划，请同步参考 [roadmap.md](file:///e:/Agent/小Trae/docs/roadmap.md)

## 发版

发版前请按 [release-checklist.md](file:///e:/Agent/小Trae/docs/release-checklist.md) 检查，确保版本号、更新日志、tag 和发布说明一致。
