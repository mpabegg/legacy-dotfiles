" Runs before anything else

" Enable smart vi, must be first because it changes other options as side effect
set nocompatible

" Remove all autocommands, reloading the .vimrc might add duplicates
autocmd!

" set the leader key to be , (comma)
" the default is \ (backslash)
" Setting the leader after defining keymaps will not update these keymaps.
" Plugins often define actions on the leader key, therefore the leader key
" needs to be set before loading any plugins.
let mapleader = ","
let g:mapleader = ","
