export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if [ -n "$(command -v pyenv)" ]; then
  #echo "Initialize pyenv..." >&2
  eval "$(pyenv init - zsh)"
fi
