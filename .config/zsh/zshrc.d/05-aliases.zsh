#!/usr/bin/zsh
# Алиасы могут быть переопределены в плагинах, поэтому они задаются после их
# загрузки

# Быстрый выход из терминала.
alias q='exit'
# Короткий вызов sudo.
alias s='sudo'
alias se='sudo -e'
# Запуск редактора Helix.
#alias hx='helix'
alias nv='nvim'
alias nvc='nvim $HOME/.config/nvim/init.lua'
# Быстрое редактирование конфига zsh.
alias zshrc="$EDITOR $ZDOTDIR/.zshrc"
# Переход в рабочую директорию.
alias ws="cd ~/workspace/"
# Управление dotfiles через "bare" git-репозиторий.
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
# Запуск Ungoogled Chromium, установленного через Flatpak.
# io.github... доступен как команда
alias chromium='flatpak run io.github.ungoogled_software.ungoogled_chromium'
alias zj=zellij
alias zed=zeditor

alias flatinst="fltapak install --system"
