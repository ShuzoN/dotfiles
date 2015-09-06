#rbenvの初期化設定
#eval "$(rbenv init -)"
#パスを通す
export PATH=/usr/local/bin:$PATH
export PATH=/usrtexbin:$PATH

#Railsコマンドの補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
function railsComp(){
if [ -e /usr/local/share/zsh-completions ]; then
fpath=(/usr/local/share/zsh-completions $fpath)
fi
}
zle -N railsComp
bindkey ^r railsComp
#
# gitコマンドの補完
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
# 補完機能を有効にする
autoload -Uz compinit
compinit
#補完候補を一覧で表示する
setopt auto_list
#補完キー連打で補完候補を順に表示する
setopt auto_menu
# =以降も補完する
setopt magic_equal_subst
#Shift-Yabで補完候補を逆順する
bindkey "^[[Z" reverse-menu-complete"]]"
#補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#キーバインドをvimライクにする
bindkey -v
#色を出力できるようにする
autoload colors
colors
# PROMPTを表示
Currentmode=""
##プロンプトの表示毎にプロンプト文字列を再評価
setopt prompt_subst 
function zle-line-init zle-keymap-select {
local color mode #ローカル変数宣言
case $KEYMAP in
  vicmd)
    color=${fg[yellow]}
    mode='nor'
    ;;
  main|viins)
    color=${fg[cyan]}
    mode='ins'
    ;;
esac
Currentmode="$color$mode$reset_color"
}
zle -N zle-line-init
zle -N zle-keymap-select
PROMPT="
[%n/$Currentmode] %{$fg_bold[yellow]%} %~%{$reset_color%}
$ "
PROMPT2="
$ "
RPROMPT=""
#コマンド実行時に右プロンプトを消す# cd - で１つ前にいたディレクトリに移動
setopt transient_rprompt 
#補完の時プロンプトの位置を変えない
setopt always_last_prompt 
#cd tabキーで過去に移動したディレクトリを表示
setopt auto_pushd

alias ls='ls -GF'


#カレントディレクトリとユーザ名を２行で表示
# PROMPT="
# %{${fg[yellow]}%}%~%{${reset_color}%}
# [%n]$ "
# PROMPT2='[%n] '
# cd - で１つ前にいたディレクトリに移動
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# ディレクトリ名だけでcd
setopt AUTO_CD
#j+ディレクトリ名(一部)でディレクトリにジャンプ
if [ -f `brew --prefix`/etc/autojump ]; then
.`brew --prefix`/etc/autojump
fi
#コマンドのスペルを訂正する
setopt correct
# lsコマンドの色設定
export LSCOLORS=gxfxcxdxbxegedabagacad
#その他とりあえずいるもの
export LANG=ja_JP.UTF-8
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# フローコントロールを無効にする
setopt no_flow_control
# '#' 以降をコメントとして扱う
setopt interactive_comments
#------------------------------------
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g ls='ls -GF'
alias -g curl='curl -tlsv1'
alias -g pyg='pygmentize'
alias j="autojump"
alias -g afp='afplay -q 1'


#--------- ヒストリの設定 ---------
source ~/zaw/zaw.zsh #zawと呼ばれるプラグイン
#ヒストリの保存場所
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
function mkcd(){mkdir -p $1 && cd $1}
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# spaceで始まるコマンド行はヒストリから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 同じコマンドは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 高機能なワイルドカード展開を使用する
setopt extended_glob

#history一覧の表示
bindkey '^h' zaw-history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
#--------------------------------------
# ネットワークプロキシの設定
# export http_proxy=http://proxy.nagaokaut.ac.jp:8080
export http_proxy=""
export https_proxy=$http_proxy
export all_proxy=$http_proxy
export use_proxy=yes
 # git config --global http.proxy proxy.nagaokaut.ac.jp:8080
 # git config --global https.proxy proxy.nagaokaut.ac.jp:8080


#####################  git 機能 ########################
#何も入力せずenterで ls, git status, git branch
function do_enter() {
if [ -n "$BUFFER" ]; then
  zle accept-line
  return 0
fi
echo
ls -a
echo -e "\e[0;33m--- git branch ---\e[0m"
git branch
echo -e "\e[0;33m--- git status ---\e[0m"
git status -sb
if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
  git status -sb
fi
zle reset-prompt
return 0
}
zle -N do_enter
bindkey '^m' do_enter

#hubコマンドをgitコマンドとしてエイリアス(hubはgitの拡張ライブラリ)
eval "$(hub alias -s)"

# ブランチ名をterminalに表示
# GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '

#RVMの初期化設定
export PATH=“$HOME/.rvm/bin:$PATH”
export PATH=“$HOME/.rvm/scripts:$PATH”
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


export PGDATA=/usr/local/var/postgres
