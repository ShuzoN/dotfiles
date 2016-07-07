#!/bin/bash
#****************** proxy_on.sh *******************
#reated: 2014/11/07
# Last Change:2015-Feb-09.
#
# --- abst ---
# nut proxyをonにする.
# macのネットワーク設定をNUTにする.

# sudoコマンドをpasswdなしで使う方法
# http://qiita.com/pugiemonn/items/baaf7243ded2e6ab94f9
#************************************************************
export http_proxy=http://proxy.nagaokaut.ac.jp:8080/
export HTTP_PROXY=$http_proxy
export https_proxy=$http_proxy
export HTTPS_PROXY=$http_proxy
export ftp_proxy=$http_proxy
export FTP_PROXY=$http_proxy
export no_proxy=.local,169.254/16,10.10.10.10,127.0.0.1
export use_proxy=yes

ln -sf $HOME/.dotfiles/.wgetrc $HOME/.wgetrc
ln -sf $HOME/.dotfiles/.curlrc $HOME/.curlrc

echo "NUT proxy enable, linked wgetrc, linked curlrc"

network_location="nut" #for mac system network
sudo networksetup -switchtolocation $network_location > /dev/null
