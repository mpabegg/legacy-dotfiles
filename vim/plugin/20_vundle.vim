" Vundle stuff, install automatically if not available

filetype off

let vundleFirstInstall=0
if !filereadable(expand('~/.vim/bundle/vundle/README.md'))
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundleFirstInstall=1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" more bundles
Bundle 'L9'
Bundle 'FuzzyFinder'

"Bundle 'Syntastic' "uber awesome syntax and errors highlighter
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'https://github.com/tpope/vim-fugitive'

if vundleFirstInstall == 1
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

unlet vundleFirstInstall

filetype plugin indent on
