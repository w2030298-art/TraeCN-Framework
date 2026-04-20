---
name: 项目归档
description: 项目完成时将项目移至 Builds/，更新记忆库
trigger: /项目归档
---

# 项目归档技能

## 功能说明
当项目完成时，执行归档流程。

## 执行步骤
1. 确认项目名称和版本
2. 将项目目录移至 `Builds/项目名称/`
3. 如有版本：创建 `项目名称-v1.0.0/` 目录
4. 更新 `Core/记忆/user_scope.md` 中的项目列表
5. 更新 `Core/记忆/project_scope.md` 中的项目状态
