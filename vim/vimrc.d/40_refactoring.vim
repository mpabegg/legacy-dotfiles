" Rename in scope
function! AskForRenameTarget()
    call inputsave()
    let @z=input("Rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
" apparently the following only works for JS
"nmap <Leader>rs "zyiw:call AskForRenameTarget()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x
" replaced with the following
"nmap <Leader>rs "zyiw:call AskForRenameTarget()<cr>mx:silent! norm gd<cr>[%V]%:s/<C-R>//<c-r>z/g<cr>`x
" or the following for matlab
nmap <Leader>rs "zyiw:call AskForRenameTarget()<cr>mx:silent! norm gd<cr>[%V]%:s/<C-R>//<c-r>z/g<cr>`x

