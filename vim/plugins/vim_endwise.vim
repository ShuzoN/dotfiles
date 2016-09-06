" defに対しendを自動補完
" NeoBundle 'tpope/vim-endwise'
function! MyInsertBracket(lbrackets, rbracket)
  if index(a:lbrackets, getline('.')[col('.') - 2]) != -1
    return a:rbracket . "\<Left>"
  else
    return a:rbracket
  endif
endfunction
inoremap <expr> > MyInsertBracket(['<'], '>')
