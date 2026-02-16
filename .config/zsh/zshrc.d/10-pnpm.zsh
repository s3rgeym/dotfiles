#!/bin/zsh
# Устанавливаем переменную PNPM_HOME
export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm"

# Проверяем, есть ли такой путь в массиве PATH, и добавляем, если нет
# (флаг -U в zsh автоматически удаляет дубликаты в путях)
typeset -gU path
path=("$PNPM_HOME" $path)
