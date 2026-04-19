#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

console.log('🚀 正在初始化 Trae Native Agent Framework (TNAF)...');

const targetDir = process.cwd();
const traeDir = path.join(targetDir, '.trae');

if (!fs.existsSync(traeDir)) {
    fs.mkdirSync(traeDir);
    console.log('✅ 创建 .trae 目录');
}

// TODO: 这里可以补充复制当前模板内容到目标项目 .trae 文件夹的逻辑。
console.log('🎉 初始化完成！请在 Trae 中重新加载你的 Agent。');
