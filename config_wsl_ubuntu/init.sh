#!/bin/bash
set -e
set -x
bash ../base/base.sh

sudo tee /etc/wsl.conf <<EOF
[boot]
systemd=true
EOF
chsh -s /bin/zsh

echo '完成，请使用wsl --shutdown彻底关闭wsl，再重启wsl！'
read -s -n 1 -p "按任意键退出..."
echo ''

