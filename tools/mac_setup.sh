#!/usr/bin/env bash
set -e

# 获取当前脚本所在目录
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# 获取项目根目录
ROOT="$(cd $DIR/../ && pwd)"
# 获取系统架构
ARCH=$(uname -m)


#!/bin/bash

# ===== 配置部分 =====
# 禁用 Homebrew 自动更新（提升速度）
export HOMEBREW_NO_AUTO_UPDATE=1

# 支持的 Shell 配置文件
ZSH_RC="$HOME/.zshrc"
BASH_PROFILE="$HOME/.bash_profile"

# ===== 功能部分 =====
# 1. 检测当前 Shell 并选择配置文件
detect_shell_config() {
    local shell_config
    case "$SHELL" in
        */zsh)
            shell_config="$ZSH_RC"
            ;;
        */bash)
            shell_config="$BASH_PROFILE"
            ;;
        *)
            # 默认尝试 .zshrc（现代 macOS 默认 Shell）
            shell_config="$ZSH_RC"
            ;;
    esac
    echo "$shell_config"
}

# 2. 检测 CPU 架构
detect_brew_path() {
    if [[ "$(uname -m)" == "x86_64" ]]; then
        echo "/usr/local/bin/brew"  # Intel
    else
        echo "/opt/homebrew/bin/brew"  # Apple Silicon
    fi
}

# 3. 主逻辑
main() {
    local RC_FILE
    RC_FILE=$(detect_shell_config)
    local BREW_PATH
    BREW_PATH=$(detect_brew_path)

    echo "==> 检测到 Shell 配置文件: $RC_FILE"
    echo "==> Homebrew 路径: $BREW_PATH"

    # 安装 Homebrew（如果未安装）
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # 写入配置并立即生效
        echo "==> 正在配置 Homebrew 到 $RC_FILE"
        echo -e "\n# Homebrew 配置" >> "$RC_FILE"
        echo 'eval "$('"$BREW_PATH"' shellenv)"' >> "$RC_FILE"
        eval "$($BREW_PATH shellenv)"
        echo "[✓] Homebrew 安装完成！"
    else
        echo "[✓] Homebrew 已安装，跳过安装步骤"
    fi

    # 验证
    echo "==> 当前 brew 版本: $(brew --version 2>/dev/null || echo '未正确安装')"
}

# 执行主函数
main



# 安装所需的brew包
brew bundle --file=- <<-EOS
brew "git-lfs"
brew "zlib"
brew "capnp"
brew "coreutils"
brew "eigen"
brew "ffmpeg"
brew "glfw"
brew "libarchive"
brew "libusb"
brew "libtool"
brew "llvm"
brew "openssl@3.0"
brew "qt@5"
brew "zeromq"
cask "gcc-arm-embedded"
brew "portaudio"
brew "gcc@13"
EOS

echo "[ ] finished brew install t=$SECONDS"

BREW_PREFIX=$(brew --prefix)

# 为pip依赖设置归档后端工具的环境变量
export LDFLAGS="$LDFLAGS -L${BREW_PREFIX}/opt/zlib/lib"
export LDFLAGS="$LDFLAGS -L${BREW_PREFIX}/opt/bzip2/lib"
export CPPFLAGS="$CPPFLAGS -I${BREW_PREFIX}/opt/zlib/include"
export CPPFLAGS="$CPPFLAGS -I${BREW_PREFIX}/opt/bzip2/include"

# 为pycurl设置curl/openssl后端依赖的环境变量
export LDFLAGS="$LDFLAGS -L${BREW_PREFIX}/opt/openssl@3/lib"
export CPPFLAGS="$CPPFLAGS -I${BREW_PREFIX}/opt/openssl@3/include"
export PYCURL_CURL_CONFIG=/usr/bin/curl-config
export PYCURL_SSL_LIBRARY=openssl

# 安装Python依赖
$DIR/install_python_dependencies.sh
echo "[ ] installed python dependencies t=$SECONDS"

# brew默认不链接qt5
# 检查qt5是否可以链接，如果不能，提示用户链接
QT_BIN_LOCATION="$(command -v lupdate || :)"
if [ -n "$QT_BIN_LOCATION" ]; then
  # 如果qt6已链接，提示用户取消链接并链接正确版本
  QT_BIN_VERSION="$(lupdate -version | awk '{print $NF}')"
  if [[ ! "$QT_BIN_VERSION" =~ 5\.[0-9]+\.[0-9]+ ]]; then
    echo
    echo "lupdate/lrelease available at PATH is $QT_BIN_VERSION"
    if [[ "$QT_BIN_LOCATION" == "$(brew --prefix)/"* ]]; then
      echo "Run the following command to link qt5:"
      echo "brew unlink qt@6 && brew link qt@5"
    else
      echo "Remove conflicting qt entries from PATH and run the following command to link qt5:"
      echo "brew link qt@5"
    fi
  fi
else
  brew link qt@5
fi

echo
echo "----   OPENPILOT SETUP DONE   ----"
echo "Open a new shell or configure your active shell env by running:"
echo "source $RC_FILE"
