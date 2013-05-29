#!/usr/bin/env bash
#
# Setup dotfiles

DOTFILES_ROOT="$HOME/usr/dotfiles"

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
        info "cloning sgeb/dotfiles-public.git to $DOTFILES_ROOT"
        git clone -q https://github.com/sgeb/dotfiles-public.git $DOTFILES_ROOT
    else
        success "skipped cloning sgeb/dotfiles.git to $DOTFILES_ROOT"
    fi
}

setup_gitconfig () {
    if ! [ -f git/gitconfig.symlink ]
    then
        info 'setup gitconfig'

        user ' - What is your github author name?'
        read -e git_authorname
        user ' - What is your github author email?'
        read -e git_authoremail

        sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" git/gitconfig.symlink.example > git/gitconfig.symlink

        success 'gitconfig'
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

        if [ -f $dest ] || [ -d $dest ]
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

clone_dotfiles
# setup_gitconfig
install_dotfiles_symlinks

# If we are on a mac, lets install and setup homebrew
if [ "$(uname -s)" == "Darwin" ]
then
    . osx/setup.shlib
    # info "installing dependencies"
    # if . bin/dot > /tmp/dotfiles-dot 2>&1
    # then
    #     success "dependencies installed"
    # else
    #     fail "error installing dependencies"
    # fi
fi

echo ''
echo '  All installed!'
