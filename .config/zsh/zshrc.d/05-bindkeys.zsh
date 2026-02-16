#!/bin/zsh
# Плагины часто переназначают клавиши, поэтому сочетания должны назначаться
# только после загрузки плагинов.

# Редактирование командной строки
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Поиск по подстроке через zsh-history-substring-search при нажатии стрелок вверх/вниз.
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
