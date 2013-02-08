# Quickly change to frequently used directories

unalias d
function d()
{
    declare -A aliases
    aliases["g"]="$HOME/dev/gap/gid/"
    aliases["gs"]="$HOME/dev/gap/svn/"
    aliases["bb"]="$HOME/dev/gap/brazil-build/"
    aliases["bin"]="$HOME/usr/bin/"
    aliases["dotfiles"]="$HOME/usr/dotfiles/"
    aliases["df"]=$aliases["dotfiles"]

    cd ${aliases["${1:-g}"]}
    pwd
}
