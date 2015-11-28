#!/bin/bash
#****************** proxy_off.sh *******************
#reated: 2014/11/08
# Last Change:2015-Feb-09.
#
# --- abst ---
# nut proxy off
# macのネットワーク設定をoffにする.

# sudoコマンドをpasswdなしで使う方法
# http://qiita.com/pugiemonn/items/baaf7243ded2e6ab94f9
#************************************************************
unset http_proxy
unset HTTP_PROXY
unset https_proxy
unset HTTPS_PROXY
unset ftp_proxy
unset FTP_PROXY
unset no_proxy
export use_proxy=no

echo "NUT proxy disable"

#heck file exist -e
[ -e ~/.wgetrc ] && unlink ~/.wgetrc && echo "wgetrc is deleted"
[ -e ~/.curlrc ] && unlink ~/.curlrc && echo "curlrc is deleted"
network_location="home" #macのguiネットワーク環境名
sudo networksetup -switchtolocation $network_location > /dev/null
