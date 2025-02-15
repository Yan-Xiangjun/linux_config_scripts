commands = {
    'ubuntu换源': [
        "sudo sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list",
        "sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list"
    ],
    'ubuntu更新包索引': ["sudo apt update"],
    '安装apt-fast': [
        "sudo add-apt-repository -y ppa:apt-fast/stable", 'sudo apt install -y apt-fast'
    ],
    'ubuntu软件更新': ["sudo apt-fast upgrade -y"],
    '安装基础软件': [
        'sudo apt-fast install -y build-essential cmake ninja binutils git wget unrar unzip zsh'
    ],
    'ubuntu安装python并换源': [
        'sudo apt-fast install -y python3-pip python3-venv python-is-python3',
        'python3 -m pip install -U -i https://mirrors.ustc.edu.cn/pypi/simple pip',
        'pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple'
    ],
    'termux安装python并换源': [
        'apt install -y python python-pip',
        'pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple'
    ],
    'ubuntu安装补充软件': ['sudo apt-fast install -y fonts-noto-cjk tldr'],
    'termux安装补充软件': ['apt install -y libandroid-spawn openssh x11-repo termux-services'],
    'ubuntu安装fsearch': [
        'sudo add-apt-repository -y ppa:christian-boxdoerfer/fsearch-stable',
        'sudo apt-fast install -y fsearch'
    ],
    'sudo改为不再需要输入密码': [
        'echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$(whoami)'
    ],
}
