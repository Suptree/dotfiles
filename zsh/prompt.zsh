# プロンプト設定 (prompt.zsh)

# プロンプト表示する度に変数を展開
setopt prompt_subst

git_prompt() {
    # 現在のディレクトリが Git リポジトリであるか確認
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # ブランチ名を取得
        local branch="$(git branch --show-current)"
        
        # Git の状態を取得
        local git_status="$(git status --porcelain)"
        local color="%F{green}"
        local changes=""
        local staged_changes=""

        # ステージングされた変更があるかチェック
        if [[ $(echo "$git_status" | grep '^M') ]]; then
            staged_changes="+"
        fi
        
        # 未ステージングの変更があるかチェック
        if [[ $(echo "$git_status" | grep '^[ MDAU]') ]]; then
            changes="*"
            # ANSI Escape Code を使って文字色を変更 
            # 11: Yellow
            color="%F{11}"
        fi

        # エラーがあれば赤色（Git コマンド自体が失敗した場合）
        if [[ $? -ne 0 ]]; then
            color="%F{red}"
        fi

        # ブランチ名と状態を表示
        echo "${color}($branch$staged_changes$changes)%f "
    fi
}


# プロンプトの設定

## カレントディレクトリの表示
## Gitの情報表示
## プロンプトの終了記号（通常ユーザーは'$', rootユーザーは'#'）
## ANSI Escape Code を使って文字色を変更 
## 14: Cyan
PROMPT='%F{14}%~%f $(git_prompt)%# ' 
