#alias rm='rm -i'
alias cp='cp --reflink=auto --sparse=always'

alias :q='exit'
alias cls='clear'
alias reload='exec $SHELL -l'
alias zshrc='$EDITOR ~/.zshrc && source ~/.zshrc'
alias vimrc='$EDITOR $MYVIMRC'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
#alias yay='paru'
#alias ack='ag'
alias emacs='emacs -nw'

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
