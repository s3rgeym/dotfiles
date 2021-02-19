alias :q='exit'
alias cls='clear'
alias reload-shell='exec $SHELL -l'
alias edit-zshrc='$EDITOR ~/.zshrc && . ~/.zshrc'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '
