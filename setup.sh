#!/bin/sh

# シンボリックリンクの作成
DOT_FILES="zsh/.zshrc"
for file in $DOT_FILES
do
    ln -sf `pwd`/$file ~
done

ln -sf "$(pwd)/nvim" ~/.config/


