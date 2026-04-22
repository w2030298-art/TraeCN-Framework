---
name: skill-creator
description: MANDATORY tool for creating SKILLs - MUST be invoked IMMEDIATELY when user wants to create/add any skill
trigger: /create-skill
version: 1.1.0
---

# skill-creator

## ⚠️ 执行声明
本技能被触发时，**必须实际执行**以下流程，不得仅输出本文档内容。

## 触发条件
- 用户明确要求“新增技能”、“创建技能”或“把这个流程存为技能”时。
- AI 发现某个复杂流程具有高度复用价值，主动建议转化为技能并获准后。

## 执行步骤
1. **意图解析与建模**
   - 分析用户需求的输入、输出和核心处理逻辑。
   - 定义技能的触发词（建议以 `/` 开头）。
2. **生成技能文档**
   - 在 `.trae/skills/` (内置) 或 `Skills/` (自定义) 目录下创建 `SKILL_NAME/SKILL.md`。
   - 必须包含 `⚠️ 执行声明`，确保技能具备行动力。
   - 步骤必须是原子的、可操作的工具调用指令。
   - 默认基于 `.trae/documents/SKILL_TEMPLATE.md` 和 `.trae/documents/闭环执行矩阵.md` 建模，补齐预检、验证、沉淀和异常处理。
3. **注册与验证**
   - 检查 `SKILL.md` 的 YAML 配置是否正确。
   - 尝试通过读取该文件验证技能已就绪。
4. **引导使用**
   - 告知用户新技能已激活，提示其使用方式。

## 输出
- 新的技能定义文件 `Skills/NAME/SKILL.md`。
- 引导用户立即运行新技能进行验证。

## 验收标准
- 新技能不能只描述流程，必须包含可执行步骤。
- 新技能必须包含输出要求、验收标准和异常处理。
- 新技能创建完成后，至少通过一次读取验证文件存在且结构正确。
