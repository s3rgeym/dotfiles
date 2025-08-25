[[ "$(ps -o comm= -p "$PPID")" =~ 'alacritty|kitty|ghostty|foot' ]] \
  && [[ "$-" =~ i ]] \
  && command -v zellij >/dev/null \
  && [[ -z "$ZELLIJ" ]] && exec zellij # attach --index 0 --create
