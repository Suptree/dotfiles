# 環境変数
export LANG=en_US.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 色を使用出来るようにする
autoload -Uz colors
colors
# export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd'
# 他のターミナルとヒストリーを共有
setopt share_history

# ls の color 設定
colors
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls='ls -GF'
########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=2

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
########################################
# 補完候補を色分けする
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# オプション

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# エイリアス
alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

########################################
# OS 別の設定
case ${OSTYPE} in
   darwin*)
       #Mac用の設定
       export CLICOLOR=1
       alias ls='ls -G -F'
       ;;
   linux*)
       #Linux用の設定
       alias ls='ls -F --color=auto'
       ;;
esac

# PROMPTテーマ
setopt prompt_subst #プロンプト表示する度に変数を展開

precmd () { 
  if [ -n "$(git status --short 2>/dev/null)" ];then
    export GIT_HAS_DIFF="✗"
    export GIT_NON_DIFF=""
  else 
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF="✔"
  fi
  # git管理されているか確認
  git status --porcelain >/dev/null 2>&1
  if [ $? -ne 0 ];then
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF=""
  fi
  export BRANCH_NAME=$(git branch --show-current 2>/dev/null)
}
# 末尾に空白をつけることで改行される
PROMPT=" 
%F{cyan}%~%f"
PROMPT=${PROMPT}'%F{green}  ${BRANCH_NAME} ${GIT_NON_DIFF}%F{red}${GIT_HAS_DIFF} 
%f$ '



export PATH="$PATH:$HOME/.local/share/nvim-linux64/bin"
alias vim="nvim"
# Use modern completion system
# autoload -Uz compinit
# compinit

# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*' completer _expand _complete _correct _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true

# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source /opt/ros/noetic/setup.zsh
source /home/daiki/catkin_ws/devel/setup.zsh
