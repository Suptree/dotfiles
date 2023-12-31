# 補完設定 (completion_config.zsh)

# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完メニューのスタイル設定
# select=2: 補完候補が2つ以上の場合にメニューを表示
zstyle ':completion:*:default' menu select=2

# 大文字小文字を区別せずマッチング
# 'm:{a-z}={A-Z}': 小文字も大文字としてマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# '../'の後に現在のディレクトリを補完から除外
zstyle ':completion:*' ignore-parents parent pwd ..

# sudoの後にコマンド名を補完するためのパス
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 'ps' コマンドのプロセス名の補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 補完候補を色分けする
# '${(s.:.)LS_COLORS}': LS_COLORSの設定に基づいて色を設定
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ここに他の補完設定を追加
