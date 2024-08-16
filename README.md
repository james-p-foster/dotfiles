# dotfiles

## Requirements

In your `~/.bashrc`, ensure that you are checking for the existence of everyone of these dotfiles, e.g., for `.bash_aliases` and `.bash_functions`, your `~/.bashrc` might have something like:
```bash
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
```
```bash
if [ -f ~/.bash_functions ]; then
	. ~/bash_functions
fi
```

## Install

1. `git clone` this repository to wherever you like, but probably your home directory.
2. In your home directory, create symlinks to to the files in this repository so that your `~/.bashrc` can load them.

For example, if we have cloned the repository to `~`, then we create symlinks by doing the following:
```bash
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
```
```bash
ln -s ~/dotfiles/.bash_exports ~/.bash_exports
```
```bash
ln -s ~/dotfiles/.bash_functions ~/.bash_functions
```
