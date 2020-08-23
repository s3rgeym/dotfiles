# My Dotfiles

## Usage

Добавляем alias:

```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Развертывание на новой машине:

1) git clone --bare git@github.com:s3rgeym/dotfiles.git $HOME/.dotfiles
2) dotfiles checkout

Отключаем вывод untracked files:
dotfiles config --local status.showUntrackedFiles no

