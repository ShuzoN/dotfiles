" ===================================================
"                        Ruby 
" ===================================================
" scss
au BufRead,BufNewFile *.scss set filetype=scss.css


" ===================================================
"                        Go
" ===================================================
" tmpl
au BufRead,BufNewFile *.tpl setl ft=gohtmltmpl


" ===================================================
"                     javascript 
" ===================================================
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


" ===================================================
"                     Markdown
" ===================================================
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


" ===================================================
"                         XML 
" ===================================================
  " htmlタグの自動補完(erbファイルに適応)
  augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
  augroup END

