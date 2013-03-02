" Enable HardMode by default
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Toggle HardMode/EasyMode with <leader>h
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Set level, 'advanced' will also disable hjkl and -/+, 'wannabe' won't
let g:HardMode_level = 'advanced'
