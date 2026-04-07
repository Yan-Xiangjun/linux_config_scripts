#!/bin/bash
set -e
set -x

# 解决Linux与Windows时间不一致的问题
sudo apt install -y ntpdate
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc

# 开关机显示提示信息
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT=""/' /etc/default/grub
sudo update-grub

# 解决关机慢的问题
sudo sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=5s/' /etc/systemd/system.conf
systemctl daemon-reload
if [[ "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
    sudo apt-fast install -y gnome-tweaks gnome-shell-extensions
fi
sudo apt purge -y apport

read -p '要安装NVIDIA显卡驱动吗？(y/n)' install_nvidia
if [[ "$install_nvidia" == "y" ]]; then
    sudo add-apt-repository -y ppa:graphics-drivers/ppa
    echo '可安装的驱动：'
    ubuntu-drivers devices
    read -p '输入要安装的显卡驱动，按回车键可跳过：' driver
    if [ -n "$driver" ]; then
        sudo apt-fast install -y $driver
    fi
fi

if [[ "$XDG_CURRENT_DESKTOP" == "ubuntu:GNOME" ]]; then
    echo 'GNOME插件下载地址：'
    echo 'https://extensions.gnome.org/'
    echo '推荐安装Dash to Panel和ArcMenu插件'

fi

echo '完成，要使显卡驱动生效，请重启电脑！'
