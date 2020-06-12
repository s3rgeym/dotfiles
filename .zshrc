#!/usr/bin/env zsh

fpath+=~/.zfunc

source /usr/share/zsh/scripts/zplug/init.zsh

# добавил после того как заметил, что нет привычных мне алиасов
zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview
zplug "plugins/archlinux", from:oh-my-zsh
# При установке из репозиторяи нужно задать переменную окружения ASDF_DIR
# С последними версиями asdf-vm не работает
# zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/autopep8", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
# конфликтует с fd, заменяет rm на `rm -i` и т.д.
#zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/copydir", from:oh-my-zsh
zplug "plugins/copyfile", from:oh-my-zsh
# в основном добавляют автодополнение для команд
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/encode64", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/fd", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/git-flow-avh", from:oh-my-zsh
# алиасы для git
zplug "plugins/git", from:oh-my-zsh
# функции
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
# добавляет сочетания клавиш
zplug "plugins/man", from:oh-my-zsh
# node-docs
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/pylint", from:oh-my-zsh
# задает алиас ipython, который не дружит с pyenv
# zplug "plugins/python", from:oh-my-zsh
zplug "plugins/rsync", from:oh-my-zsh
# повторяет последнюю выполненную команду с sudo по двойному нажатию ESC
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/themes", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh
# модифицирует промпт
zplug "plugins/virtualenv", from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh
# алиасы
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-syntax-highlighting"

# Работает намного быстрее предыдущего плагина и подсвечивает лучше
zplug "zdharma/fast-syntax-highlighting"

# Сообщает о том, что для команды существует алиас
zplug "MichaelAquilina/zsh-you-should-use"

# zplug romkatv/powerlevel10k, as:theme, depth:1

# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

setopt prompt_subst # Make sure prompt is able to be generated properly.
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Флаг --verbose служит для вывода отладочной информации
zplug load # --verbose

. /opt/asdf-vm/asdf.sh
# . /usr/share/bash-completion/completions/asdf

eval "$(hub alias -s)"

alias :q='exit'
alias reload='exec $SHELL -l'
alias zshrc='$EDITOR ~/.zshrc && . ~/.zshrc'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

mcd() { mkdir -p "$1" && cd "$1" }

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}

zle -N pet-select
stty -ixon
bindkey '^s' pet-select

neofetch
