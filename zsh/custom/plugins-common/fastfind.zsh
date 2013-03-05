myfind() {
  FFOUND_PWD=${PWD}
  eval "FFOUND=($(find "$PWD" -iname "*$2*" -type "$1" | sed -e 's/.*/"&"/'))"
  print_found
}

print_found() {
  local length=${#FFOUND[*]}

  local index=1
  while [ "$index" -le "$length" ]; do
    if [ -t 1 ]; then printf "% 4d " $index; fi
    fn $index
    index=$((index + 1))
  done
}

ff() { myfind "f" "$1"; }

fd() { myfind "d" "$1"; }

fn() {
  item=${FFOUND[$1]}
  if [ -z "$item" ]; then return; fi
  if [ "$PWD" != "$FFOUND_PWD" ]; then echo -n $FFOUND_PWD/; fi
  echo ${item##$FFOUND_PWD/}
}

fvi() { vi "$(fn $1)";  }

fcd()
{
    FN=$(fn $1);
    [ ! -d "$FN" ] && FN=$(dirname $FN);
    cd "$FN";
}

fcat() { cat "$(fn $1)"; }

fl() { print_found; }
