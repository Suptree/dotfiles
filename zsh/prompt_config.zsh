# プロンプト設定 (prompt_config.zsh)

# プロンプト表示する度に変数を展開
setopt prompt_subst

# Gitブランチと状態を表示するための関数
git_prompt_info() {
    # Gitブランチ名を取得
    local branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $3}')

    # Gitリポジトリ内の変更を確認
    local status=$(git status --porcelain 2> /dev/null)
    local changes=""
    if [ -n "$status" ]; then
        changes="⚡" # 変更がある場合のシンボル
    fi

    # ブランチ名と変更シンボルを表示
    if [ -n "$branch" ]; then
        echo "%F{green}${branch}%f ${changes}"
    fi
}

# プロンプトの設定
PROMPT='%F{cyan}%~%f ' # カレントディレクトリの表示
PROMPT+='$(git_prompt_info)' # Gitの情報表示
PROMPT+='%# ' # プロンプトの終了記号（通常ユーザーは'$', rootユーザーは'#'）
