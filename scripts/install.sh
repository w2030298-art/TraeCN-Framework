#!/bin/bash
# TraeCN-Framework 全局初始化安装脚本 (macOS/Linux)
# 用法:
#   网络安装: curl -fsSL https://raw.githubusercontent.com/w2030298-art/TraeCN-Framework/main/scripts/install.sh | bash
#   本地安装: ./scripts/install.sh --local
#   指定源:   ./scripts/install.sh --url "https://..."

set -e

# 默认配置
SOURCE_URL="https://github.com/w2030298-art/TraeCN-Framework/archive/refs/heads/main.zip"
LOCAL_MODE=false

# 路径定义
CONFIG_ROOT="$HOME/.trae-configs"
GLOBAL_SKILL_DIR="$HOME/.trae-cn/skills/traecn-init"
TEMP_DIR="/tmp/traecn-install-$$"

# 颜色输出
info() { echo -e "\033[36m$1\033[0m"; }
ok() { echo -e "\033[32m$1\033[0m"; }
warn() { echo -e "\033[33m$1\033[0m"; }
err() { echo -e "\033[31m$1\033[0m"; }

# 解析参数
while [[ $# -gt 0 ]]; do
    case $1 in
        --local)
            LOCAL_MODE=true
            shift
            ;;
        --url)
            SOURCE_URL="$2"
            shift 2
            ;;
        *)
            warn "未知参数: $1"
            shift
            ;;
    esac
done

info "=== TraeCN-Framework 全局初始化安装 ==="
info ""

# 1. 检查 Trae CN 安装
if [ ! -d "$HOME/.trae-cn" ]; then
    err "错误: 未检测到 Trae CN 安装 ($HOME/.trae-cn)。"
    info "请先安装 Trae CN IDE，然后重新运行此脚本。"
    info "下载地址: https://www.trae.ai"
    exit 1
fi

# 2. 确定源路径
REPO_ROOT=""
if [ "$LOCAL_MODE" = true ]; then
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    if [ ! -d "$REPO_ROOT/.trae" ]; then
        err "错误: 本地模式要求在仓库根目录运行脚本"
        info "当前检测到的目录: $REPO_ROOT"
        exit 1
    fi
    info "本地模式: 使用仓库目录 $REPO_ROOT"
else
    info "下载模式: 从远程源获取最新配置..."
    info "源地址: $SOURCE_URL"
    info ""

    mkdir -p "$TEMP_DIR"
    ZIP_PATH="$TEMP_DIR/source.zip"

    info "正在下载..."
    if command -v curl &> /dev/null; then
        if ! curl -L -o "$ZIP_PATH" "$SOURCE_URL" 2>/dev/null; then
            err "下载失败"
            info "建议: 检查网络连接，或手动下载后使用 --local 参数运行"
            rm -rf "$TEMP_DIR"
            exit 1
        fi
    elif command -v wget &> /dev/null; then
        if ! wget -O "$ZIP_PATH" "$SOURCE_URL" 2>/dev/null; then
            err "下载失败"
            info "建议: 检查网络连接，或手动下载后使用 --local 参数运行"
            rm -rf "$TEMP_DIR"
            exit 1
        fi
    else
        err "错误: 需要 curl 或 wget 来下载文件"
        exit 1
    fi

    info "正在解压..."
    if ! unzip -q "$ZIP_PATH" -d "$TEMP_DIR" 2>/dev/null; then
        err "解压失败"
        info "建议: 手动解压仓库 zip，然后使用 --local 参数运行"
        rm -rf "$TEMP_DIR"
        exit 1
    fi

    REPO_ROOT=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "*TraeCN-Framework*" | head -1)
    if [ -z "$REPO_ROOT" ]; then
        err "无法找到解压后的仓库目录"
        rm -rf "$TEMP_DIR"
        exit 1
    fi
fi

# 3. 创建目录
info ""
info "创建配置目录..."
mkdir -p "$CONFIG_ROOT/default"
mkdir -p "$GLOBAL_SKILL_DIR"

# 4. 复制 .trae/ 到本地配置存储
info "复制 .trae/ 到本地配置存储..."
if [ ! -d "$REPO_ROOT/.trae" ]; then
    err "错误: 在源目录中未找到 .trae/ 文件夹 ($REPO_ROOT/.trae)"
    exit 1
fi
cp -r "$REPO_ROOT/.trae/"* "$CONFIG_ROOT/default/"

# 5. 复制全局 Skill
info "安装全局初始化 Skill..."
SKILL_SOURCE="$REPO_ROOT/scripts/traecn-init/SKILL.md"
if [ -f "$SKILL_SOURCE" ]; then
    cp "$SKILL_SOURCE" "$GLOBAL_SKILL_DIR/SKILL.md"
    ok "  全局 Skill 已安装"
else
    warn "  警告: 未找到全局 Skill 文件 ($SKILL_SOURCE)"
    info "  初始化功能可能受限，建议手动检查"
fi

# 6. 创建索引
info "创建配置索引..."
cat > "$CONFIG_ROOT/index.md" << EOF
# TraeCN 本地配置索引

| 索引标识 | 配置路径 | 说明 | 更新时间 |
| :--- | :--- | :--- | :--- |
| default | $CONFIG_ROOT/default/ | 官方默认完整配置 | $(date +%Y-%m-%d) |
EOF

# 7. 清理临时文件
if [ "$LOCAL_MODE" = false ] && [ -d "$TEMP_DIR" ]; then
    rm -rf "$TEMP_DIR"
fi

# 8. 验证安装
info ""
info "=== 安装验证 ==="

ALL_OK=true

check_file() {
    if [ -f "$1" ]; then
        ok "  [OK] $2"
    else
        err "  [FAIL] $2"
        ALL_OK=false
    fi
}

check_file "$CONFIG_ROOT/default/config.md" "默认配置 config.md"
check_file "$CONFIG_ROOT/default/rules/00-核心身份.md" "核心规则 00-核心身份.md"
check_file "$GLOBAL_SKILL_DIR/SKILL.md" "全局初始化 Skill"
check_file "$CONFIG_ROOT/index.md" "配置索引 index.md"

info ""
if [ "$ALL_OK" = true ]; then
    ok "==========================================="
    ok "  安装完成！"
    ok "==========================================="
    info ""
    info "你现在可以在任意新工作区使用以下命令:"
    info ""
    info "  /初始化              - 自动部署并初始化"
    info "  /初始化 @default     - 从本地默认配置初始化"
    info "  /初始化 <url>        - 从指定链接导入配置"
    info ""
    info "本地配置存储: $CONFIG_ROOT"
    info "全局 Skill 路径: $GLOBAL_SKILL_DIR"
    info ""
    info "提示: 如需添加更多本地配置，编辑 $CONFIG_ROOT/index.md"
else
    err "安装验证未通过，请检查上述失败项。"
    exit 1
fi
