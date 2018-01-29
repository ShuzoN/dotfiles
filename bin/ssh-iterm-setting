#!/bin/zsh
# ~/bin/ssh-iterm-setting

set_color() {
  local HEX_BG=$1
  local OPACITY=$2

  local BG_R=`echo $HEX_BG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$1 * 257)}'`
  local BG_G=`echo $HEX_BG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$2 * 257)}'`
  local BG_B=`echo $HEX_BG | sed 's/../0x&,/g' | awk -F "," '{printf("%d",$3 * 257)}'`

  /usr/bin/osascript <<EOF
tell application "iTerm"
   tell current session of current terminal
      set background color to {$BG_R, $BG_G, $BG_B} 
      set transparency to "$OPACITY" 
   end tell
end tell
EOF
}

# 接続host名で振り分け
if [[ "$@" =~ stg ]]; then
   # 色・透明度設定
   set_color 000033 0.2 
elif [[ "$@" =~ prod ]]; then
   set_color 330000 0.2
fi

ssh $@

set_color 000000 0.2
