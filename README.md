
.file をgitで管理するためのフォルダー

.zshrc
.vimrc
の管理がメインかな


## network setup
=======================================
terminalを開くと以下が自動で設定される.  
When you boot terminal, the programs switch proxy settings automatically.  

 * macのネットワーク環境 (mac system network setting)
 * terminalのネットワーク環境 (network setting on terminal)

=======================================

ネットワーク設定を自動化するために必要なファイルは以下のファイル. リポジトリからcloneする.

The following files necessary to automate the network configuration.  Please clone from my repository.  

```
# コピーと編集が必要なファイル一覧  
# copy files
set_proxy_by_dns.sh
/bin/create_network_nut
/bin/proxy_off.sh
/bin/proxy_on.sh
```


### プロキシを利用する設定を作る 
make proxy setting  

まず, 以下のコマンドを実行.  
First of all, you run the following script .

```sh
# make a new network setting
$ sh ./bin/create_network_nut.sh

# run this command
$ sudo networksetup -listlocations
  ...
  nut # include "nut", Success
  ...
```

Mac上に大学のネットワーク設定が自動生成される.   
This script makes a network setting for university on your PC.


###プロキシを使用しない設定を作る
make no proxy setting

プロキシを利用しないネットワーク環境を作る.  
Make a network setting that does not use proxy.  
[ネットワーク設定の作り方](https://support.apple.com/ja-jp/HT202480)  

そして, 作ったネットワーク環境名を``./bin/proxy_off.sh``に書き込む.  
and, edit ``./bin/proxy_off.sh``. You should change "your no proxy setting name(default:home)".  

```sh
# edit ./bin/proxy_off.sh
network_location="your no proxy setting name" # edit this line
sudo networksetup -switchtolocation $network_location > /dev/null
```


### 自動実行を有効にする
Enable auto execute

**shell設定ファイルに追加**  
``.zshrc``か``.bashrc``に以下を追加.  
使用しているshellによって適宜変えてください.     
Add this line to ``~/.zshrc or ~/.bashrc``.  
Please change as appropriate by your login shell.

```bash
# add this line to ~/.zshrc or ~/.bashrc
source "$YOURPATH/set_proxy_by_dns.sh"
```

**networksetupをパスワードなしで実行する**
scriptの中でroot権限で実行する``networksetup``コマンドを使用している.  
これをパスワードなしで実行できるように設定を変更する.  
root権限のファイルを弄るので編集は間違えないように注意する.  
[パスワードなしでsudoコマンドを実行する](http://qiita.com/pugiemonn/items/baaf7243ded2e6ab94f9)

Some scripts use ``networksetup`` command.  
It is necessary to root privileges to run this command.  
You should change "sudo config file(sudoers)" to run this command without a password. If you mistake, you can't use sudo. Please take care.

```sh
# check your hostname
$ hostname
  show your_hostname

# edit su config file
$ sudo visudo
# add this line
  your_hostname ALL=(ALL) NOPASSWD: /usr/sbin/networksetup 
  # if you want to save and quit, enter :wq

# operation check
$ /usr/bin/sudo /usr/sbin/networksetup -version
# これでパスワードを要求された場合, 設定を間違えている
# if you are prompted to enter password, you are mistaken.

```

これで, terminalを開くと以下が自動で設定される.  
Setup is finish. you boot terminal, the programs auto set proxy.  

 * macのネットワーク環境
 * terminalのネットワーク環境

