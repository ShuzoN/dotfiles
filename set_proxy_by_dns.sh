#! /usr/bin/env bash 
#****************** set_proxy_by_domain_name_server*******************
#reated: 2014/12/05
# Last Change:2015-Feb-09.
#
# MacのNetwork Locationでproxyを設定
# http://qiita.com/uetchy/items/b9991d1f86b23f4a184d

# digコマンド
# http://www.atmarkit.co.jp/ait/articles/1409/25/news001.html#opt
#************************************************************
domain_server="SERVER: 133.44.62.200" #domain server ip
if dig -4 +time=1 | grep -q $domain_server ; 
then
  source "$DOTSDIR/bin/proxy_on.sh"
else
  source "$DOTSDIR/bin/proxy_off.sh"
fi
