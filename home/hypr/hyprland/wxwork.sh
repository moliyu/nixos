#!/bin/sh

remove_wechat_shadow() {
    wechat_windows=`xwininfo -root -children | grep wxwork.exe | grep "has no name" | awk '{printf "%s ", $1}'`
    eval "arr=($wechat_windows)"
    for wechat_window in "${arr[@]}"; do
        xdotool windowunmap $wechat_window
    done
}

handle() {
  case $1 in
      openwindow*) 
          # echo $1
          if [[ $1 == *wxwork* ]]; then
              echo $1
              remove_wechat_shadow
          fi
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
