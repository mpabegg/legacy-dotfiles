" Vundle stuff, install automatically if not available

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

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" more bundles
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'sgeb/vim-matlab'
Bundle 'ibbo/mlint.vim'
Bundle 'djoshea/vim-matlab-fold'
Bundle 'ervandew/supertab'

"Bundle 'rstacruz/sparkup'
"Bundle 'wincent/Command-T'
"Bundle 'altercation/vim-colors-solarized'

if isVundleFirstInstall == 1
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

unlet isVundleFirstInstall

filetype plugin indent on
