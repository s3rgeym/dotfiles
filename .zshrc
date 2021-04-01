#!/usr/bin/env zsh
fpath+=~/.zfunc

# периодически нужно выполнять `zplug update`
source /usr/share/zsh/scripts/zplug/init.zsh

# добавил после того как заметил, что нет привычных мне алиасов
zplug "robbyrussell/oh-my-zsh", as:plugin, use:"lib/*.zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins-Overview
zplug "plugins/archlinux", from:oh-my-zsh
# yay -S asdf-vm
# не работает
# zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/autopep8", from:oh-my-zsh # autocomplete
zplug "plugins/colored-man-pages", from:oh-my-zsh # colored + redefined man
# ccat и cless
zplug "plugins/colorize", from:oh-my-zsh # ccat, cless
zplug "plugins/command-not-found", from:oh-my-zsh
# алис для rm
# zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/copydir", from:oh-my-zsh # copydir -- copy directory path to the clipboard
zplug "plugins/copyfile", from:oh-my-zsh # copyfile
#zplug "plugins/docker-compose", from:oh-my-zsh # aliases
zplug "plugins/docker", from:oh-my-zsh # autocomplete

# ZSH_DOTENV_FILE=.dotenv
zplug "plugins/dotenv", from:oh-my-zsh # autoload .env
# vi $ZSH_CACHE_DIR/dotenv-allowed.list

zplug "plugins/extract", from:oh-my-zsh # extract
zplug "plugins/fd", from:oh-my-zsh # autocomplete
zplug "plugins/fzf", from:oh-my-zsh # autocomplete, keybindings, other
# zplug "plugins/git-flow-avh", from:oh-my-zsh
# zplug "plugins/git", from:oh-my-zsh # aliases
#zplug "plugins/github", from:oh-my-zsh # functions
zplug "plugins/history", from:oh-my-zsh # h, hs, hsi
zplug "plugins/history-substring-search", from:oh-my-zsh
#zplug "plugins/httpie", from:oh-my-zsh
# добавляет сочетания клавиш
#zplug "plugins/man", from:oh-my-zsh
# node-docs
zplug "plugins/node", from:oh-my-zsh # node-docs
#zplug "plugins/npm", from:oh-my-zsh aliases
zplug "plugins/pip", from:oh-my-zsh # autocomplete
#zplug "plugins/pylint", from:oh-my-zsh # aliases
# zplug "plugins/python", from:oh-my-zsh # aliases
zplug "plugins/rsync", from:oh-my-zsh # rsync-copy, rsync-move, rsync-update, rsync-synchronize
zplug "plugins/sudo", from:oh-my-zsh # <Esc><Esc> -- repeat command with sudo
#zplug "plugins/systemd", from:oh-my-zsh # aliases
#zplug "plugins/thefuck", from:oh-my-zsh # conmflicts withsudo
zplug "plugins/themes", from:oh-my-zsh
#zplug "plugins/urltools", from:oh-my-zsh
#zplug "plugins/virtualenv", from:oh-my-zsh # virtualenv_prompt_info fn
zplug "plugins/virtualenvwrapper", from:oh-my-zsh # auto activate virtualenv
#zplug "plugins/vscode", from:oh-my-zsh
#zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh # src

# https://github.com/zsh-users/zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions"

# Добавляет автодополнение для некоторых команд, например, xsel
zplug "zsh-users/zsh-completions"

# zplug "zsh-users/zsh-syntax-highlighting"
# Работает намного быстрее предыдущего плагина и подсвечивает лучше
zplug "zdharma/fast-syntax-highlighting"

# Сообщает о том, что для команды существует алиас
zplug "MichaelAquilina/zsh-you-should-use"

# Темы Oh-My-Zsh

# Минималистичная с правой угловой скобкой для приглашения командной строки
# zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Похожа на предыдущую, но только со стрелочкой и показывает время выполнения
# команды
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Одна из самых популярных на Github
# setopt prompt_subst # Make sure prompt is able to be generated properly.
# zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

# Универсальная с констуктором, который позволяет в интерактивном режиме
# создать свою тему, похожую на одну из перечисленных выше
# zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Флаг --verbose служит для вывода отладочной информации
zplug load # --verbose

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# zsh history size
HISTSIZE=100000
SAVEHIST="$HISTSIZE"

# Требуется для Python, установленного через pyenv, для компиляции YCM при
# установке YouCompleteMe
export PYTHON_CONFIGURE_OPTS="--enable-shared"
# Поддержка модулей Go. Не нужно, начиная с 1.16
export GOO111MODULE=on
# export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

conf_files=($HOME/.zsh/*.zsh(N))
for conf_file in "${conf_files[@]}"; do
  source "$conf_file"
done

# yay -S hub
# alias git=hub
eval "$(hub alias -s)"

# plugin asdf для oh my zsh не робiт
[ -d "/opt/asdf-vm" ] && source /opt/asdf-vm/asdf.sh
  #source /opt/asdf-vm/completions/asdf.bash
# fi

# yay -S tilix
# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#   source /etc/profile.d/vte.sh
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# https://github.com/starship/starship
# yay -S starship-bin
eval "$(starship init zsh)"
