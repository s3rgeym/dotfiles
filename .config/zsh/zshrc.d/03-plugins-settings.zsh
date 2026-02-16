#!/usr/bin/zsh

# Отключаем экранирование символов при вставке в терминал
DISABLE_MAGIC_FUNCTIONS=true

# you should use
export YSU_MESSAGE_POSITION="after"

# Задает "чистый" стиль для темы Typewritten, похожий на Pure.
export TYPEWRITTEN_PROMPT_LAYOUT=pure

# Отключает автоматический `git fetch` в теме Pure для ускорения работы.
export PURE_GIT_PULL=0

# zstyle используется для тонкой настройки плагинов и модулей Zsh.

# Режим совместимости antidote с antibody (закомментировано).
#zstyle ':antidote:compatibility-mode' 'antibody' 'on'

# Отключает автоматическое обновление Oh My Zsh.
zstyle ':omz:update' mode disabled

# Включает отображение иконок для команды `eza` (замена `ls`).
zstyle ':omz:plugins:eza' 'icons' yes

# Указывает Pure `git fetch` только для upstream-ветки для ускорения.
zstyle :prompt:pure:git:fetch only_upstream yes

# Примеры настроек для плагина fzf-tab (закомментировано).
# https://github.com/Aloxaf/fzf-tab/wiki/Configuration
# zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
# zstyle ':fzf-tab:*' accept-line enter

# Включает "ленивую" загрузку nvm для ускорения старта zsh.
zstyle ':omz:plugins:nvm' lazy yes
