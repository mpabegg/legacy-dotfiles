# Load all zsh files in plugins-common

for file ($ZSH_CUSTOM/plugins-common/*.zsh(N)); do
    source $file
done
