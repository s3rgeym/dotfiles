# fish всем хорош кроме багов и синтаксиса, который не имеет обратной
# совместимости с Bash
# $XDG_CONFIG_HOME
export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"

# Пути и переменные окружения
export GOPATH="${GOPATH:-$HOME/go}"

typeset -U path fpath

path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  "$GOPATH/bin"
  "$HOME/.cargo/bin"
  #"$PYENV_ROOT/bin"
  $path
)

fpath+=(
  "$ZDOTDIR/functions"
  "$ZDOTDIR/completions"
)

# Подгружаем функции
autoload -Uz "$ZDOTDIR/functions/*(D:tN)"

# А теперь дополнения
# Проверяет пути из fpath и ищет файлы с именем типа _foo
autoload -Uz compinit && compinit

# Настройки самого zsh
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history       # Запись timestamp и длительности команд
setopt hist_expire_dups_first # Удаление дубликатов при переполнении
setopt hist_ignore_dups       # Игнорирование повторяющихся команд
setopt hist_ignore_space      # Пропуск команд, начинающихся с пробела
setopt share_history          # Общая история между сессиями

# Этот режим что-то совсем бесполезный
# # Включаем vi-mode (Ctrl-[, Esc - переход в нормальный режим)
# # Сбросит все сочетания, поэтому должен вызываться до других вызовов bindkey
# bindkey -v
#
# # В vi-mode стандартные (Emacs) сочетания не заданы по-умолчанию
# # см. bindkey -M viins
# bindkey '^A' beginning-of-line
# bindkey '^E' end-of-line
# bindkey '^B' backward-char
# bindkey '^F' forward-char
# bindkey '\eb' backward-word # Alt-B
# bindkey '\ef' forward-word # Alt-F
# bindkey '^K' kill-line
# bindkey '^P' history-beginning-search-backward
# bindkey '^N' history-beginning-search-forward
#
# Поиск по истории с Up/Down Arrows
# Работает так: печатаем часть команды, а потом, нажимая стрелки выбираем варианты, начинающиеся с подстроки

# Этот вариант не работат
# bindkey "^[[A" history-substring-search-up
# bindkey "^[[B" history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Настройки плагинов через zstyle должны быть до их подключения
#zstyle ':antidote:compatibility-mode' 'antibody' 'on'

#zstyle ':omz:update' mode disabled

# Отображение иконок в ls
zstyle ':omz:plugins:eza' 'icons' yes

# Запрещаем Pure автоматически выполнять 'git fetch' для проверки обновлений
# в удаленном репозитории и отображения индикаторов отставания/опережения.
export PURE_GIT_PULL=0

# Указываем Pure выполнять 'git fetch' только для вышестоящей ветки
# текущей локальной ветки. Это может ускорить обновление индикаторов Git.
zstyle :prompt:pure:git:fetch only_upstream yes

# https://github.com/Aloxaf/fzf-tab/wiki/Configuration
# zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
# zstyle ':fzf-tab:*' accept-line enter

zstyle ':omz:plugins:nvm' lazy yes

# Автозагрузка конфигов
# mkdir -p "$ZDOTDIR/zshrc.d"
# конфигам лучше добавлять числовые префиксы, чтобы управлять порядком их загрузки
# touch $ZDOTDIR/zshrc.d/00-core.zsh
# echo "alias zshrc='$EDITOR $ZDOTDIR/.zshrc'" >> "$ZDOTDIR/zshrc.d/editor.sh"
# echo 'alias vimrc="vim $MYVIMRC"' >> "$ZDOTDIR/zshrc.d/aliases.sh"
if [[ -d $ZDOTDIR/zshrc.d ]]; then
  # игнорируем дот-файлы
  for config ($ZDOTDIR/zshrc.d/[^.]*(N)); do
    #echo $config >&2
    . "$config"
  done
fi

if [[ "$TERM" == "foot" ]]; then
  [[ -z "$ZELLIJ" ]] && exec zellij attach --index 0 --create
fi

# https://code.visualstudio.com/docs/terminal/shell-integration
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  . "$(code --locate-shell-integration-path zsh)"
fi
