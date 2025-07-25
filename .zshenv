# Переменные, объявленные здесь, доступны в графических приложениях
# Часть переменных объявлена в ~/.config/environment.d/ (аналоге /etc/environment)
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Для переопрделения пути до файдов настроек zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
