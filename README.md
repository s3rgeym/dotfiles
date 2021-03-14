# Dotfiles

## Install

Add alias:

```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Disable git status **untracked files**:

```zsh
dotfiles config --local status.showUntrackedFiles no
```

Fetch files:

```zsh
git clone --bare git@github.com:s3rgeym/dotfiles.git $HOME/.dotfiles
dotfiles checkout
```

## Screenshots

![image](https://user-images.githubusercontent.com/12753171/111078739-109eb080-8508-11eb-86a1-e7e873aceccb.png)
![image](https://user-images.githubusercontent.com/12753171/111075772-91ef4680-84fa-11eb-862f-fd90cddea648.png)
