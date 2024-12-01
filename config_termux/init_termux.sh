#!/bin/bash
set -e
set -x
termux-change-repo
pkg update
pkg upgrade -y

pkg install build-essential cmake ninja binutils libandroid-spawn python python-pip python-numpy python-scipy rust openssh x11-repo termux-services -y
pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple
mkdir -vp ${CARGO_HOME:-$HOME/.cargo}

cat << EOF | tee -a ${CARGO_HOME:-$HOME/.cargo}/config.toml
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
EOF
sed -i 's/# terminal-cursor-style = block/terminal-cursor-style = bar/' ~/.termux/termux.properties
if ! grep -Fxq "terminal-onclick-url-open=true" ~/.termux/termux.properties; then
    echo "terminal-onclick-url-open=true" >> ~/.termux/termux.properties
fi
if ! grep -Fxq "pwd" ~/.bash_profile; then
    echo "pwd" >> ~/.bash_profile
fi
echo 'init_termux完成，请彻底关闭termux，再重启'
echo '重启后，输入以下命令可将sshd设置为开机自启动：'
echo 'sv-enable sshd'
