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

```zsh
$ sudo ln -sf ~/docker-compose/dev/docker-compose-dev@.service /etc/systemd/system
$ sudo systemctl enable --now docker-compose-dev@$USER 
```

## Внутренние веб-сервисы

* [Wiki](http://wiki.local).
* [PGAdmin](http://pgadmin.local).
* [Mongo Express](http://express.local).
* [Jupyter Notebook](http://notebook.local).

Чтобы эти ссылки заработали нужно добавить строку в `/etc/hosts`:

```hosts
127.0.0.1 wiki.local pgadmin.local express.local notebook.local
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

### [PGAdmin](http://pgadmin.local)

![image](https://user-images.githubusercontent.com/12753171/108596104-ea1ba880-7393-11eb-83bb-15a5dfdaf343.png)

### [Локальная Wiki](http://wiki.local)

Требуется подключиться к postgres (`postgres:secret@localhost:54321`, в интерфейсе pgadmin нужно указывать хост `postgres` и порт `5432`) и создать базу wiki.

![image](https://user-images.githubusercontent.com/12753171/108618434-2c45f800-742f-11eb-9d01-3363fd6c2a57.png)
