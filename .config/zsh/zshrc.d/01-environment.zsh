#!/usr/bin/zsh
# Пользовательскте переменные окружения, доступные в терминале. Глобальные
# можно задать в ~/.zshenv, но он грузится единожды при старте системы либо в
# ~/.config/environment.d, но последние доступны только в графической сессии.

# Устанавливает путь к рабочему пространству Go.
export GOPATH="${GOPATH:-$HOME/go}"

# Определяет редакторы по умолчанию для командной строки.
export EDITOR=nvim
#export VISUAL=$EDITOR

# Объявляет уникальные массивы для путей $PATH и $fpath.
typeset -U path fpath

# Добавляет пользовательские пути к исполняемым файлам в $PATH.
path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  "$GOPATH/bin"
  "$HOME/.cargo/bin"
  $path
)

# Добавляет пути к пользовательским функциям и автодополнениям Zsh.
fpath+=(
  "$ZDOTDIR/functions"
  "$ZDOTDIR/completions"
)

# Скрипты из данного каталого будут импортированы как функции
autoload -Uz ${ZDOTDIR}/functions/*(N)

# Теперь нужно completions подгрузить
autoload -Uz compinit
compinit
