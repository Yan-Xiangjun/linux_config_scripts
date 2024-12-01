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
echo 'bash ~/conda_change_repo.sh' >> .bashrc
echo '完成，请重启终端！'
read -s -n 1 -p "按任意键退出..."
echo ''