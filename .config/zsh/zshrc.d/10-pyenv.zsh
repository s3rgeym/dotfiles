#!/usr/bin/zsh
# Настройка менеджера версий Python 'pyenv'.

# Устанавливает корневую директорию для pyenv.
export PYENV_ROOT="$HOME/.pyenv"
# Добавляет исполняемые файлы pyenv в PATH.
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# Инициализирует pyenv и его "shims" (заглушки для команд python).
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi