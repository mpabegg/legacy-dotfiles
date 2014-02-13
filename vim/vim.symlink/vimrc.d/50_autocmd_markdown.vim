" Stolen from https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink
" Thanks to @pengwynn

" Highlight words to avoid in tech writing
" =======================================
"
"   obviously, basically, simply, of course, clearly,
"   just, everyone knows, However, So, easy

"   http://css-tricks.com/words-avoid-educational-writing/

" highlight TechWordsToAvoid ctermbg=red guibg=red ctermfg=white guifg=white
function MatchTechWordsToAvoid()
    " match TechWordsToAvoid ....
    match ErrorMsg /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction
autocmd FileType markdown call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()
