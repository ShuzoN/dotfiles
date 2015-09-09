#!/bin/bash
#****************** proxy_off.sh *******************
#reated: 2014/11/08
# Last Change:2015-Feb-09.
#
# --- abst ---
# nut proxy off
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
