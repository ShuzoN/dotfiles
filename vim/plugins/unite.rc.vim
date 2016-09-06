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

 " grep検索
 nnoremap <silent> <C-g>  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

 " unite grepにhw(highway)を使う
 if executable('hw')
   let g:unite_source_grep_command = 'hw'
   let g:unite_source_grep_default_opts = '--no-group --no-color'
   let g:unite_source_grep_recursive_opt = ''
 endif
