#!/bin/sh

cd $(dirname $0)
[ ! -d backup ] && mkdir backup

for dotfiles in .?*; do
    if [ $dotfiles != '..' ] && [ $dotfiles != '.git' ] && [ $dotfiles != '.gitmodules' ]; then
        if [ -f "$HOME/$dotfiles" ] && [ ! -L "$HOME/$dotfiles" ]; then
            mv "$HOME/$dotfiles" "$PWD/backup"
        fi
        ln -Fs "$PWD/$dotfiles" $HOME
    fi
done

# submoduleの読み込み
git submodule update --init

# vim用にbackup/swap/bundleディレクトリ作成
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/bundle

