
" ------------easymotion-------------
" 画面内を2keyでカーソル移動
" http://haya14busa.com/mastering-vim-easymotion/
"  :w       : カーソル後方の単語全てにショートカットを表示
"  :s{char} : 画面内のcharにショートカットを表示
" NeoBundle 'Lokaltog/vim-easymotion'
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
