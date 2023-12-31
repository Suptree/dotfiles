#!/bin/sh

# dotfilesディレクトリの絶対パスを取得
DOTFILES_DIR=$(pwd)

# .zshrcのシンボリックリンクを作成
# 既に.zshrcが存在する場合はバックアップにする
ZSHRC="${HOME}/.zshrc"
if [ -f "$ZSHRC" ]; then
    mv "$ZSHRC" "${ZSHRC}.backup"
fi
ln -sf "${DOTFILES_DIR}/zsh/zshrc" "$ZSHRC"

# nvim設定のシンボリックリンクを作成
NVIM_DIR="${HOME}/.config/nvim"
if [ -d "$NVIM_DIR" ]; then
    mv "$NVIM_DIR" "${NVIM_DIR}.backup"
fi
ln -sf "${DOTFILES_DIR}/nvim" "$NVIM_DIR"

echo "Setup complete!"
