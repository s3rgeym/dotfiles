#!/usr/bin/zsh
# Настраивает автоматический запуск мультиплексора 'Zellij'.

if [[ -o interactive ]] && \
    [[ "$TERM" =~ "alacritty|kitty|foot*" ]] && \
    (( $+commands[zellij] )); then
  # Автоматически выходить из zellij, когда закрыто последнее пане.
  export ZELLIJ_AUTO_EXIT=true

  eval "$(zellij setup --generate-auto-start zsh)"
fi
