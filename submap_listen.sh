#!/bin/sh

mako_notify() {
  
STATUS="$HOME/.config//hypr/listeners/submap_id.txt"
SUBMAP=$(hyprctl submap)
# makoctl dismiss $STATUS || NID=$(notify-send -p "First notification") && echo $NID > $STATUS
#
if [ -s "$STATUS" ]; then
  makoctl dismiss $STATUS
  echo "hello"
  cp /dev/null $STATUS
  makoctl mode -r hyprsubmaps
elif [ ! -s "$STATUS" ]; then
  makoctl mode -a hyprsubmaps
  NID=$(notify-send "$SUBMAP ACTIVE, \"Esc\" to close") &&
  echo "$NID" > $STATUS
fi
}

handle() {
  case $1 in
    # createworkspace*notes) echo "notes" ;;
    # activespecial*notes) echo "yes" ;;
    submap*) mako_notify ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
