let g:ctrlp_map = '<leader>f'
nnoremap <Leader>d :CtrlPBuffer<CR>

" search only on filename, ignore directory names
let g:ctrlp_by_filename = 1

" enable regexp search by default
let g:ctrlp_regexp = 1

" enable the native matching extension (much faster)
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Unlimited number of files
let g:ctrlp_max_files = 0
