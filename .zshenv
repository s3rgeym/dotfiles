# загружается единожды при логине
# ~/.zprofile в отличие от ~/.zshenv загружается только при логине через
# консоль или ssh
typeset -U path
path=(~/.local/bin ~/bin $path[@])

export BROWSER="chromium"
export EDITOR="vim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export TERMINAL="gnome-terminal"
export ELECTRON_TRASH="gio trash"

# Решение проблемы с масштабированием интерфейса java-приложений, написанных на
# Swing
# -Dsun.java2d.uiScale=2 - для масштабирования интерфейса, остальное с вики
# скопипастил
# export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.uiScale=2"

# Отключаем автоматическое масштабирование интерфейса
# export QT_AUTO_SCREEN_SCALE_FACTOR=0
# вынес в /etc/environment
