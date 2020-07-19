typeset -U path
path=(~/.local/bin ~/bin $path[@])

export BROWSER=chromium
export EDITOR=vim
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export SYSTEMD_EDITOR="$EDITOR"
export TERMINAL=konsole
export ELECTRON_TRASH=kioclient5 code
# Требуется для Python, установленного через pyenv, для компиляции YCM при
# установке YouCompleteMe
export PYTHON_CONFIGURE_OPTS="--enable-shared"
# Нужно для Go
export GOO111MODULE=on
# Решение проблемы с масштабированием интерфейса java-приложений, написанных на
# Swing
# -Dsun.java2d.uiScale=2 - для масштабирования интерфейса, остальное с вики
# скопипастил
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.uiScale=2"
