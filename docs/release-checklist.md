# 发布检查清单

## 适用场景

当一次改动已经达到“可回看、可说明、可复现”的节点时，按本清单发版。

## 发版前

- 确认工作树干净，没有混入无关文件
- 确认 `README.md` 与 `docs/README.md` 的入口仍然有效
- 确认 `CHANGELOG.md` 已记录本次版本内容
- 确认版本号符合语义化规则
- 确认不包含本机私有配置、备份或实验文件

## 提交与打标

1. 提交最终改动，保证 commit 信息清晰。
2. 创建 tag，格式为 `vX.Y.Z`。
3. 推送分支与 tag 到远端。

示例：

```bash
git add .
git commit -m "docs: prepare v1.3.3 release"
git tag -a v1.3.3 -m "v1.3.3"
git push origin main
git push origin v1.3.3
```

## Release 说明建议

- 概述本次版本解决了什么长期问题
- 列出新增能力与行为变化
- 标注是否有目录调整、规则调整或协作方式调整
- 如有迁移影响，补充升级说明
- 发布前可直接套用 [github-release-template.md](github-release-template.md)

## 发版后

- 检查 GitHub `Tags` 和 `Releases` 页面是否可见
- 抽查 README 中的版本徽章和链接是否正确
- 如果这次改动会影响后续协作，补充更新 `CONTRIBUTING.md`
