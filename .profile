#
# ~/.profile
#

## Set PATH

PATH=$PATH:$HOME/.local/bin

# add ~/bin to PATH
PATH=$PATH:$HOME/bin

# add cargo to PATH
PATH=$PATH:$HOME/.cargo/bin

# add ruby gems to path
if hash ruby; then
    PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi

export PATH
