" Vundle preflight stuff, install automatically if not available

filetype on   " required by OSX
filetype off

let isVundleFirstInstall=0
if !filereadable(expand('~/.vim/bundle/vundle/README.md'))
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let isVundleFirstInstall=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

