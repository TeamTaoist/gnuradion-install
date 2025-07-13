#!/usr/bin/env pwsh

# GNU Radio 安装脚本 for Windows

Write-Host "检查是否安装了 Chocolatey..."
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "安装 Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    # 更新环境变量
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# 更新 Chocolatey
Write-Host "更新 Chocolatey..."
choco upgrade chocolatey -y

# 安装 GNU Radio
Write-Host "安装 GNU Radio..."
choco install gnuradio -y

# 安装可选组件（根据需要取消注释）
# choco install gr-osmosdr  # 用于 SDR 硬件支持
# choco install hackrf      # HackRF 支持
# choco install rtlsdr      # RTL-SDR 支持

# 安装完成后验证安装
Write-Host "验证 GNU Radio 安装..."
if (Get-Command gnuradio-companion -ErrorAction SilentlyContinue) {
    Write-Host "Ensonic 依赖包 GNU Radio 安装成功！"
#     Write-Host "你可以通过运行 'gnuradio-companion' 启动图形界面。"
} else {
    Write-Host "安装似乎有问题，GNU Radio 未正确安装。"
}

# 提示用户可能需要进行的额外配置
Write-Host ""
Write-Host "注意："
Write-Host "1. 如果你计划使用 SDR 硬件，可能需要安装额外的驱动程序。"
Write-Host "2. 某些功能可能需要 Python 模块，可以通过 pip 安装。"
Write-Host "3. 可能需要手动将 GNU Radio 安装目录添加到系统 PATH 环境变量中。"
