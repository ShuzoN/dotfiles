"NeoBundleの設定" 
"
"
set nocompatible
" クリップボードを有効にする 
set clipboard+=unnamed
" backspaceを有効にする
set backspace=indent,eol,start
" ---------------key bind --------------
" 間違えやすい, 使わないバインドを無効化
noremap <C-z> <Nop>
noremap <C-b> <Nop>
noremap <C-f> <Nop>
noremap <C-j> <Nop>
noremap <C-n> <Nop>
noremap <C-p> <Nop>
noremap <C-c> <Nop>
noremap <C-m> <Nop>
noremap <S-h> <Nop>
noremap <S-l> <Nop>
nnoremap Q <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" コロンとセミコロンの入れ替え
noremap ; :
" enter で改行挿入
nmap <CR> o<ESC>

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle'))
endif
" ==============================================
  "           NeoBundle プラグイン
" ==============================================
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" rubyに補完が有効になるようにする
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim',{'autoload' : {
 \ 'insert' : 1,
 \ 'filetypes' : 'ruby',
 \ }}
" ========  インデントをハイライト ========
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=24
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=23
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

" ===========  Unite.vim ===================
" 直感的なインタフェースを提供するプラグイン
NeoBundle 'Shougo/unite.vim'
" unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" insertモードの時 unite.vimを有効にする
let g:unite_enable_start_insert=0
" バッファ一覧
noremap [Unite] <Nop>
nmap <Space>u [Unite]
noremap [Unite]b :Unite buffer<CR>
" ファイル一覧
noremap [Unite]f :Unite -buffer-name=file file<CR>
" 最近使ったファイル一覧
noremap [Unite]z :Unite file_mru<CR>"
" sourcesを「今開いているファイルのディレクトリ」とする
" noremap [Unite]u :UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> [Unite]s unite#do_action('split')
" au FileType unite inoremap <silent> <buffer> <expr> [Unite]s unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> [Unite]v unite#do_action('vsplit')
" au FileType unite inoremap <silent> <buffer> <expr> [Unite]v unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
" au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"===========================================

" s>,s< でウィンドウの縁を移動させるプラグイン
NeoBundle 'kana/vim-submode'
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
let g:EasyMotion_keys='asdfghjkl01234890'
" 「m」 + 何かにマッピング
let g:EasyMotion_leader_key="m"
" " 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" smartcase
let g:EasyMotion_smartcase = 1
" 日本語に対応
let g:EasyMotion_use_migemo = 1
"-----------()系統の補完------------
" defに対しendを自動補完
NeoBundle 'tpope/vim-endwise'
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
" ---------- markdownをブラウザでプレビュー --------------------------------
" PreVim(markdownをブラウザでリアルタイムプレビューする)
" <space>+p o : プレビュー
" <space>+p r : リロード
NeoBundle 'tyru/open-browser.vim' 
NeoBundle 'kannokanno/previm'
:
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
"
" -------------------------------------
" status line を拡張する
" -------------------------------------
NeoBundle 'itchyny/lightline.vim' 
" vim内でgitを操作可能に
NeoBundle 'tpope/vim-fugitive'
" gitの差分を表示する
NeoBundle 'airblade/vim-gitgutter'
" vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified= '→'
let g:gitgutter_sign_removed = 'x'

" LightLine.vim
let g:lightline = {
  \ 'mode_map' : {'c' : 'NORMAL' },
  \ 'active'  : {
  \ 'left':[
  \   ['mode','paste'],
  \   ['fugitive','gitgutter','filename'],
  \ ],
  \ 'right': [
  \   ['lineinfo','syntastic'],
  \   ['percent'],
  \   ['charcode', 'fileformat', 'fileencoding', 'filetype'],
  \ ]
  \ },
  \ 'component_function': {
  \ 'modefied' : 'MyModified',
  \ 'readonly' : 'MyReadonly',
  \ 'fugitive' : 'MyFugitive',
  \ 'filename' : 'MyFilename',
  \ 'fileformat' : 'MyFileformat',
  \ 'filetype' : 'MyFiletype',
  \ 'fileencoding' : 'MyFileencoding',
  \ 'mode' : 'MyMode',
  \ }
  \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
\  &ft == 'unite' ? unite#get_status_string() :
\  &ft == 'vimshell' ? vimshell#get_status_string() :
\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" -------------------------------------

call neobundle#end()
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

" ------------ vim内でgitを使う -------------
" gitスキーマをhttpsスキーマに変換
let g:neobundle_default_git_protocol='https'
" 

" ---------補完機能の設定--------------------
" ----------Rubyの補完------------
" ruby .や::を入力した時にオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数Rsense_homeに/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
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
" オムニ補完をSpace-cに当てる
imap <Space>c <C-x><C-o>
" 改行で補完ウィンドを閉じる
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <C-h>や<BS>を押した時に確実にポップアップを削除
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" 補完をキャンセル Ctrl+u
inoremap <expr><C-u>     neocomplcache#undo_completion()
" 選択候補の確定
inoremap <expr><C-y>  neocomplcache#close_popup()
" 候補をキャンセルし、ポップアップを閉じる
inoremap <expr><ESC>  neocomplcache#cancel_popup()
" Ctrl + / でコメントアウトと解除
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)
" -------描画設定---------
"vimの色設定(solarizedを使用)"
syntax enable
set background=light
colorscheme solarized
let g:solarized_termcolors=256
" Markdownのソースに色付
let g:markdown_fenced_languages = [
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
highlight CursorLine ctermbg=232

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
" set list
" set listchars=tab:_\ ,trail:_
" ---------vimでtreeを使う-------------------------
nnoremap <C-e> :NERDTreeToggle<CR>
" ファイルなしならばNERDTREEを起動
autocmd vimenter * if !argc() | NERDTree | endif
" ディレクトリツリーを色付
let g:NERDChristmasTree=1
" ====ウィンドウ操作のキーマップ====
" http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap [Tree] <Nop>
nnoremap r <Nop>
nmap r [Tree]
nnoremap <silent> [Tree]s :split<Enter>
nnoremap <silent> [Tree]v :vsplit<Enter>
nnoremap <silent> [Tree]j <C-w>j
nnoremap <silent> [Tree]k <C-w>k
nnoremap <silent> [Tree]l <C-w>l
nnoremap <silent> [Tree]h <C-w>h
nnoremap <silent> [Tree]J <C-w>J
nnoremap <silent> [Tree]K <C-w>K
nnoremap <silent> [Tree]L <C-w>L
nnoremap <silent> [Tree]H <C-w>H
nnoremap <silent> [Tree]r <C-w>r
nnoremap <silent> [Tree]= <C-w>=
nnoremap <silent> [Tree]. <C-w>>
nnoremap <silent> [Tree], <C-w><
nnoremap <silent> [Tree]+ <C-w>+
nnoremap <silent> [Tree]- <C-w>-
" ------------------------------------------
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

" ------------ タブの操作と表示 ------------
"Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap [Tag] <Nop>
" Tab jump
nmap <Space>t [Tag]
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tn 新しいタブを一番右に作る
map <silent> [Tag]n :tablast <bar> tabnew<CR>
" td タブを閉じる
map <silent> [Tag]d :tabclose<CR>
" tl/S-l 次のタブ
map <silent> <S-l>  :tabnext<CR>
" th/S-h 前のタブ
map <silent> <S-h>  :tabprevious<CR>
