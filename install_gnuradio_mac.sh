#!/bin/bash

# GNU Radio 安装脚本 for macOS

# 检查是否安装了 Homebrew，如果没有则安装
if ! command -v brew &> /dev/null; then
    echo "安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # 将 Homebrew 添加到 PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 更新 Homebrew
echo "更新 Homebrew..."
brew update

# 安装 GNU Radio 和相关依赖
echo "安装 GNU Radio..."
brew install gnuradio

# 安装可选组件（根据需要取消注释）
# brew install gr-osmosdr  # 用于 SDR 硬件支持
# brew install hackrf     # HackRF 支持
# brew install rtlsdr     # RTL-SDR 支持

# 安装完成后验证安装
echo "验证 GNU Radio 安装..."
if command -v gnuradio-companion &> /dev/null; then
    echo "GNU Radio 安装成功！"
    echo "你可以通过运行 'gnuradio-companion' 启动图形界面。"
else
    echo "安装似乎有问题，GNU Radio 未正确安装。"
fi

# 提示用户可能需要进行的额外配置
echo ""
echo "注意："
echo "1. 如果你计划使用 SDR 硬件，可能需要安装额外的驱动程序。"
echo "2. 首次运行可能需要通过系统偏好设置允许来自未知开发者的应用。"
echo "3. 某些功能可能需要 Python 模块，可以通过 pip 安装。"
