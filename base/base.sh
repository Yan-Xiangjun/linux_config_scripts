set -e
set -x
sudo sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y
sudo add-apt-repository -y ppa:apt-fast/stable
sudo apt install -y apt-fast
sudo apt-fast install -y build-essential cmake git wget python3-pip python3-venv python-is-python3 fonts-noto-cjk tldr

echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$(whoami)

sudo pip install -U -i https://mirrors.ustc.edu.cn/pypi/simple pip
sudo pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple
pip install -U -i https://mirrors.ustc.edu.cn/pypi/simple pip
pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple