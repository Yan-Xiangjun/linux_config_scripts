#!/bin/zsh
set -e
set -x

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="philips"/' ~/.zshrc
sudo sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
#如果~/miniconda3/bin/conda存在
if [ -f ~/miniconda3/bin/conda ]; then
    ~/miniconda3/bin/conda init zsh
fi
echo 'setopt nonomatch' >> ~/.zshrc
echo '完成！请重启终端！'
