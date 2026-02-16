#!/usr/bin/zsh
# Интеграция менеджера сниппетов 'pet' с Zsh.

# Функция-виджет для поиска и вставки сниппета 'pet'.
function pet-select() {
  # Ищет сниппет и вставляет в командную строку.
  BUFFER=$(pet search --query "$LBUFFER")
  # Перемещает курсор в конец.
  CURSOR=$#BUFFER
  # Обновляет отображение строки.
  zle redisplay
}

# Регистрирует функцию как Zsh-виджет.
zle -N pet-select
# Отключает блокировку терминала по Ctrl+s.
stty -ixon
# Привязывает виджет к сочетанию Ctrl+s.
bindkey '^s' pet-select