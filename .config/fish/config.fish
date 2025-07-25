if not status is-interactive
  exit
end

# Эти пути будут добавлены в $PATH единожды
fish_add_path -m ~/bin ~/.local/bin

# Определим переменные XDG
set -q XDG_DATA_HOME || set -U XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME || set -U XDG_STATE_HOME $HOME/.local/state
set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME $HOME/.config
set -q XDG_CACHE_HOME || set -U XDG_CACHE_HOME $HOME/.cache

# Различные настройки
# Используем привычные сочетания клавиш
set -U fish_key_bindings fish_default_key_bindings

# Двойное нажатие ESC не работает, если выставить меньше
set -g fish_escape_delay_ms 300

if command -q pyenv
  pyenv init - fish | source
end

if command -q direnv
  direnv hook fish | source
end

# В Yakuake вывод fetch не очень смотрится
if command -q fastfetch && ! string match -q -- "*yakuake*" (pstree -s -p $fish_pid)
  fastfetch
end
