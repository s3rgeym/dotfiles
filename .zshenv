typeset -U path
path=(~/.local/bin ~/bin $path[@])

export MYVIMRC=~/.vimrc
export EDITOR="vim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export TERMINAL="gnome-terminal"
export BROWSER="google-chrome-stable"
export ELECTRON_TRASH="gio trash"
#export STARSHIP_CONFIG=~/.starship/config.toml
