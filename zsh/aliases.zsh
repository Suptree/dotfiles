# エイリアス設定 (aliases.zsh)

# ls コマンドのエイリアス
# '-G': カラー表示を有効化（macOS特有）、'-F': ディレクトリは末尾に'/'、実行可能ファイルは'*'を追加
alias ls='ls -GF'
# '-a': 隠しファイルを含むすべてのファイルを表示
alias la='ls -a'
# '-l': 詳細情報を表示
alias ll='ls -l'

# 基本的なコマンドのエイリアス（確認を求める）
# '-i': 削除、コピー、移動前に確認を求める
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ディレクトリ作成時に親ディレクトリも同時に作成
alias mkdir='mkdir -p'

# sudo 実行時のエイリアスを有効にする
# sudo後にエイリアスが展開されるようにする
alias sudo='sudo '

# グローバルエイリアス
# '-g': グローバルエイリアスを定義
# 'L': 任意のコマンドの出力を `less` でページング
# 'G': 任意のコマンドの出力を `grep` で検索
alias -g L='| less'
alias -g G='| grep'

# ここに他のエイリアスを追加
