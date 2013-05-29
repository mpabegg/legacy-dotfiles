" Hardmode is currently disabled, hence this file is commented out


" " Enable HardMode by default
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" " Toggle HardMode/EasyMode with <leader>h
" nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" " Function to toggle advanced/wannabe hardmode level
" " advanced will also disable hjkl and -/+, wannabe won't
" fun! ToggleHardModeLevel()
"     if g:HardMode_level == 'advanced'
"         let g:HardMode_level = 'wannabe'
"     else
"         let g:HardMode_level = 'advanced'
"     end

"     let l:HardMode_echo = g:HardMode_echo
"     let g:HardMode_echo = 0

"     call ToggleHardMode()
"     call ToggleHardMode()

"     let g:HardMode_echo = l:HardMode_echo
"     echo "HardMode Level:" g:HardMode_level
" endfun

" " Toggle advanced/wannabe hardmode with <leader>H
" nnoremap <leader>H <Esc>:call ToggleHardModeLevel()<CR>
