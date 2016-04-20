# Dotfiles

## Installation

Use 
```
git clone --recursive git@github.com:nathanmusoke/dotfiles.git
```
to clone the repository and submodules.

There is a script `install.sh` included which will create symlinks from `~` to the dotfiles.
Note that this will __overwrite existing files__ in `~`.
At this point it also needs to be run from the root of the git repository.


## Vim

I use [Pathogen](https://github.com/tpope/vim-pathogen) to manage Vim plugins.
To initialize them (if `--recursive` not used when cloning), use
```
git submodule update --init --recursive
```
To add a new plugin,
```
cd dotfiles/.vim
git submodule add https://github.com/foo/bar.git bundle/bar
```
To update one plugin,
```
git submodule update --remote path/to/plugin/
```
To update all plugins,
```
git submodule update --remote
```
Adding a tilde to the end of the directory containing a bundle will cause it to be ignored by Pathogen.
