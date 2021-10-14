# Dotfiles

## Installation

Use
```
git clone --recursive git@github.com:nathanmusoke/dotfiles.git
```
to clone the repository and submodules.

Use stow to symlink files to the appropriate locations. For example, to install
git configuration:
```
stow git
```

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
