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
if [[ "$(uname -r)" =~ .*[Uu][Bb][Uu][Nn][Tt][Uu].* ]]
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

# Specify a visual editor in environment variables
export VISUAL="vim"

# Use git-completion.bash so that git has autocomplete
if [ -f ~/git-completion.bash ]; then source ~/git-completion.bash; fi

# Enable pandoc bash completion
if hash pandoc; then
    eval "$(pandoc --bash-completion)"
fi


#################################################
## Automatically start SSH agent at launch (if not on Ubuntu).
## https://confluence.atlassian.com/pages/viewpage.action?pageId=277252540
if [[ ! "$(uname -r)" =~ .*[Uu][Bb][Uu][Nn][Tt][Uu].* ]]
    then
        SSH_ENV=$HOME/.ssh/environment
           
        # start the ssh-agent
        function start_agent {
            echo "Initializing new SSH agent..."
            # spawn ssh-agent
            /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
            echo succeeded
            chmod 600 "${SSH_ENV}"
            . "${SSH_ENV}" > /dev/null
            /usr/bin/ssh-add
        }
           
        if [ -f "${SSH_ENV}" ]; then
             . "${SSH_ENV}" > /dev/null
             ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
                start_agent;
            }
        else
            start_agent;
        fi
fi
#################################################

# add ~/bin to PATH
PATH=$HOME/bin:$PATH

# add anaconda to PATH
PATH=$HOME/anaconda3/bin:$PATH

# Display system info.
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
