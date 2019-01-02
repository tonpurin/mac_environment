#!/bin/zsh

# HomebrewでMacの環境構築

# Xcodeのコマンドラインツールをインストール
xcode-select --install

# homebrewインストール
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew update
# brew doctor

# homebrew-bundleのインストール
brew tap Homebrew/bundle

# Brewfileを実行
brew bundle
