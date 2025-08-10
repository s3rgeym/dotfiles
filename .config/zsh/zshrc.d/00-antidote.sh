antidote_dir="${ZDOTDIR}/.antidote"
if [[ ! -d $antidote_dir ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi

# Обновление всех плагинов: `antidote update`
source "${antidote_dir}/antidote.zsh"
antidote load "${ZDOTDIR}/.zsh_plugins.txt"
