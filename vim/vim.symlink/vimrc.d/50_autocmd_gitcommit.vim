" Wrap git commit messages at 72 characters
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set foldmethod=syntax

" I like to get back to the position where I last left a file, but not for
" commit messages. I always want to start commit messages at the very first
" character.
autocmd BufUnload .git/COMMIT_EDITMSG exe "normal gg"
