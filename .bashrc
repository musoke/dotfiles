#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# Bash aliases are found in ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash functions are found in ~/.bash_functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Specify an editor in environment variables
export EDITOR="vim"

# Specify a visual editor in environment variables
export VISUAL="vim"

# Use git-completion.bash so that git has autocomplete
if [ -f ~/.git-completion.bash ]; then source ~/.git-completion.bash; fi

# Use beets-completion.bash
if [ -f ~/.beets-completion.bash ]; then source ~/.beets-completion.bash; fi

# Use pandoc-completion.bash
if [ -f ~/.pandoc-completion.bash ]; then source ~/.pandoc-completion.bash; fi


# Display system info.
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
