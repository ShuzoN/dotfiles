" --------------------------------
" rubocop
" --------------------------------
" 文法チェック機能追加
" NeoBundle 'ngmy/vim-rubocop'
let g:vimrubocop_config = '/usr/local/project/.rubocop.yml'

" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:ref_refe_cmd = $HOME.'/.rbenv/shims/refe'

" railsプロジェクトのみ--railsオプションをつける
au FileType ruby if exists('b:rails_root') |
  \ let b:syntastic_ruby_rubocop_options = '--rails' | endif

