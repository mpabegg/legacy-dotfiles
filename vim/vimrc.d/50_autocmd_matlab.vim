" Set mlint as default compiler for matlab files (run with :make)
autocmd BufEnter *.m compiler mlint

"autocmd BufEnter *.m    map <M-n> :cnext<CR> 
"autocmd BufEnter *.m    map <M-p> :cprevious<CR> 
"
"autocmd BufLeave *.m    unmap <M-n> 
"autocmd BufLeave *.m    unmap <M-p> 

autocmd BufEnter *.m set commentstring=\%\ %s

" Add the MATLAB stock functions to ctags
" Requires that the tags file was previously generated
" by hand:
" ctags --langdef=matlab --langmap=matlab:.m --regex-matlab='/^[ \t]*function([] A-Za-z0-9,_[]+=[ ]?|[ ]+)([^.(]+).*$/\2/f,function/' -R .

autocmd BufEnter *.m set tags+=/Applications/MATLAB_R2011a.app/toolbox/tags
autocmd BufLeave *.m set tags-=/Applications/MATLAB_R2011a.app/toolbox/tags

" autocmd FileType matlab match LineTooLong /\%80v./

let tlist_matlab_settings  = 'matlab;f:functions'
