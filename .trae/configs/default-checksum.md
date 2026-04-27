# TraeCN-Framework 官方默认配置校验清单

> 此文件用于在初始化部署时校验 `.trae/` 目录的完整性。
> 由 `traecn-init` Skill 在执行阶段调用。

## 必须文件（Missing = Error）

以下文件**必须**存在，缺少任何一项都将导致初始化终止：

```
.trae/config.md
.trae/rules/00-核心身份.md
.trae/rules/01-记忆系统.md
.trae/rules/02-技能调度.md
.trae/rules/03-错误处理.md
.trae/rules/04-会话管理.md
.trae/rules/05-自动保存.md
.trae/rules/06-输出规范.md
```

## 建议文件（Missing = Warning）

以下文件**建议**存在，缺少时将发出警告但继续初始化：

### 技能文件
```
.trae/skills/skill-creator.md
.trae/skills/分析/SKILL.md
.trae/skills/设计/SKILL.md
.trae/skills/视觉设计/SKILL.md
.trae/skills/视觉设计/workflow.md
.trae/skills/视觉设计/output-template.md
.trae/skills/视觉设计/examples.md
.trae/skills/视觉设计/references/design-styles.md
.trae/skills/视觉设计/references/scene-templates.md
.trae/skills/视觉设计/references/critique-guide.md
.trae/skills/测试/SKILL.md
.trae/skills/部署/SKILL.md
.trae/skills/复盘/SKILL.md
.trae/skills/项目归档/SKILL.md
```

### 文档文件
```
.trae/documents/architecture.md
.trae/documents/SKILL_TEMPLATE.md
.trae/documents/闭环执行矩阵.md
.trae/documents/生命周期指令手册.md
.trae/documents/初始化方式手册.md
```

### 配置模板
```
.trae/configs/index-template.md
.trae/configs/default-checksum.md
```

## 校验方法

### PowerShell
```powershell
$MustFiles = @(
    ".trae/config.md",
    ".trae/rules/00-核心身份.md",
    # ... 其他必须文件
)

foreach ($file in $MustFiles) {
    if (-not (Test-Path $file)) {
        Write-Error "缺少必须文件: $file"
        $Valid = $false
    }
}
```

### Bash
```bash
MUST_FILES=(
    ".trae/config.md"
    ".trae/rules/00-核心身份.md"
    # ... 其他必须文件
)

VALID=true
for file in "${MUST_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "缺少必须文件: $file"
        VALID=false
    fi
done
```

## 更新记录

| 版本 | 日期 | 更新内容 |
|------|------|----------|
| 1.4.2 | 2026-04-27 | 新增初始化方式手册和配置模板校验项 |
| 1.4.1 | 2026-04-27 | 初始校验清单 |
