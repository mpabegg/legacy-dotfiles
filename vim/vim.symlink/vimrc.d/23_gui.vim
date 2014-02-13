if has("gui_running") == 0
    finish
endif

" Hide toolbar
set guioptions-=T

" Hide right and left scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Disable blinking cursor
set gcr=a:blinkon0
