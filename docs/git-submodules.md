# Using git-submodules to version-control Vim plugins

It's a good idea to keep the `.vim` directory version-controlled along with your `.vimrc`. However, if the directory contains plugins that are versioned from their respective git repositories, you will need to use git submodules.

## Setup

To enable submodules:

```sh
cd ~/.vim
git submodule init
```

## Installing plugins

To install plugins using Vim 8's native package system run:

```sh
git submodule add <package-url> <desired-filepath>

# for example
git submodule add https://github.com/username/reponame.git pack/plugins/start/reponame
```

## Removing plugins

To remove `reponame`:

```sh
cd ~/.vim
git submodule deinit pack/plugins/start/reponame
git rm -r pack/plugins/start/reponame
rm -r .git/modules/pack/plugins/start/reponame
```

## Updating plugins:

To update an individual plugin:

```sh
cd ~/.vim/pack/plugins/start/reponame
git pull origin master
```

To update all plugins:

```sh
cd ~/.vim
git submodule foreach git pull origin master
```
**Note that new commits to plugins create uncommitted changes in the main repository. Thus, after any updates in the submodules, you need to commit the main repository as well.**

## Replicating the repository on a machine

Clone the repository recursively to clone plugins:

```sh
git clone --recursive-submodules https://github.com/your_username/your_reponame.git
```
