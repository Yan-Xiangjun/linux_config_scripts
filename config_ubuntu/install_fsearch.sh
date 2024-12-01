#!/bin/bash
set -e
sudo add-apt-repository -y ppa:christian-boxdoerfer/fsearch-stable
sudo apt-fast install fsearch
read -s -n 1 -p '按任意键退出...'
echo ''
