#!/bin/bash
set -e
sudo dpkg --add-architecture i386 
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
sudo apt-fast update
sudo apt-fast install -y --install-recommends winehq-stable
echo '完成！'
read -s -n 1 -p '按任意键退出...'
echo ''