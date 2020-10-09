# Переменные окружения оболочки
# ~/.zprofile в отличие от ~/.zshenv выполняется только при логине через
# консоль или ssh.
# Системные переменные можно задать в /etc/environment, /etc/profile, /etc/profile.d/*. Переменные заданные в /etc/profile доступны только при логине.
typeset -U path
path=(~/.local/bin ~/bin $path[@])

export BROWSER="chromium"
export EDITOR="vim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export TERMINAL="tilix"
export ELECTRON_TRASH="gio trash"
