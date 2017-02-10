#
# ~/.profile
#

## Set PATH

# add ~/bin to PATH
PATH=$PATH:$HOME/bin

# add anaconda to PATH
PATH=/opt/anaconda/bin:$PATH
PATH=$HOME/anaconda3/bin:$PATH

# add cargo to PATH
PATH=$PATH:$HOME/.cargo/bin

# add ruby gems to path
if hash ruby; then
    PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
fi

export PATH
