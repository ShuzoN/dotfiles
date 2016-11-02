" vim pluginのロード

  filetype off

  if has('vim_starting')
    set runtimepath+=~/dotfiles/vim/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/dotfiles/vim/.vim/bundle'))
  endif

  " ==============================================
    "           NeoBundle プラグイン
  " ==============================================
  " ねおばんどる
  NeoBundle 'Shougo/neobundle.vim'
  " gitスキーマをhttpsスキーマに変換
  let g:neobundle_default_git_protocol='https'

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

  " === Railsプロジェクト間のfile移動をワンアクションで可能にする ===
  " vim rails
  NeoBundle 'tpope/vim-rails'
  " コマンドを短縮する
  NeoBundle 'tyru/vim-altercmd'
  " ===========  Unite.vim ===================
  " 直感的なインタフェースを提供するプラグイン
  NeoBundle 'Shougo/unite.vim'
  " unite.vimで最近使ったファイルを表示できるようにする
  NeoBundle 'Shougo/neomru.vim'
  " ファイル操作をサポート(depend Unite)
  NeoBundle 'Shougo/vimfiler'
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
  " ------------easymotion-------------
  " 画面内を2keyでカーソル移動
  " http://haya14busa.com/mastering-vim-easymotion/
  "  :w       : カーソル後方の単語全てにショートカットを表示
  "  :s{char} : 画面内のcharにショートカットを表示
  NeoBundle 'Lokaltog/vim-easymotion'
  "-----------()系統の補完------------
  " defに対しendを自動補完
  NeoBundle 'tpope/vim-endwise'
  " 対応するカッコ,def endをハイライト
  NeoBundle 'vimtaku/hl_matchit.vim.git'
  " -----------------------------------------
  " 文法チェック機能追加
  NeoBundle 'ngmy/vim-rubocop'
  " vim の スニペットを提供するプラグイン
  NeoBundle 'Shougo/neosnippet'
  " newsnipeetの拡張?
  NeoBundle 'Shougo/neosnippet-snippets'

  " ---- vimで シソーラスの利用 ----
  " CodicをUniteで利用
  NeoBundle 'rhysd/unite-codic.vim'
  " Codicをvimで利用
  NeoBundle 'koron/codic-vim'
  " 複数行をコメントアウト可能にする
  NeoBundle 'tyru/caw.vim.git'

  "----------------------------
  " gitの差分を表示する
  NeoBundle 'airblade/vim-gitgutter'

  " status lineにgitのブランチを表示
  NeoBundle 'itchyny/lightline.vim'

  " -------------------------------
  " コード補完
  " -------------------------------
  " NeoBundle 'Shougo/neocomplcache'
  " NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " -------------------------------
  " Rsense
  " -------------------------------
  " rubyの補完
  NeoBundle 'marcus/rsense'
  " vimでrsenceを使う
  " NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
  "  \ 'insert' : 1, 'filetypes': 'ruby', }}
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
  " --- vimでコードを実行 ---
  NeoBundle 'thinca/vim-quickrun'

  " --- キャメルケース<=>スネークケースを切り替える ---
  NeoBundle 'kana/vim-operator-user'
  NeoBundle 'tyru/operator-camelize.vim'

  " --- go 周り ---
  NeoBundleLazy 'fatih/vim-go', {
        \ 'autoload' : { 'filetypes' : 'go'  }
        \ }
  " ----- javascript のシンタックス ----
  NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
  NeoBundle 'pangloss/vim-javascript'

  " --- json 周り ---
  NeoBundle 'Quramy/vison'

  " --- editor config ---
  NeoBundle 'editorconfig/editorconfig-vim'

  " --- benchmark ---
  NeoBundle 'mattn/benchvimrc-vim'

  call neobundle#end()

  NeoBundleCheck

  let g:deoplete#enable_at_startup = 1 
  " With deoplete.nvim
  let g:monster#completion#rcodetools#backend = "async_rct_complete"
  let g:deoplete#sources#omni#input_patterns = {
        \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
        \}
