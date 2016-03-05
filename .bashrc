#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Make an alias for ls -lhF
alias l='ls -lhF'

# Specify a visual editor in environment variables
export VISUAL="vim"

# Use git-completion.bash so that git has autocomplete
source ~/git-completion.bash



#################################################
## https://confluence.atlassian.com/pages/viewpage.action?pageId=277252540
## Automatically start SSH agent at launch.

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
#################################################

if [ -f /usr/bin/screenfetch ]; then screenfetch; fi
