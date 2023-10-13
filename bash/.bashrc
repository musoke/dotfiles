#
# ~/.bashrc
#

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Some commands from Ubuntu's default .bashrc; shall understand them later.
if [[ "$(uname -v)" =~ .*[Uu][Bb][Uu][Nn][Tt][Uu].* ]]
    then
        source ~/.bashrc_ubuntu
fi

# Change the prompt
PS1='[\[$(tput bold)$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput bold)$(tput setaf 2)\]\h\[$(tput sgr0)\] \[$(tput bold)$(tput setaf 4)\]\W\[$(tput sgr0)\]] \$ '

# Specify an editor in environment variables
export EDITOR="vim"

# Specify a visual editor in environment variables
export VISUAL="vim"

# Set RUST_SRC_PATH for RLS
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# Julia default threads
export JULIA_NUM_THREADS=auto

# Load any supplementary scripts
# Includes aliases, etc
for config in "$HOME"/.bashrc.d/*.bash ; do
    [[ -e "$config" ]] && source "$config"
done
unset -v config

# Enable various bash completion
if [ -f ~/.git-completion.bash ]; then source ~/.git-completion.bash; fi
if [ -f ~/.beets-completion.bash ]; then source ~/.beets-completion.bash; fi
if [ -f ~/.pandoc-completion.bash ]; then source ~/.pandoc-completion.bash; fi
if [ -f ~/.rustup-completion.bash ]; then source ~/.rustup-completion.bash; fi
if [ -f ~/.bash_completion.d/julia-completion.bash ]; then source ~/.bash_completion.d/julia-completion.bash; fi

for comp in "$HOME"/.bash_completion.d/*.bash-completion ; do
    [[ -e "$comp" ]] && source "$comp"
done
unset -v comp
