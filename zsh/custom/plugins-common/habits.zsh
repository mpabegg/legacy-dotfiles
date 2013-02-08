# Shows more frequent commands

alias habits='\history -50000 -1 | sed "s/^[[:space:]]*[0-9]*[[:space:]]*//" | sort | uniq -c | sort -n -r | head -n 20'

alias habits-cmd='\history -50000 -1 | sed "s/^[[:space:]]*[0-9]*[[:space:]]*\([^[:space:]]*\)[[:space:]].*/\1/" | sort | uniq -c | sort -n -r | head -n 20'


