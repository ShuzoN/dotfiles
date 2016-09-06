" ------------clever-f--------------
" fによる検索を拡張する
" f{char} : 行内のcharを検索する
" f,Fで検索結果をnext,backする
" NeoBundle 'rhysd/clever-f.vim'
" 大文字小文字を無視する
let g:clever_f_smart_case=1
" 日本語に対応
let g:clever_f_use_migemo=1
" カーソル移動がマッチの方向に依存しなくなる
let g:clever_f_fix_key_direction=1
" 現在行のみマッチ
let g:clever_f_across_no_line=1
