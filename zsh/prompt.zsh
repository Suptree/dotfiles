# プロンプト設定 (prompt.zsh)

# プロンプト表示する度に変数を展開
setopt prompt_subst

# Gitブランチと状態を表示するための関数
# git_prompt_info() {
#     # Gitブランチ名を取得
#     local branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $3}')

#     # Gitリポジトリ内の変更を確認（変数名を git_status に変更）
#     local git_status=$(git status --porcelain 2> /dev/null)
#     local changes=""
#     if [ -n "$git_status" ]; then
#         changes="⚡" # 変更がある場合のシンボル
#     fi

#     # ブランチ名と変更シンボルを表示
#     if [ -n "$branch" ]; then
#         echo "%F{green}${branch}%f ${changes}"
#     fi
# }

git_prompt() {
    # 現在のディレクトリが Git リポジトリであるか確認
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # ブランチ名を取得
        local branch="$(git branch --show-current)"
        
        # Git の状態を取得（変更があるかどうか）
        local git_status="$(git status --porcelain)"
        local color=""
        local changes=""

        if [[ -n $git_status ]]; then
            # 変更があれば黄色
            color="%F{yellow}"
            changes="*"
        else
            # 変更がなければ緑
            color="%F{green}"
        fi

        # エラーがあれば赤色（Git コマンド自体が失敗した場合）
        if [[ $? -ne 0 ]]; then
            color="%F{red}"
        fi

        # ブランチ名と状態を表示
        echo "${color}($branch$changes)%f"
    fi
}


# プロンプトの設定
PROMPT='%F{cyan}%~%f ' # カレントディレクトリの表示
PROMPT+='$(git_prompt)' # Gitの情報表示
PROMPT+='%# ' # プロンプトの終了記号（通常ユーザーは'$', rootユーザーは'#'）
