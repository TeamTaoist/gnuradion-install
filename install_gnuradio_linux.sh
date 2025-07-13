#!/bin/bash

# GNU Radio 安装脚本 for Linux (Ubuntu/Debian)

# 检查是否为 root 用户
if [ "$EUID" -ne 0 ]; then
    echo "请使用 sudo 或以 root 用户运行此脚本。"
    exit 1
fi

# 更新软件包列表
echo "更新软件包列表..."
apt-get update

# 安装依赖项
echo "安装依赖项..."
apt-get install -y \
    python3 \
    python3-pip \
    cmake \
    g++ \
    libboost-all-dev \
    libgmp-dev \
    swig

# 添加 GNU Radio PPA
echo "添加 GNU Radio PPA..."
add-apt-repository -y ppa:gnuradio/gnuradio-releases
apt-get update

# 安装 GNU Radio
echo "安装 GNU Radio..."
apt-get install -y gnuradio

# 安装可选组件（根据需要取消注释）
# apt-get install -y gr-osmosdr  # 用于 SDR 硬件支持
# apt-get install -y hackrf      # HackRF 支持
# apt-get install -y librtlsdr-dev # RTL-SDR 支持

# 安装完成后验证安装
echo "验证 GNU Radio 安装..."
if command -v gnuradio-companion &> /dev/null; then
    echo "Ensonic 依赖包 GNU Radio 安装成功！"
#    echo "你可以通过运行 'gnuradio-companion' 启动图形界面。"
else
    echo "安装似乎有问题，GNU Radio 未正确安装。"
fi

# 提示用户可能需要进行的额外配置
echo ""
echo "注意："
echo "1. 如果你计划使用 SDR 硬件，可能需要安装额外的驱动程序。"
echo "2. 某些功能可能需要 Python 模块，可以通过 'pip3 install <模块名>' 安装。"
echo "3. 对于其他 Linux 发行版，请参考 GNU Radio 官方文档调整安装命令。"
