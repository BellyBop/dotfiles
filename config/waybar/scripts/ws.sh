#!/usr/bin/env bash
# Prints the state of workspace $1 for the bar on monitor $WAYBAR_OUTPUT_NAME.
n=$1
on=(① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩)
act=(❶ ❷ ❸ ❹ ❺ ❻ ❼ ❽ ❾ ❿)
mon=${WAYBAR_OUTPUT_NAME}
monactive=$(hyprctl monitors -j | jq --arg m "$mon" '.[] | select(.name == $m) | .activeWorkspace.id')
wsmon=$(hyprctl workspaces -j | jq -r --argjson n "$n" '.[] | select(.id == $n) | .monitor')
if [ "$monactive" = "$n" ]; then
  echo "{\"text\":\"${act[n-1]}\",\"class\":[\"ws\",\"active\"]}"
elif [ -n "$wsmon" ] && [ "$wsmon" = "$mon" ]; then
  echo "{\"text\":\"${on[n-1]}\",\"class\":[\"ws\"]}"
else
  echo '{"text":""}'
fi
