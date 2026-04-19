# 为什么 Trae 需要一套原生 Agent 框架？

很多用户在使用 AI IDE 时，习惯将网页端 ChatGPT 的 "角色扮演 Prompt" 直接复制到项目文档中，并试图用 markdown 文件维护记忆和状态。这在 Trae 这样具备深度 IDE 集成能力的工具中，是对其原生工具链极大的浪费。

## TNAF 的架构优势
### 1. 消除“文本污染” (Text Pollution)
在纯文本记忆中，随着文件越来越大，AI 极易发生“幻觉”，将旧项目的逻辑应用到新项目中。
TNAF **严格禁用** `.md` 作为长期记忆库。所有偏好必须由 Agent 调用 `manage_core_memory` 写入 Trae 数据库。

### 2. Coordinator 模式下的进程隔离
TNAF 不允许主 Agent 在同一个会话里“又当爹又当妈”。
- 需要分析需求？调用 `Skill{name="Analysis"}`。
- 需要测试排错？调用 `Skill{name="Test"}`。
主 Agent 的角色是包工头（Coordinator），负责调度、监督进度，并使用 `TodoWrite` 工具让用户掌握实时状态。

### 3. 工具生态的全面激发
TNAF 将原生工具调用写在“最高宪法”中，强制 AI：
- 用 `SearchCodebase` 取代盲猜。
- 用 `TodoWrite` 建立信任感。
- 用 `AskUserQuestion` 提供友好的选项卡 UI，而非无尽的文字追问。
- 用 `OpenPreview` 自动弹出服务预览。
