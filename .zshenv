typeset -U path
path=(~/.local/bin ~/bin $path[@])

export MYVIMRC=~/.vimrc
export EDITOR="vim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export TERMINAL="konsole"
export BROWSER="chromium"
export ELECTRON_TRASH="gio trash"
#export STARSHIP_CONFIG=~/.starship/config.toml
