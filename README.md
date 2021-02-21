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

Все сервисы, необходиме мне для работы, я запускаю через docker чтобы не засирать систему всяким говном и не ебаться с установкой скриптов.

Автозапуск:

```zsh
$ systemctl --user enable --now docker-compose@default
```

Где `@default` имя конфига, содержащего переменные окружения, сам конфиг `docker-compose/default.env`.

Systemd-юниты:

```
config/systemd/user/docker-compose@.service
config/systemd/user/docker-compose@.timer
```

## Галерея

### Gnome Terminal

![image](https://user-images.githubusercontent.com/12753171/108596051-98731e00-7393-11eb-94bd-71d655c88149.png)

### Vim

![image](https://user-images.githubusercontent.com/12753171/108596258-e2103880-7394-11eb-9249-bb4a5be9e007.png)

### Pet

Менеджер сниппетов для терминала. Вызывается по `^S`.

![image](https://user-images.githubusercontent.com/12753171/108596508-9199da80-7396-11eb-97ca-ddbdf46b7904.png)

![image](https://user-images.githubusercontent.com/12753171/108596568-ea697300-7396-11eb-9790-550f4818f834.png)

### [PGAdmin](http://localhost:5050)

![image](https://user-images.githubusercontent.com/12753171/108596104-ea1ba880-7393-11eb-83bb-15a5dfdaf343.png)

### [Локальная Wiki](http://localhost:30001)

Требуется подключиться к postgres (`postgres:secret@localhost:54321`, в интерфейсе pgadmin нужно указывать хост `postgres` и порт `5432`) и создать базу wiki.

![image](https://user-images.githubusercontent.com/12753171/108614454-9e0c4a80-740b-11eb-98f4-2af79c547e05.png)
