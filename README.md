# Dotfiles

Add alias:

```zsh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Disable git status **untracked files**:

```zsh
dotfiles config --local status.showUntrackedFiles no
```

Deployment:

```zsh
git clone --bare git@github.com:s3rgeym/dotfiles.git $HOME/.dotfiles
dotfiles checkout
```

## Screens

![image](https://user-images.githubusercontent.com/12753171/110113124-b1cc8f00-7dc3-11eb-8cb2-bc89b9350cbf.png)
