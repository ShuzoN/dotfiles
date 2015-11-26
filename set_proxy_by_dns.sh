#! /usr/bin/env bash 
#****************** set_proxy_by_domain_name_server*******************
#reated: 2014/12/05
# Last Change:2015-Feb-09.
#
# MacのNetwork Locationでproxyを設定
# http://qiita.com/uetchy/items/b9991d1f86b23f4a184d
#************************************************************
domain_server="SERVER: 133.44.62.200" #domain server ip
if dig | grep -q $domain_server ; 
then
  source "$DOTSDIR/bin/proxy_on.sh"
else
  source "$DOTSDIR/bin/proxy_off.sh"
fi
