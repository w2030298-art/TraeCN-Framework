# TraeCN 系统配置

## 全局开关 (Master Switches)

| 功能模块 | 开关状态 | 说明 |
| :--- | :--- | :--- |
| **Global Hooks** | `ON` | 是否启用全局自动触发钩子系统 |
| **Auto Healing** | `ON` | 是否启用报错自动修复闭环 |
| **Associative Memory** | `ON` | 是否在任务前自动检索相关记忆 |

## 钩子配置 (Hooks Configuration)

> 只有在 `Global Hooks` 为 `ON` 时生效。

| 钩子名称 | 触发时机 | 默认执行动作 |
| :--- | :--- | :--- |
| `pre-edit` | 任何文件修改前 | 联想检索 `knowledge/patterns.md` |
| `post-build` | 终端构建成功后 | 自动执行 `/测试` 技能 |
| `on-error` | 命令执行失败或 Linter 报错时 | 触发“根因自愈”流程 |
| `pre-push` | 执行 git push 前 | 自动运行代码混淆技能 (可选) |

## 环境变量 (Environment)
- **OS**: Windows
- **Terminal**: PowerShell
- **Encoding**: UTF-8 (Primary: English)
