" テーマの設定
colorscheme onedark

" 文字コード関連の設定
" Vimの内部で使用する文字コード
set encoding=utf-8

" Vimスクリプトファイルの文字コード
scriptencoding utf-8

" ファイルの文字コードの推定順序
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" シンタックスハイライトを有効にする
syntax enable

" ファイルタイプに応じた設定を自動で行う
filetype plugin indent on

" カーソルラインを表示
set cursorline

" 行番号を表示
set number

" ヘルプ言語の設定
set helplang=ja,en

" 検索結果をハイライトする
set hlsearch

" 大文字・小文字を区別しない（スマートケース）
set ignorecase
set smartcase

" インクリメンタル検索
set incsearch

" 永続的なアンドゥ機能
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    if !isdirectory(undo_path)
        call mkdir(undo_path, 'p')
    endif
    let &undodir = undo_path
    set undofile
endif

" タブとスペースの設定
set tabstop=4
set expandtab
set smartindent
set shiftwidth=4

" タブページの表示設定
set showtabline=2

" ステータスライン関連の設定
set showmatch
set laststatus=2

" クリップボードと短形選択の設定
set clipboard+=unnamed
set virtualedit=block

" コマンドライン補完
set wildmenu

" カレントディレクトリの自動変更
set autochdir

" 行頭、行末でカーソルが停止しないようにする
set whichwrap=b,s,h,l,<,>,[,]

" Backspaceの挙動を設定
" BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
