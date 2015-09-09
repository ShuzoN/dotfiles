#!/usr/bin/env.sh
#************* bin/create_newtwork_nut.sh *******************
# created: 2015-Feb-09
# Last Change: 2015-Feb-11.
#------------------------------------------------------------
#create osx network location for nut
# nutのネットワークをmac上に自動生成してくれるスクリプト
#************************************************************

# Wi-FiかEthernetが有効ならservicesに追加
get_services()
{
  services=''
  networksetup -listallhardwareports | grep 'Hardware Port: Wi-Fi' > /dev/null
  [ "$?" -eq 0 ] && services='Wi-Fi'

  networksetup -listallhardwareports | grep 'Hardware Port: Ethernet' > /dev/null
  [ "$?" -eq 0 ] && services=$services' Ethernet'
}

#create each service
create_services()
{
  for service in $services; do
    echo "networksetup -createnetworkservice $service"
    sudo networksetup -createnetworkservice $service $service
  done
}

# setup for each service
setup()
{
  for service in $services; do
    echo "networksetup $1 $service ${@:2}"
    sudo networksetup $1 $service ${@:2}
  done
}


location=nut
echo "networksetup -createlocation $location"
sudo networksetup -createlocation $location
sudo networksetup -switchtolocation $location

# get available hardware -> $services
get_services
create_services

#---- setup
# DNS
setup -setdnsservers 133.44.62.200 133.44.62.201
setup -setsearchdomains nagaokaut.ac.jp
# set proxy
proxy=proxy.nagaokaut.ac.jp
port=8080
setup -setwebproxy $proxy $port
setup -setsecurewebproxy $proxy $port
setup -setftpproxy $proxy $port
noproxy='*.local 169.254/16 127.0.0.1 localhost 10.10.10.10 *.nagaokaut.ac.jp'
setup -setproxybypassdomains "${noproxy}"
