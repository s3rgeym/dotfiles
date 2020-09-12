# Здесь задаются переменные окружения. Этот сценарий выполняется при входе в
# систему (логине).
# ~/.zprofile в отличие от ~/.zshenv выполняется только при логине через
# консоль или ssh.
# Системные переменные можно задать в /etc/environment. Сценарии /etc/profile
# и /etc/profile.d/* выполняются только при логине.
typeset -U path
path=(~/.local/bin ~/bin $path[@])

export BROWSER="chromium"
export EDITOR="vim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export TERMINAL="tilix"
export ELECTRON_TRASH="gio trash"

# Масштабирование в Qt-приложениях
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=2

# Решение проблемы с масштабированием интерфейса java-приложений, написанных на
# Swing
# -Dsun.java2d.uiScale=2 - для масштабирования интерфейса, остальное с вики
# скопипастил
# export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.uiScale=2"
