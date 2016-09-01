 set nocompatible " NeoBundleの設定

 " クリップボードを使用可能に
 set clipboard+=unnamed
 " backspaceを有効にする
 set backspace=indent,eol,start
 " ---------------key bind --------------
 " 間違えやすい, 使わないバインドを無効化
 nmap <C-z> <Nop>
 nmap <C-b> <Nop>
 nmap <C-f> <Nop>
 nmap <C-j> <Down>
 nmap <C-k> <Up>
 nmap <C-h> <Nop>
 nmap <C-l> <Right>
 imap <C-j> <Nop>
 imap <C-k> <Nop>
 imap <C-h> <BS>
 imap <C-l> <Nop>
 nmap <C-n> <Nop>
 nmap <C-p> <Nop>
 nmap <C-c> <Nop>
 imap <C-c> <Nop>
 nmap <C-m> <Nop>
 nmap <C-\> <Nop>
 nmap <S-h> <Nop>
 nmap <S-l> <Nop>
 nmap Q <Nop>
 nmap <Space>c <Nop>
 nmap U <Nop>
 nmap ZQ <Nop>
 " コロンとセミコロンの入れ替え
 noremap ; :
 " enter で改行挿入
 nmap <CR> o<ESC>
 " 複数キー入力待機は400ms, キーコード待は75ms
 set timeout timeoutlen=400 ttimeoutlen=75

 filetype off

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim
   call neobundle#begin(expand('~/.vim/bundle'))
 endif
 " ==============================================
   "           NeoBundle プラグイン
 " ==============================================
 " ねおばんどる
 NeoBundle 'Shougo/neobundle.vim'

 " vimで非同期処理を実現する
 NeoBundle 'Shougo/vimproc.vim', {
 \ 'build' : {
 \     'windows' : 'tools\\update-dll-mingw',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make -f make_mac.mak',
 \     'linux' : 'make',
 \     'unix' : 'gmake',
 \    },
 \ }
 " markdownのテーブルなどを整形するプラグイン
 NeoBundle 'h1mesuke/vim-alignta' 
 " === scssのシンタックスハイライト ========
 NeoBundle 'cakebaker/scss-syntax.vim'
 au BufRead,BufNewFile *.scss set filetype=scss.css

 " === Railsプロジェクト間のfile移動をワンアクションで可能にする ===
 " vim rails
 NeoBundle 'tpope/vim-rails'
 " コマンドを短縮する
 NeoBundle 'tyru/vim-altercmd' 
 " call  altercmd#load()
 au BufRead *.* AlterCommand ni NeoBundleInstall
 " tyru/はフォーク版, オリジナルはkana/
 autocmd User Rails AlterCommand r R " 対応したmvcに移動
 autocmd User Rails AlterCommand rc Rcontroller "対応するコントローラに移動
 autocmd User Rails AlterCommand rm Rmodel  " モデルに移動
 autocmd User Rails AlterCommand rv Rview  " ビューに移動
 autocmd User Rails AlterCommand ra A  " テストに移動
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
 noremap [Unite]h :Unite file_mru<CR>"
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
 " tmuxのペイン移動をするプラグイン
 NeoBundle 'christoomey/vim-tmux-navigator'

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
 source $VIMRUNTIME/macros/matchit.vim
 " -----------------------------------------
 " 文法チェック機能追加
 NeoBundle 'ngmy/vim-rubocop'
 let g:vimrubocop_config = '/usr/local/project/.rubocop.yml'
 " 入力補完機能
 NeoBundle 'Shougo/neocomplcache'
 " vim の スニペットを提供するプラグイン
 NeoBundle 'Shougo/neosnippet'
 " newsnipeetの拡張? 
 NeoBundle 'Shougo/neosnippet-snippets'

 " ---- vimで シソーラスの利用 ----
 " CodicをUniteで利用
 NeoBundle 'rhysd/unite-codic.vim'
 " Codicをvimで利用
 NeoBundle 'koron/codic-vim'
 nnoremap <silent> <Space>c :Codic 

 " 複数行をコメントアウト可能にする
 NeoBundle 'tyru/caw.vim.git'
 " htmlタグの自動補完(erbファイルに適応)
 augroup MyXML
   autocmd!
   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
   autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
 augroup END
 "----------------------------
 " gitの差分を表示する
 NeoBundle 'airblade/vim-gitgutter'
 " vim-gitgutter
 let g:gitgutter_sign_added = '+'
 let g:gitgutter_sign_modified= '→'
 let g:gitgutter_sign_removed = 'x'

 " status lineにgitのブランチを表示
 NeoBundle 'itchyny/lightline.vim'
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


 " ------------ vim内でgitを使う -------------
 " gitスキーマをhttpsスキーマに変換
 let g:neobundle_default_git_protocol='https'

 " -------------------------------
 " Rsense
 " -------------------------------
 " コード補完
 NeoBundle 'Shougo/neocomplete.vim'
 " rubyの補完
 NeoBundle 'NigoroJr/rsense'
 " vimでrsenceを使う
 NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : { 
  \ 'insert' : 1, 'filetypes': 'ruby', }}

 " 補完の設定
 if !exists('g:neocomplete#force_omni_input_patterns')
   let g:neocomplete#force_omni_input_patterns = {}
 endif
 let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
 let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
 let g:rsenseUseOmniFunc = 1
 " --------------------------------

 " 静的解析
 NeoBundle 'scrooloose/syntastic'
 " ドキュメント参照
 NeoBundle 'thinca/vim-ref'
 NeoBundle 'yuku-t/vim-ref-ri'
 " メソッド定義元へのジャンプ
 NeoBundle 'szw/vim-tags'
 " 自動で閉じる
 NeoBundle 'tpope/vim-endwise'
 " neocomplete.vim
 " --------------------------------
 let g:acp_enableAtStartup = 0
 " 起動時に有効
 let g:neocomplete#enable_at_startup = 1 
 " 大文字が入力まで大/小文字の区別を無視
 let g:neocomplete#enable_smart_case = 1 
 " 補完する最小の文字数を設定
 let g:neocomplcache_min_syntax_length = 3
" preview window を閉じない
 let g:neocomplete#enable_auto_close_preview = 0
" 自動選択を行わない
 let g:neocomplete#enable_auto_select = 0
  " _(アンダースコア)区切りの補完を有効化
 let g:neocomplete#enable_underbar_completion = 1
 let g:neocomplete#enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
  let g:neocomplete#max_list = 20
" .や::を入力したときにオムニ補完が有効になるようにする
 if !exists('g:neocomplete#force_omni_input_patterns')
   let g:neocomplete#force_omni_input_patterns = {}
 endif
 " vim-railsに対応
 let g:neocomplcache_force_overwrite_completefunc=1
 let g:neocomplete#sources#dictionary#dictionaries = {
     \ 'default' : '',
     \ 'ruby' : $HOME.'/dotfiles/vim/dic/dicts/ruby.dict'
     \ }
 " --------------------------------
 " rubocop
 " --------------------------------
 " syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
 " active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
 " let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
 " let g:syntastic_ruby_checkers = ['rubocop']
 " let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe'
 " " railsプロジェクトのみ--railsオプションをつける
 " au FileType ruby if exists('b:rails_root') |
 "   \ let b:syntastic_ruby_rubocop_options = '--rails' | endif
 "
 " -----------vimの補完キーバインド ----------------
 " オムニ補完をSpace-cに当てる
 imap <C-c> <C-x><C-o>
 " 改行で補完ウィンドを閉じる
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 function! s:my_cr_function()
   return neocomplcache#smart_close_popup() . "\<CR>"
 endfunction
 " <C-h>や<BS>を押した時に確実にポップアップを削除
 inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
 " C-j,kで補完候補の選択を行う
 inoremap <expr><C-j> pumvisible() ? "\<Down>" : "\<TAB>"
 inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<S-TAB>"
 " 補完をキャンセル
 inoremap <expr><C-u>     neocomplcache#undo_completion()
 " 選択候補の確定
 inoremap <expr><C-y>  neocomplcache#close_popup()
 " 候補をキャンセルし、ポップアップを閉じる
 inoremap <expr><ESC>  neocomplcache#cancel_popup()
 " Ctrl + p でコメントアウトと解除
 nmap <C-p> <Plug>(caw:hatpos:toggle)
 vmap <C-p> <Plug>(caw:hatpos:toggle)
 
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

 " ====ウィンドウ操作のキーマップ==== 
 " http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-_> :split<Enter>
nnoremap <silent> <C-\> :vsplit<Enter>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

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

 " --- Undo treeをグラフィカル表示 ---
 " --- vimでコードを実行 ---
 NeoBundle 'thinca/vim-quickrun'
 nnoremap Q :QuickRun ruby<CR>

 " --- キャメルケース<=>スネークケースを切り替える ---
 NeoBundle 'kana/vim-operator-user'
 NeoBundle 'tyru/operator-camelize.vim'
 map <Space>p <plug>(operator-camelize-toggle)

 " --- go 周り ---
 NeoBundleLazy 'fatih/vim-go', {
       \ 'autoload' : { 'filetypes' : 'go'  }
       \ }
 " format with goimports instead of gofmt
 let g:go_fmt_command = "goimports"
 let g:go_highlight_functions = 1
 let g:go_highlight_methods = 1
 let g:go_highlight_structs = 1
 " tplファイルのindent設定
 au BufRead,BufNewFile *.tpl setl ft=gohtmltmpl

 " ----- javascript のシンタックス ----
 au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
 NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
 NeoBundle 'pangloss/vim-javascript'

 " --- json 周り ---
 NeoBundle 'Quramy/vison'
 autocmd BufRead,BufNewFile package.json Vison
 autocmd BufRead,BufNewFile .bowerrc Vison bowerrc.json

 " --- editor config ---
 NeoBundle 'editorconfig/editorconfig-vim'

 call neobundle#end()

 " -------描画設定---------
 "vimの色設定(solarizedを使用)"
 syntax enable
 colorscheme solarized
 set background=light
 let g:solarized_termcolors=256

 NeoBundleCheck
