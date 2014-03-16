# keybindings and other goodness

# alt+s to prepend 'sudo ' to current command and move to EOL
bindkey -s '\es' '^Asudo ^E'

# alt+d to show current working directory
bindkey -s '\ed' '^Upwd^M'

# alt+u to move to parent directory and list it
bindkey -s '\eu' '^Ucd ..; ls^M'

# alt+U to move to parent directory
bindkey -s '\eU' '^Ucd ..^M'

# If AUTO_PUSHD is set, alt+p pops the dir stack
bindkey -s '\ep' '^Upopd >/dev/null; dirs -v^M'

# alt+P shows the dir stack
bindkey -s '\eP' '^Udirs -v^M'

# alt+l: execute 'ls'
bindkey -s '\el' '^Uls^M'

# alt+L: execute 'ls -lhA'
bindkey -s '\eL' '^Uls -lhA^M'

# alt+v: pipe current command to view
bindkey -s '\ev' '^E 2>&1 | view -^M'

# alt+g: execute 'git status'
bindkey -s '\eg' '^Ugws^M'

# alt+G: execute 'git status .'
bindkey -s '\eG' '^Ugws .^M'

# control+j: add new-line for multi-line edits in zle (needs exception for midnight commander)
if [[ "$MC_SID" != "" || "$MC_CONTROL_PID" != "" ]]; then
    bindkey "^J" accept-line
else
    bindkey "^J" self-insert
fi

# alt+.: insert last argument of previous command
bindkey '\e.' insert-last-word
