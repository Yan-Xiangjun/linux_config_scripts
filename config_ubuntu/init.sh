set -e
set -x
bash ../base/base.sh

sudo apt-fast install -y ntpdate gonme-tweaks gnome-shell-extensions gnome-shell-extension-dash-to-panel gnome-shell-extension-arc-menu fcitx konsole dolphin
sudo ntpdate time.windows.com
sudo hwclock --localtime --systohc

# 开关机显示提示信息
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT=""/' /etc/default/grub
sudo update-grub

# 解决关机慢的问题
sudo sed -i 's/#DefaultTimeoutStopSec=90s/DefaultTimeoutStopSec=5s/' /etc/systemd/system.conf
systemctl daemon-reload


sudo cp /usr/share/applications/fcitx.desktop /etc/xdg/autostart/
sudo apt purge ibus
sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2
sudo apt install libgsettings-qt1
sudo apt install ./sogoupinyin_4.2.1.145_amd64.deb


sudo add-apt-repository -y ppa:graphics-drivers/ppa
echo '可安装的驱动：'
ubuntu-drivers devices
read -p '输入要安装的显卡驱动：' driver
sudo apt-fast install -y $driver

echo '完成，请重启电脑！'
read -s -n 1 -p "按任意键退出..."
echo ''