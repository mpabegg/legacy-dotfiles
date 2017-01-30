#!/usr/bin/env bash
#
# Setup dotfiles

DOTFILES_ROOT="$HOME/.dotfiles"

set -e

echo ''

info () {
    printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
    printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit 1
}

clone_dotfiles () {
    if ! [ -d $DOTFILES_ROOT ]
    then
        info "cloning mpabegg/dotfiles.git to $DOTFILES_ROOT"
        git clone --recursive -q https://github.com/mpabegg/dotfiles.git $DOTFILES_ROOT
        success "cloned mpabegg/dotfiles.git to $DOTFILES_ROOT"

        # Execute the local script to get an interactive stdin script
        exec $DOTFILES_ROOT/setup.sh
    fi
}

copy_file () {
    cp "$1" "$2"
    success "copied $1 to $2"
}

link_files () {
    ln -s "$1" "$2"
    success "linked $1 to $2"
}

install_dotfiles_symlinks () {
    info 'installing dotfiles'

    overwrite_all=false
    backup_all=false
    skip_all=false

    for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
    do
        dest="$HOME/.`basename \"${source%.*}\"`"

        if [ -f $dest -o -d $dest -o -L $dest ]
        then

            overwrite=false
            backup=false
            skip=false

            if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
            then
                user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac
            fi

            if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
            then
                rm -rf $dest
                success "removed $dest"
            fi

            if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
            then
                mv $dest $dest\.backup
                success "moved $dest to $dest.backup"
            fi

            if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
            then
                link_files $source $dest
            else
                success "skipped $source"
            fi

        else
            link_files $source $dest
        fi

    done
}

install_homebrew () {
  if [ "$(uname -s)" == "Darwin" ]
  then
    if test ! $(which brew)
    then
      echo "  Installing Homebrew for you."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
  fi
}

setup_zsh () {
  brew install zsh
  sudo -- sh -c "echo `which zsh` >> /etc/shells"
  chsh -s `which zsh`
}

run_installers () {
  find . -maxdepth 2 -name install.sh | while read installer ; do sh -c "${installer}" ; done
}

clone_dotfiles
install_dotfiles_symlinks
install_homebrew
setup_zsh
run_installers

# If we are on a mac, lets install and setup homebrew
#if [ "$(uname -s)" == "Darwin" ]
#then
#    # . osx/setup.sh
#    # info "installing dependencies"
#    # if . bin/dot > /tmp/dotfiles-dot 2>&1
#    # then
#    #     success "dependencies installed"
#    # else
#    #     fail "error installing dependencies"
#    # fi
#fi

echo ''
echo '  All installed!'
echo '  Log out for the changes to take effec'
