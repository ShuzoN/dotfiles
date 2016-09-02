 " クリップボードを使用可能に
 set clipboard+=unnamed
 " backspaceを有効にする
 set backspace=indent,eol,start
 " 複数キー入力待機は400ms, キーコード待は75ms
 set timeout timeoutlen=400 ttimeoutlen=75

 " / による検索で
 " 小文字入力 : 大小文字を区別しない
 " 大文字入力 : 大小文字を区別
 set smartcase
 set ignorecase

 " ---------- 表示設定 -----------
 " 行番号を相対位置表示
 set number relativenumber 
 " indentの設定
 filetype plugin indent on

 " soft tabを有効に
 set expandtab
 " オートインデントを有効に
 set autoindent
 " インデント幅を2文字に
 set tabstop=2 shiftwidth=2 softtabstop=2
 " 編集行の番号にアンダーライン
 set cursorline

 " ------------ ステータスバー --------------
 " ステータスバーの表示
 set laststatus=2
 " ノーマルモードとinsertモードでステータスバーの色を変える
 " normal mode : lightblue / insert mode: green
 au InsertEnter * hi StatusLine ctermfg=Black ctermbg=lightblue cterm=none 
 au InsertLeave * hi StatusLine ctermfg=Black ctermbg=Green     cterm=none
 " <ESC>後にすぐ色が適応されない場合の対策
 inoremap <silent> <ESC> <ESC>
 inoremap <silent> <C-[> <ESC>

 syntax enable
