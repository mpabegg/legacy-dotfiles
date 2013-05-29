# Prepend all directories in $ZSH/zsh/functions to the fpath
fpath=($ZSH/zsh/functions/**/ $fpath)

# Autoload all files in $ZSH/zsh/functions
autoload -U $ZSH/zsh/functions/**/*(.:t)
