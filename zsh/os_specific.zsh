# OS別設定 (os_specific.zsh)

# OSタイプに基づく条件分岐
case "${OSTYPE}" in
    darwin*)
        # macOS用の設定
        export CLICOLOR=1
        # カラー表示を有効化し、ディレクトリにはスラッシュ、実行可能ファイルにはアスタリスクを追加
        alias ls='ls -G -F'
        ;;
    linux*)
        # Linux用の設定
        # --color=auto: ファイルの種類に応じて色を自動で変更
        alias ls='ls -F --color=auto'
        ;;
    # 他のOS用の設定が必要な場合はここに追加
esac