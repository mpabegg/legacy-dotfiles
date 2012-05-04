# Additional functionality for the git prompt with support to exclude some git folders
# from showing too much info (too slow for big repositories).

# Consult ~/.zsh-git-prompt-ignore to determine if prompt should include
# more detailed info about the git repo
function sgeb_git_detailed_prompt() {
    local cur_dir=$(pwd)
    local ign_file="$HOME/.zsh-git-prompt-ignore"

    grep "^${cur_dir}/\?\$" "${ign_file}" >/dev/null 2>&1 && return false
    return true
}

# Get the name of the branch we are on, possibly without the dirty state
function sgeb_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}"
  if sgeb_git_detailed_prompt; then
    echo -n "$(parse_git_dirty)"
  fi
  echo "$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
