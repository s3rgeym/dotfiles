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

antidote_dir="${ZDOTDIR}/.antidote"
if [[ ! -d $antidote_dir ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi

# Обновление всех плагинов: `antidote update`
source "${antidote_dir}/antidote.zsh"
antidote load "${ZDOTDIR}/.zsh_plugins.txt"
