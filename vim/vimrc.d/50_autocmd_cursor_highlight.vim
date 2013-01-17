" Highlights the current cursor line, only in the active window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Highlights the current cursor column, only in the active window
" augroup CursorColumn
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
"   au WinLeave * setlocal nocursorcolumn
" augroup END

