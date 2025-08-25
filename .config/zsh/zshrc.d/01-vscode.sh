# Интеграция с VS Code (я его больше не использую)
# https://code.visualstudio.com/docs/terminal/shell-integration
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  . "$(code --locate-shell-integration-path zsh)"
fi
