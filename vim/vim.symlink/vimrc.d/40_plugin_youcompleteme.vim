""""""""""""""""""""""""""""""""""""""""""
"  How to use YouCompleteMe + UltiSnips  "
""""""""""""""""""""""""""""""""""""""""""

" YCM opens by itself after 2 characters. Omnifunc can be opened with
" <C-space> for some filetypes (but will also auto-open after 2 characters).
"
" A few choices to navigate dropdown selections:
" * <C-j> and <C-k>
" * <C-n> and <C-p>
" * <tab> and <s-tab>: these ones are a bit special. They can be used to
"   navigate the dropdown selection up/down, but once the autocomplete text
"   matches a snippet trigger, it will expand that snippet. But great to
"   quickly expand an autocomplete when just one entry.
" <C-e> cancels the autocomplete dropdown selection.
" <tab> expands an UltiSnips snippet.
"
" For select filetypes (C-based files), YouCompleteMe will show errors and
" warnings in the gutter. In these files, <leader>jd can be used to jump to
" the definition or declaration. Usual jumplist navigation is supported (<C-o>
" and <C-i>)

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '~~'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" Jump to definition or declaration
" Supported in filetypes: c, cpp, objc, objcpp, python, cs
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""
"  Integration with UltiSnips  "
""""""""""""""""""""""""""""""""

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
