" Set mlint as default compiler for matlab files (run with :make)
autocmd BufEnter *.m compiler mlint

"autocmd BufEnter *.m    map <M-n> :cnext<CR> 
"autocmd BufEnter *.m    map <M-p> :cprevious<CR> 
"
"autocmd BufLeave *.m    unmap <M-n> 
"autocmd BufLeave *.m    unmap <M-p> 

autocmd BufEnter *.m set commentstring=\%\ %s
