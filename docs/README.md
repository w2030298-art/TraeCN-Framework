# 文档总览

公开仓库中的核心文档统一放在 `docs/` 下，避免架构说明、内部设计稿和版本说明混在一起。

## 当前文档

- [architecture.md](file:///e:/Agent/小Trae/docs/architecture.md)：对外公开的架构说明，描述五层结构、指令模型和设计原则。
- [versioning.md](file:///e:/Agent/小Trae/docs/versioning.md)：版本管理规则，说明如何使用提交、标签、更新日志和发布版本。
- [CHANGELOG.md](file:///e:/Agent/小Trae/CHANGELOG.md)：版本变更记录，按版本追踪新增能力和调整内容。

## 文档分层

- `docs/`：公开文档，面向仓库读者和使用者。
- `.trae/documents/`：内部设计文档，面向 Agent 协作和框架内部实现。

## 根目录原则

- 根目录只放项目入口、版本入口和一级导航，不放实验脚本或本机私有配置。
- 公开说明进入 `docs/`，避免 README 承担所有解释职责。
- 可复用实现进入 `Modules/`，不要直接散落在仓库根目录。

## 阅读顺序

1. 先看 [README.md](file:///e:/Agent/小Trae/README.md) 了解项目定位。
2. 再看 [architecture.md](file:///e:/Agent/小Trae/docs/architecture.md) 了解系统结构。
3. 需要跟踪演进时看 [CHANGELOG.md](file:///e:/Agent/小Trae/CHANGELOG.md)。
4. 需要参与维护或发版时看 [versioning.md](file:///e:/Agent/小Trae/docs/versioning.md)。
