
  " アクティブウィンドウに限りカーソル行(列)を強調する
  augroup vimrc_set_cursorline_only_active_window
    autocmd!
      autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
  highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
        augroup END

  " --- Undo treeをグラフィカル表示 ---
  " --- vimでコードを実行 ---
  " NeoBundle 'thinca/vim-quickrun'
  nnoremap Q :QuickRun ruby<CR>

  " --- キャメルケース<=>スネークケースを切り替える ---
  " NeoBundle 'kana/vim-operator-user'
  " NeoBundle 'tyru/operator-camelize.vim'
  map <Space>p <plug>(operator-camelize-toggle)

  " --- go 周り ---
  " NeoBundleLazy 'fatih/vim-go', {
        \ 'autoload' : { 'filetypes' : 'go'  }
        \ }
  " format with goimports instead of gofmt
  let g:go_fmt_command = "goimports"
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1

  " NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
  " NeoBundle 'pangloss/vim-javascript'

  " --- json 周り ---
  " NeoBundle 'Quramy/vison'
  autocmd BufRead,BufNewFile package.json Vison
  autocmd BufRead,BufNewFile .bowerrc Vison bowerrc.json

  " --- editor config ---
  " NeoBundle 'editorconfig/editorconfig-vim'

  " NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " NeoBundleCheck
