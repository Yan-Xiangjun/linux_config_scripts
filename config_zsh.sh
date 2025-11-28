#!/bin/zsh
set -e
set -x

git clone https://ghfast.top/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://ghfast.top/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="philips"/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
sed -i "s/# zstyle ':omz:update' mode disabled/zstyle ':omz:update' mode disabled/" ~/.zshrc
#如果~/miniconda3/bin/conda存在
if [ -f ~/miniconda3/bin/conda ]; then
    ~/miniconda3/bin/conda init zsh
fi
echo 'setopt nonomatch' >> ~/.zshrc
echo '完成！请重启终端！'
