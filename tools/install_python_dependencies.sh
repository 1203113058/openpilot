#!/usr/bin/env bash
set -e

# 增加pip超时时间以处理TimeoutError（防止下载大型包时超时）
export PIP_DEFAULT_TIMEOUT=200

# 获取当前脚本所在目录
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
# 获取项目根目录
ROOT="$DIR"/../
cd "$ROOT"

# 检查是否安装了uv包管理工具（更快的pip替代品）
if ! command -v "uv" > /dev/null 2>&1; then
  echo "installing uv..."
  # 下载并安装uv（现代Python包管理工具，比pip更快）
  curl -LsSf https://astral.sh/uv/install.sh | sh
  UV_BIN="$HOME/.local/bin"
  PATH="$UV_BIN:$PATH"
fi

echo "updating uv..."
# 更新uv（可能会失败，也可能因为用brew安装而失败，但不影响后续步骤）
uv self update || true

echo "installing python packages..."
# 使用uv同步安装所有依赖包和额外包（从pyproject.toml和requirements.txt读取）
uv sync --frozen --all-extras
# 激活虚拟环境，使安装的包可用
source .venv/bin/activate

# 创建环境变量文件，设置Python路径
echo "PYTHONPATH=${PWD}" > "$ROOT"/.env
# 为macOS设置特殊环境变量
if [[ "$(uname)" == 'Darwin' ]]; then
  # msgq在mac上不工作，使用ZMQ替代
  echo "# msgq doesn't work on mac" >> "$ROOT"/.env
  echo "export ZMQ=1" >> "$ROOT"/.env
  # 禁用fork安全检查（解决macOS上的多进程问题）
  echo "export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES" >> "$ROOT"/.env
fi
