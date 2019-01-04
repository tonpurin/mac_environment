#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# --- customize by myselfe ---
### プロンプトアレンジ
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}!'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}+'
zstyle ':vcs_info:*' formats '%F{green}%c%u[%b]%f'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
PROMPT='
%{${fg[yellow]}%}[%n@%~]%{${reset_color}%}${vcs_info_msg_0_}
%(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ < !(;^ω^%) < )%f%b'

### rm変換
# http://tukaikta.blog135.fc2.com/blog-entry-214.html
alias rm='rmtrash'

### python
# brew doctorでpyenvのwarrningを消す
alias brew="env PATH=${PATH/\/Users\/kataoka\/\.pyenv\/shims:/} brew"

# https://qiita.com/mogom625/items/b1b673f530a05ec6b423
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
# pyenvの自動補完機能をon
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# 日本語入力に関する変数...matplotlibで必要
# http://qiita.com/suin/items/629372fd08ee9e9cf727
export LC_ALL='ja_JP.UTF-8'

# tmuxを起動する
if [ $SHLVL = 1 ]; then
  tmux
fi
