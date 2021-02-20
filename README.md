# Dotfiles

## Установка

Добавляем alias:

```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Отключаем вывод **untracked files** при вызове `dotfiles status`:

```zsh
dotfiles config --local status.showUntrackedFiles no
```

Развертывание на другой машине:

```zsh
git clone --bare git@github.com:s3rgeym/dotfiles.git $HOME/.dotfiles
dotfiles checkout
```

## Docker-Compose

```zsh
$ systemctl --user enable --now docker-compose@dev
```

[localhost:3000](http://localhost:3000)

![image](https://user-images.githubusercontent.com/12753171/108596014-3f0aef00-7393-11eb-8108-e7937af55aee.png)

## Галерея

 ![image](https://user-images.githubusercontent.com/12753171/108149604-46f13780-70e4-11eb-81a5-57b17851cc03.png)
