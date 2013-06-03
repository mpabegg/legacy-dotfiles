# Unalias commands defined by prezto
unalias d 2>/dev/null

alias reload!='. ~/.zshrc'
alias dns-flush="sudo killall -HUP mDNSResponder"
alias alias-search="alias | grep -i"

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
