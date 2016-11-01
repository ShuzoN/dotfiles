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

 " vim内部で使われる文字エンコーディングをutf-8に設定する
 set encoding=utf-8

 " 想定される改行コードの指定する
 set fileformats=unix,dos,mac

 " 自動コメントアウトを無効化
 au FileType * setlocal formatoptions-=ro

 " ------------ ステータスバー --------------
 " ステータスバーの表示
 set laststatus=2
 " ノーマルモードとinsertモードでステータスバーの色を変える
 " normal mode : lightblue / insert mode: green
 au InsertEnter * hi StatusLine ctermfg=Black ctermbg=lightblue cterm=none
 au InsertLeave * hi StatusLine ctermfg=Black ctermbg=Green     cterm=none

   " アクティブウィンドウに限りカーソル行(列)を強調する
  augroup vimrc_set_cursorline_only_active_window
    autocmd!
      autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
  highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
        augroup END


 syntax enable
