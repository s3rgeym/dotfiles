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

![image](https://user-images.githubusercontent.com/12753171/111076015-8cdec700-84fb-11eb-8823-4a98199f14f5.png)
![image](https://user-images.githubusercontent.com/12753171/111075975-5b65fb80-84fb-11eb-819f-009f88a174bf.png)
![image](https://user-images.githubusercontent.com/12753171/111075772-91ef4680-84fa-11eb-862f-fd90cddea648.png)
![image](https://user-images.githubusercontent.com/12753171/111075823-cd8a1080-84fa-11eb-8eb7-7adb3d5483aa.png)
