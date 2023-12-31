# ヒストリ設定 (history.zsh)

# ヒストリファイルのパス
HISTFILE=~/.zsh_history

# メモリ内に保持するヒストリの最大数
HISTSIZE=1000000

# ヒストリファイルに保存するエントリの最大数
SAVEHIST=1000000

# 他のターミナルとヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# ヒストリに保存する際に余分なスペースを削除する
setopt hist_reduce_blanks
