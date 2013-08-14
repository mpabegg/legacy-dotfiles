# Unalias commands defined by prezto
unalias d 2>/dev/null

alias dns-flush="sudo killall -HUP mDNSResponder"
alias als="alias | grep -i --"

# Basic directory operations
alias pu='pushd'
alias po='popd'
alias -- -='cd +1'

# List direcory contents
alias l='ls -lAh'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

# Git related
# alias gs='git status -sb'
# alias ga='git add'
# alias gaa='git add -A'
alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short --branch'
alias gwm='git mv'

# Delete branch from remote origin
alias gpx='git push origin --delete'

# Git svn aliases (gv.)
alias gvr='git svn rebase'
alias gvd='git svn dcommit'
alias gvf='git svn fetch'
alias gvi='git svn info'
