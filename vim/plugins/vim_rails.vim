  " === Railsプロジェクト間のfile移動をワンアクションで可能にする ===
  " " vim rails
  " NeoBundle 'tpope/vim-rails'
  " " コマンドを短縮する
  " NeoBundle 'tyru/vim-altercmd'
  "
  au BufRead *.* AlterCommand ni NeoBundleInstall
  " tyru/はフォーク版, オリジナルはkana/
  autocmd User Rails AlterCommand r R " 対応したmvcに移動
  autocmd User Rails AlterCommand rc Rcontroller "対応するコントローラに移動
  autocmd User Rails AlterCommand rm Rmodel  " モデルに移動
  autocmd User Rails AlterCommand rv Rview  " ビューに移動
  autocmd User Rails AlterCommand ra A  " テストに移動
