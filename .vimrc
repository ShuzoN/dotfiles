"NeoBundleの設定"
set nocompatible
" クリップボードを有効にする
set clipboard+=unnamed

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
endif
" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
" インデントをハイライト
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=24
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=23
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
" s>,s< でウィンドウの縁を移動させるプラグイン
NeoBundle 'kana/vim-submode'
" 直感的なインタフェースを提供するプラグイン
NeoBundle 'Shougo/unite.vim'
" 見出し・関数にジャンプ
NeoBundle 'h1mesuke/unite-outline'
" テキスト整形ツール
NeoBundle 'Align'
" vimのカラースキームsolarizedの導入
NeoBundle 'altercation/vim-colors-solarized'
" ------------clever-f--------------
" fによる検索を拡張する
" f{char} : 行内のcharを検索する
" f,Fで検索結果をnext,backする
NeoBundle 'rhysd/clever-f.vim'
" 大文字小文字を無視する
let g:clever_f_smart_case=1
" 日本語に対応
let g:clever_f_use_migemo=1
" カーソル移動がマッチの方向に依存しなくなる
let g:clever_f_fix_key_direction=1
" 現在行のみマッチ
let g:clever_f_across_no_line=1
" ------------easymotion-------------
" 画面内を2keyでカーソル移動  
" http://haya14busa.com/mastering-vim-easymotion/
"  :w       : カーソル後方の単語全てにショートカットを表示
"  :s{char} : 画面内のcharにショートカットを表示
NeoBundle 'Lokaltog/vim-easymotion' 
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvb1234567890;'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key="<Space>"
" " 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" smartcase
let g:EasyMotion_smartcase = 1
" 日本語に対応
let g:EasyMotion_use_migemo = 1
"-----------()系統の補完------------
" defに対しendを自動補完
NeoBundle "cohama/vim-smartinput-endwise"
" カッコも補完できる
NeoBundle "kana/vim-smartinput"
function! MyInsertBracket(lbrackets, rbracket)
  if index(a:lbrackets, getline('.')[col('.') - 2]) != -1
    return a:rbracket . "\<Left>"
  else
    return a:rbracket
  endif
endfunction
inoremap <expr> > MyInsertBracket(['<'], '>')
" 対応するカッコ,def endをハイライト
NeoBundle 'vimtaku/hl_matchit.vim.git'
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft ='html\|vim\|ruby\|sh'
" -----------------------------------------
" 文法チェック機能追加
NeoBundle 'ngmy/vim-rubocop'
let g:vimrubocop_config = '/usr/local/project/.rubocop.yml'
" 入力補完機能
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" 複数行をコメントアウト可能にする
NeoBundle 'tyru/caw.vim.git'
" htmlタグの自動補完(erbファイルに適応)
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END
" ----------markdown--------------------------------
" PreVim(markdownをブラウザでリアルタイムプレビューする)
" <space>+p o : プレビュー
" <space>+p r : リロード
NeoBundle 'tyru/open-browser.vim' 
NeoBundle 'kannokanno/previm'
:
call neobundle#end()
"起動コマンド     :<Space>p
"プレビュー開始   :<Space>p + o
"リロード         :<Space>p + r
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>
"----------------------------

filetype indent on
filetype plugin on

" neocomplcacheのバグが取れれば嬉しい
let g:neocomplcache_force_overwrite_completefunc=1
" ---------tex設定--------------------------
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
" Macの人はデフォルトでpdfなので必要ない その他のOSの人はデフォルトがdviなので必要
let g:Tex_DefaultTargetFormat = 'pdf' 
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_BibtexFlavor = 'jbibtex'
" ファイルのビュワー
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'

" ---------gitスキーマをhttpsスキーマに変換
let g:neobundle_default_git_protocol='https'

" ---------補完機能の設定--------------------
" ----------Rubyの補完------------
" RSense(rubyの補完)のHOMEを指定する
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec/"
" ----------Vimの補完------------
" デフォルトのsnipoetを無効に
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
" AutoComplPopとの競合を避ける
let g:acp_enableAtStartup = 0
" neocomplcache を起動時に有効に.
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大/小文字の区別を無視する.
let g:neocomplcache_enable_smart_case = 1
" アンダースコア区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" 
" シンタックスをキャッシュする時の最小文字長 
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheと相性の悪いプラグインを使用するときにneocomplcacheをロックする
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" -----------vimの補完キーバインド ----------------
" オムニ補完をcmd-spaceに当てる
imap <D-Space> <C-x><C-o> 
" 改行で補完ウィンドを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
" <C-h>や<BS>を押した時に確実にポップアップを削除
inoremap <expr>><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" 補完をキャンセル Ctrl+g
inoremap <expr><C-g>     neocomplcache#undo_completion()
" 選択候補の確定
inoremap <expr><C-y>  neocomplcache#close_popup()
" 候補をキャンセルし、ポップアップを閉じる
inoremap <expr><C-n>  neocomplcache#cancel_popup()
" Ctrl + / でコメントアウトと解除
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)
" enter で改行挿入
nmap <CR> i<CR><ESC>
" -------描画設定---------
"vimの色設定(solarizedを使用)"
syntax enable
set background=light
colorscheme solarized
let g:solarized_termcolors=256
" Markdownのソースに色付
let g:markdown_fenced_languages = [
      \  'coffee',
      \  'css',
      \  'erb=eruby',
      \  'javascript',
      \  'js=javascript',
      \  'json=javascript',
      \  'ruby',
      \  'sass',
      \  'xml',
      \]
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
" / による検索で
" 小文字のみの入力では大文字小文字を区別しない
" 大文字のみの入力では大文字小文字を区別する
set smartcase
set ignorecase
" アクティブウィンドウに限りカーソル行(列)を強調する
augroup vimrc_set_cursorline_only_active_window
  autocmd!
    autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
      autocmd WinLeave * setlocal nocursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
      augroup END

" Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:^\ ,trail:~
" ---------vimでtreeを使う-------------------------
nnoremap <C-e> :NERDTreeToggle<CR>
" ファイルなしならばNERDTREEを起動
autocmd vimenter * if !argc() | NERDTree | endif
" ディレクトリツリーを色付
let g:NERDChristmasTree=1
" ---------------key bind --------------
" ==== コロンとセミコロンの入れ替え ====
noremap ; :
"
" ====ウィンドウ操作のキーマップ====
" http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap r <Nop>
nnoremap rs :split<Enter>
nnoremap rv :vsplit<Enter>
nnoremap rj <C-w>j
nnoremap rk <C-w>k
nnoremap rl <C-w>l
nnoremap rh <C-w>h
nnoremap rJ <C-w>J
nnoremap rK <C-w>K
nnoremap rL <C-w>L
nnoremap rH <C-w>H
nnoremap rn gt
nnoremap rp gT
nnoremap rr <C-w>r
nnoremap r= <C-w>=
nnoremap r. <C-w>>
nnoremap r, <C-w><
nnoremap r+ <C-w>+
nnoremap r- <C-w>-
" -------------------------------------------
noremap <C-z> <Nop>
NeoBundleCheck

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
