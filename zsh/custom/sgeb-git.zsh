# Support for different levels of git information on the zsh prompt.
# The levels are:
# - 0 for normal directories (not a git repository)
# - 1 for git repositories with limited info (full info is too slow
#   for big repositories). Adding the path of a repository to
#   ~/.zsh-git-quick-prompt (one per line) enables this level.
# - 2 for git repositories with full info (default for git repositories)

# Consult ~/.zsh-git-quick-prompt to return level
function sgeb_git_prompt_level() {
    local ign_file="$HOME/.zsh-git-quick-prompt"
    local dir="${1:-$(pwd)}"

    [ "$dir[1]" != "/" ] && dir="$(pwd)/$dir"
    
    if ! $(cd $dir 2>/dev/null && git symbolic-ref HEAD 1> /dev/null 2>&1); then
        echo "0"
        return
    fi

    if grep "^${dir%/}/\?\$" "${ign_file}" >/dev/null 2>&1; then
        echo "1"
        return
    fi

    echo "2"
    return
}

# Print the name of the branch we are on. Also print the dirty state depending
# on the git prompt level.
function sgeb_git_prompt_info() {
    local lvl=$(sgeb_git_prompt_level)

    [ "$lvl" = "0" ] && return

    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}"
    if [ "$lvl" = "2" ]; then
        echo -n "$(parse_git_dirty)"
    else
        echo -n "$ZSH_THEME_GIT_PROMPT_STATE_NA"
    fi
    echo "$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
