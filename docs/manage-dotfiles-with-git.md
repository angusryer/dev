# Manage dotfiles with git

Based on a [Hacker News solution proposed by StreakyCobra](https://news.ycombinator.com/item?id=11070797)

## Starting from scratch

```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
```

Add the alias to your .zshrc (or .bashrc) if it doesn't already exist.

## Replicate environment on a machine

```
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

## Gotchas

1. If you already have some of the files in the `$HOME` directory you will get an error message. You can either (1) delete them or (2) back them up somewhere else.
2. If you are cloning the repo and using submodules in a `.vim` directory you will need to run `dotfiles submodule update --init` regardless of whether you included the `--recurse-submodules` option when cloning.

## Usage

Any file in the home folder can now be versioned with normal git commands like:

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles push
```

