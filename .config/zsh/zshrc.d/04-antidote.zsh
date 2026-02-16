#!/usr/bin/zsh
# Управляет плагинами Zsh с помощью менеджера 'antidote'.
# https://antidote.sh/

# 1. Определяем пути для antidote и файла плагинов.
antidote_dir="${ZDOTDIR:-$HOME}/.antidote"
zsh_plugins="${ZDOTDIR:-$HOME}/.zsh_plugins"

# 2. Устанавливает antidote, если он еще не установлен.
if [[ ! -d "$antidote_dir" ]]; then
  echo "Installing antidote..."
  git clone -q --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi

# 3. Создает пустой файл для списка плагинов, если он не существует.
[[ -f "${zsh_plugins}.txt" ]] || touch "${zsh_plugins}.txt"

# 4. Регистрирует команду 'antidote' для ленивой автозагрузки.
if [[ -d "${antidote_dir}/functions" ]]; then
  fpath=("${antidote_dir}/functions" $fpath)
  autoload -Uz antidote
fi

# 5. Пересобирает статический файл плагинов, если список изменился.
if [[ ! "${zsh_plugins}.zsh" -nt "${zsh_plugins}.txt" ]]; then
  if (( $+functions[antidote] )); then
    antidote bundle <"${zsh_plugins}.txt" >|"${zsh_plugins}.zsh"
  fi
fi

# 6. Загружает сгенерированный статический файл с плагинами.
[[ -f "${zsh_plugins}.zsh" ]] && source "${zsh_plugins}.zsh"

# 7. Удаляет временные переменные.
unset antidote_dir zsh_plugins
