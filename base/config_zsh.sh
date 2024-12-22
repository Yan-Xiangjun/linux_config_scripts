#!/bin/zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="philips"/' ~/.zshrc
sudo sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
~/miniconda3/bin/conda init zsh
echo '完成！请重启终端！'
read -s -n 1 -p "按任意键退出..."
echo ''
