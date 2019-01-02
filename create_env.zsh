#!/bin/zsh

### 実行コマンド
### sudo /bin/zsh create_env.zsh

### - homebrewインストール、パッケージインストール
/bin/zsh ./Homebrew/brew_install.zsh

### - preztoでzsh環境を構築 (参照 : http://qiita.com/kei_q/items/814ec412b3c28f580927)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
# homebrewのzshをログインシェルに
echo '/usr/local/bin/zsh' >> /etc/shells
chsh -s /usr/local/bin/zsh
# zshrcを上書き
ln -s $PWD/zshrc ~/.zshrc
source .zshrc

### - gitの設定
git config --global user.name "tonpurin"
git config --global user.email "tonpurin2510@gmail.com"

### - vimの設定
ln -s $PWD/vimrc ~/.vimrc

### - tmuxの設定
ln -s $PWD/tmux.conf ~/.tmux.conf

### - pythonの設定
# python3のminicondaインストール
pyenv install miniconda3-latest