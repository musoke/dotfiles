# Output of ls should be coloured by default.
alias ls='ls --color=auto'

# Output of grep should be coloured.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Aliases for ls
alias ls='ls --color=auto'
alias l='ls -lhF --color=auto'
alias la='ls -lhFA --color=auto'


## Git
alias gst='git status'
alias gl='git log'
alias glp='git log --patch'
alias glpw='git log --patch --color-words'
alias glg='git log --graph'
alias gd='git diff'
alias gdc='git diff --cached'

## Mutt
alias m='mutt'

alias of='offlineimap'
alias off='offlineimap && offlineimap'


## Rsync
alias rs='rsync --size-only --partial --progress --compress'


## tail
alais tf='tail -f'
