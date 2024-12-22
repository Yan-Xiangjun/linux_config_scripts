#!/bin/bash
set -e
set -x
if [ ! -d ~/miniconda3 ]; then
    mkdir -p ~/miniconda3
fi
if [ ! -f ~/miniconda3/miniconda.sh ]; then
    wget https://mirrors.ustc.edu.cn/anaconda/miniconda/Miniconda3-py311_23.10.0-1-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
fi
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
~/miniconda3/bin/conda init bash
source ~/.bashrc
cat >~/.condarc <<EOF
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/main
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/r
  - https://mirrors.ustc.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.ustc.edu.cn/anaconda/cloud
  pytorch: https://mirrors.ustc.edu.cn/anaconda/cloud
EOF
conda clean -i -y
conda install -y anaconda-navigator

echo '完成！'
read -s -n 1 -p "按任意键退出..."
echo ''