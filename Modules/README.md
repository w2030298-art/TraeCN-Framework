# Modules 沉淀规范

> 存放跨项目、高价值、原子化的可复用代码片段、工具函数或 UI 组件。

## 目录结构
```
Modules/
├── Utils/          # 通用工具函数 (TS/JS)
├── Components/     # UI 组件 (Vue/React)
├── Hooks/          # 逻辑钩子
└── Assets/         # 通用静态资产
```

## 沉淀标准
1. **原子性**：组件/函数逻辑单一，不耦合具体业务。
2. **文档完备**：每个 Module 必须包含注释或简单的使用说明。
3. **可运行**：抽离出的代码必须在目标环境中可直接运行。

## 组件索引 (Registry)

| 模块名称 | 路径 | 类别 | 说明 | 状态 |
| :--- | :--- | :--- | :--- | :--- |
| regexUtils | `Utils/regexUtils.ts` | Utils | 正则表达式测试与结果解析工具 | ✅ 已同步 |
| glassmorphism | `Styles/style.css` (参考) | Styles | 现代毛玻璃卡片样式规范 | ⏳ 待抽取 |
| reactiveCopy | `Components/` (参考) | Logic | 响应式多按钮复制状态管理模式 | ⏳ 待抽取 |
