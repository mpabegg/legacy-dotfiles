# Prepend all directories in $ZSH/zsh/functions to the fpath
fpath=($ZSH/zsh/functions/**/ $fpath)

# Autoload all files in $ZSH/zsh/functions
autoload -U $ZSH/zsh/functions/**/*(.:t)

# Colorful ls
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ZSH options
setopt PROMPT_SUBST
