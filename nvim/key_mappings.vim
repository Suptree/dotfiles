" Leaderキーの設定
let mapleader = "\<Space>"

" ノーマルモードでのキーバインド
" 検索ハイライトの消去
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" 段落の移動
nnoremap <C-j> }
nnoremap <C-k> {

" 単語の移動
nnoremap <C-h> b
nnoremap <C-l> w

" ファイル検索 (Telescopeが必要)
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>

" ターミナルの操作
nnoremap <C-n>\ :vert term ++close<CR>
nnoremap <C-n>- :bo term ++close<CR>
nnoremap <C-t> :tab term ++close<CR>

" 画面分割しlazygitを開く
nnoremap <silent><C-n>g :vert term ++close lazygit<CR>

" ファイルエクスプローラ (Fernが必要)
nnoremap <silent><C-e> :Fern . -drawer -toggle<CR>

" 同じ行での移動 (行内移動をより効率的に)
nnoremap j gj
nnoremap k gk

" 画面分割のためのキーバインド
nnoremap sv :vsplit<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" ウィンドウサイズの調整
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

" ウィンドウ間の切り替え
nnoremap sw <C-w>w
nnoremap sr <C-w>r

" タブ操作
nnoremap st :tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" コメントのトグル (vim-commentaryが必要)
nmap <Leader>c <cmd>Commentary<CR>
vmap <Leader>c <cmd>Commentary<CR>

" インサートモードでのキーバインド
" ノーマルモードへの素早い切り替え
inoremap jk <ESC>

" 自動括弧補完
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" その他のカスタムキーバインド
" 必要に応じてここに追加
