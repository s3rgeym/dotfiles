# Переменные окружения оболочки
# ~/.zprofile в отличие от ~/.zshenv выполняется только при логине через
# консоль или ssh.
# Системные переменные задаются в /etc/environment либо в /etc/profile и /etc/profile.d, но тогда они доступны только после входа.
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
