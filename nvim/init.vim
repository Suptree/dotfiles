
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vimがインストールされていない場合はインストール
if &runtimepath !~# '/dein.vim'
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" プラグインのdein.tomlとdein_lazy.tomlに記述 
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " .toml file
    let s:rc_dir = expand('~/dotfiles/nvim')
    if !isdirectory(s:rc_dir)
        call mkdir(s:rc_dir, 'p')
    endif
    let s:toml = s:rc_dir . '/dein.toml'
    let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

    " read toml and cache
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " end settings
    call dein#end()
    call dein#save_state()
endif
" インストールされていないプラグインがある場合はインストール 
if dein#check_install()
    call dein#install()
endif

" dein.tomlやdein_lazy.tomlから削除したプラグインを削除する 
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif 

" テーマ
colorscheme onedark


" VimのVimのバッファやレジスタ内などで使用する文字コードを設定
" set encoding=utf-8

" Vimがスクリプトを処理するとき、scriptencodingで指定した文字コードから
" encodingで指定した文字コードに変換される
" scriptencoding utf-8

" 既存のファイルを開くとき、Vimが使用する文字コードを判定する順番
" 先頭から順に試される
" set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" シンタックスハイライトを有効にする
syntax enable

" ファイルの種類に応じて自動で設定を行うような プラグイン
filetype plugin indent on

" カーソルラインを表示
set cursorline

" カーソルラインのトグル
" set cursorline!

" 行番号
set number

" 相対的な行番号
"set relativenumber
set helplang=ja,en
" 検索結果をハイライトする
set hlsearch

" 検索時大文字小文字を区別しない
set ignorecase

" 検索時、大文字を入力した場合大文字小文字を区別する
set smartcase

" 文字を入力するたびに、その時点でパターンマッチしたテキストをハイライト
set incsearch

if has('persistent_undo')
	let undo_path = expand('~/.vim/undo')
	" ディレクトリが存在しない場合は作成
	if !isdirectory(undo_path)
		call mkdir(undo_path, 'p')
	endif
	let &undodir = undo_path
	set undofile
endif
" 展開するスペースの個数
set tabstop=4

" タブをスペースに展開
set expandtab
" インデントを考慮して改行
set smartindent

" インデントのスペースの数
set shiftwidth=4

" タブページ
set showtabline=2

" set scrolloff=2
"
"ステータスライン
set showmatch
set laststatus=2

"クリップボードコピー
" set clipboard+=unnamed

"短形選択
set virtualedit=block

" コマンドライン補完
set wildmenu
" 開いたときにカレンとディレクトリ
set autochdir

" Key bindの設定
" 検索ハイライトの消去
"
let mapleader = "\<Space>"
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" 段落の移動
nnoremap <C-j> }
nnoremap <C-k> {
nnoremap <C-h> b
nnoremap <C-l> w
" ファイル検索
nnoremap <C-p> :Telescope find_files<CR>
"" require sudo apt install ripgrep
"" require sudo apt install fd-find
nnoremap <C-g> :Telescope live_grep<cr>

"ターミナルを垂直で開く
nnoremap <C-n>\ :vert term ++close<CR>
"ターミナルを水平で開く
nnoremap <C-n>- :bo term ++close
" ターミナルを新しいタブページで開く
nnoremap <C-t> :tab term ++close
" 画面分割しlazygitを開く
nnoremap <silent><C-n>g :vert term ++close lazygit<CR>
nnoremap <silent><C-e> :Fern . -drawer -toggle<CR>
nnoremap ; :
inoremap jk <ESC>

"同じ行でも下をj k を押したら一つ下にいく
nnoremap j gj
nnoremap k gk
" 画面増やすためのキーバインド
nnoremap s <Nop>
" nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

nnoremap sw <C-w>w
nnoremap sr <C-w>r

nnoremap sq :q<CR>
nnoremap sQ :bd<CR>

nnoremap st :tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" nnoremap sl <C-w>l
"nnoremap sl <C-w>l
"nnoremap sl <C-w>l
" 行の最初の文字の前にコメント文字をトグル
nmap <Leader>c <cmd>Commentary<CR>
vmap <Leader>c gc
" 行頭にコメントをトグル
" nmap <Leader>, <Plug>(caw:zeropos:toggle)
" vmap <Leader>, <Plug>(caw:zeropos:toggle)

nnoremap <C-i> A
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
" 補完表示時のEnterで改行をしない
" inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
"
" set completeopt=menuone,noinsert
" inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
" inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

" call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
" call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
" call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" call submode#map('bufmove', 'n', '', '<', '<C-w><')
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

