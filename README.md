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

Все сервисы, необходиме мне для работы, я запускаю через docker чтобы не засирать систему всяким говном и не ебаться с установкой и настройкой этого говна.

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

## Внутренние веб-сервисы

* [Wiki](http://wiki.localhost).
* [PGAdmin](http://pgadmin.localhost).
* [Mongo Express](http://mongo-express.localhost).

Чтобы эти ссылки заработали нужно изменить `/etc/hosts`:

```hosts
127.0.0.1 localhost wiki.localhost pgadmin.localhost mongodb-express.localhost
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

### [PGAdmin](http://pgadmin.localhost)

![image](https://user-images.githubusercontent.com/12753171/108596104-ea1ba880-7393-11eb-83bb-15a5dfdaf343.png)

### [Локальная Wiki](http://wiki.localhost)

Требуется подключиться к postgres (`postgres:secret@localhost:54321`, в интерфейсе pgadmin нужно указывать хост `postgres` и порт `5432`) и создать базу wiki.

![image](https://user-images.githubusercontent.com/12753171/108618434-2c45f800-742f-11eb-9d01-3363fd6c2a57.png)
