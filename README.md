# My Dotfiles

## Usage

Добавляем alias:

```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Клонируем репозиторий:

```zsh
git clone --bare git@github.com:s3rgeym/dotfiles.git $HOME/.dotfiles
```

Отключаем вывод untracked files:

```zsh
dotfiles config --local status.showUntrackedFiles no
```

Развертывание на новой машине:

```zsh
dotfiles checkout
```
