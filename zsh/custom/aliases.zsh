### Shared functions/aliases

# Sorted output for `du -sh`
function du_sorted {
    du -sk "$@" | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
}

unalias d
function d()
{
    declare -A aliases
    aliases["g"]="$HOME/dev/gap/gid/"
    aliases["gs"]="$HOME/dev/gap/svn/"
    aliases["bb"]="$HOME/dev/gap/brazil-build/"

    cd ${aliases["${1:-g}"]}
    pwd
}

alias habits='\history -500 -1 | sed "s/^[[:space:]]*[0-9]*[[:space:]]*//" | sort | uniq -c | sort -n -r | head -n 10'

alias g=git

### PS-GAP related functions

if [[ "$HOST" == "ecomsoa" ]]; then
fi

function gg {
    if [[ "$HOST" == "ecomsoa" ]]; then
        cd ~/serge/dev/gid
    else
        cd ~/dev/gap/gid
    fi
}

function gs {
    cd ~/dev/gap/svn
}
