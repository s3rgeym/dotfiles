alias :q='exit'
alias cls='clear'
alias reload-shell='exec $SHELL -l'
alias edit-zshrc='$EDITOR ~/.zshrc && . ~/.zshrc'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# docker
# stop all containers
alias docker-stop='docker stop $(docker ps -a -q)'
# remove all containers
alias docker-rma='docker rm $(docker ps -a -q)'
# remove all images
alias docker-rmi='docker rmi $(docker images -a -q)'
# remove all volumes
alias docker-rmv='docker volume rm $(docker volume ls -q)'
# remove all networks
alias docker-rmn='docker network rm `docker network ls -q`'
alias docker-clean-all='docker-stop; docker-rma; docker-rmi; docker-rmv; docker-rmn'
alias docker-clean-unused='docker system prune --all --force --volumes' 
alias compose='docker-compose'
alias docker-logs='docker logs -f'
alias compose-logs='compose logs -f'

