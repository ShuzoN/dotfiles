" " コード補完
" " NeoBundle 'Shougo/neocomplete.vim'
" " 入力補完機能
" " NeoBundle 'Shougo/neocomplcache'
" " vim の スニペットを提供するプラグイン
" " NeoBundle 'Shougo/neosnippet'
" " newsnipeetの拡張?
" " NeoBundle 'Shougo/neosnippet-snippets'
"
" " ========================================================
" "                       General 
" " ========================================================
" " 自動でポップアップメニューを開かない
" let g:acp_enableAtStartup = 0
" " 起動時に有効
" let g:neocomplete#enable_at_startup = 1
" " 大文字が入力まで大/小文字の区別を無視
" let g:neocomplete#enable_smart_case = 1
" " 補完する最小の文字数を設定
" let g:neocomplcache_min_syntax_length = 3
" " preview window を閉じない
" let g:neocomplete#enable_auto_close_preview = 0
" " 自動選択を行わない
" let g:neocomplete#enable_auto_select = 0
" " _(アンダースコア)区切りの補完を有効化
" let g:neocomplete#enable_underbar_completion = 1
" let g:neocomplete#enable_camel_case_completion  =  1
" " ポップアップメニューで表示される候補の数
" let g:neocomplete#max_list = 20
" " .や::を入力したときにオムニ補完が有効になるようにする
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplcache_force_overwrite_completefunc=1
"
"
" " ========================================================
" "                      キーバインド
" " ========================================================
" " 改行で補完ウィンドを閉じる
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
" endfunction
" " <BS>を押した時に確実にポップアップを削除
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" " C-j,kで補完候補の選択を行う
" inoremap <expr><C-j> pumvisible() ? "\<Down>" : "\<TAB>"
" inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<S-TAB>"
" " 選択候補の確定
" inoremap <expr><C-y>  neocomplcache#close_popup()
" " 候補をキャンセルし、ポップアップを閉じる
" imap <expr><C-u>  neocomplcache#cancel_popup()
"
"
" " ========================================================
" "                         Ruby
" " ========================================================
" " vim-railsに対応
" let g:neocomplete#sources#dictionary#dictionaries = {
"       \ 'default' : '',
"       \ 'ruby' : $HOME.'/dotfiles/vim/dic/dicts/ruby.dict'
"       \ }
"
" " NeoBundle 'NigoroJr/rsense'
" " vimでrsenceを使う
" NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
"       \ 'insert' : 1, 'filetypes': 'ruby', }}
"
" " 補完の設定
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
" let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
" let g:rsenseUseOmniFunc = 1
