# Unalias shadows
unalias d

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
