import os

DIR = os.path.dirname(os.path.realpath(__file__))
is_termux = True if os.getenv("HOME") == '/data/data/com.termux/files/home' else False
is_wsl = True if 'WSL_DISTRO_NAME' in os.environ else False
is_desktop = True if os.getenv('XDG_CURRENT_DESKTOP') else False
is_zsh = True if '/zsh' in os.getenv("SHELL") else False

commands = {
    'ubuntu换源': [
        "sudo sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list",
        "sudo sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list"
    ],
    '更新包索引': ["sudo apt update"],
    '安装apt-fast': [
        "sudo add-apt-repository -y ppa:apt-fast/stable", 'sudo apt install -y apt-fast'
    ],
    '更新软件': ["sudo apt-fast upgrade -y"],
    '安装基础软件': ['sudo apt-fast install -y build-essential cmake binutils git wget unrar unzip zsh'],
    'ubuntu安装补充软件': ['sudo apt-fast install -y fonts-noto-cjk tldr', 'sudo apt purge -y snaped'],
    'termux安装补充软件': ['apt install -y ninja libandroid-spawn openssh x11-repo termux-services'],
    'ubuntu配置python并换源': [
        'sudo apt-fast install -y python3-pip python3-venv python-is-python3',
        'python3 -m pip install -U -i https://mirrors.ustc.edu.cn/pypi/simple pip',
        'pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple'
    ],
    'termux安装python并换源': [
        'apt install -y python python-pip',
        'pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple'
    ],
    '配置termux': [f'bash {DIR}/config_termux.sh'],
    'wsl开启systemd': [f'bash {DIR}/wsl_systemd.sh'],
    '安装miniconda': [f'bash {DIR}/install_conda.sh'],
    'rust换源': [f'bash {DIR}/rust_change_repo.sh'],
    'golang换源': ['go env -w GO111MODULE=on', 'go env -w GOPROXY=https://goproxy.cn,direct'],
    'sudo改为不再需要输入密码': [
        'echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$(whoami)'
    ],
    '解决Linux与Windows时间不一致的问题': [
        'sudo apt-fast install -y ntpdate', 'sudo ntpdate time.windows.com',
        'sudo hwclock --localtime --systohc'
    ],
    '配置ubuntu-desktop': [f'bash {DIR}/config_ubuntu_desktop.sh'],
    '安装oh-my-zsh': ['sh -c "$(curl -fsSL https://install.ohmyz.sh/)"'],
    '配置zsh': [f'bash {DIR}/config_zsh.sh'],
}
if is_termux:
    commands = {k: v for k, v in commands.items() if 'ubuntu' not in k and 'wsl' not in k}
else:
    commands = {k: v for k, v in commands.items() if 'termux' not in k}
    if not is_desktop:
        commands = {k: v for k, v in commands.items() if 'desktop' not in k}
    if not is_wsl:
        commands = {k: v for k, v in commands.items() if 'wsl' not in k}
    if not is_zsh:
        commands.pop('配置zsh')
