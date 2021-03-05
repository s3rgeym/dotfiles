alias rm='rm -i'
alias cp='cp --reflink=auto --sparse=always'

alias :q='exit'
alias cls='clear'
alias rel='exec $SHELL -l'
alias zshrc='$EDITOR ~/.zshrc && . ~/.zshrc'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# stop all containers
alias docker-stop='docker stop $(docker ps -a -q)'
# remove all containers
alias docker-rm='docker rm $(docker ps -a -q)'
# remove all images
alias docker-rmi='docker rmi $(docker images -a -q)'
# remove all volumes
alias docker-rmv='docker volume rm $(docker volume ls -q)'
alias docker-clean-all='docker-stop; docker-rm; docker-rmi; docker-rmv;'
alias docker-clean-unused='docker system prune --all --force --volumes' 
alias compose='docker-compose'
alias docker-logs='docker logs -f'
alias compose-logs='compose logs -f'
alias compose-edit='$EDITOR ${COMPOSE_FILE:-docker-compose.yml}'
