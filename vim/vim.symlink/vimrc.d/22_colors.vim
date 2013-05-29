syntax enable "Enable syntax hl

" Set font according to system
"if MySys() == "mac"
"  set gfn=Menlo:h14
"  set shell=/bin/bash
"elseif MySys() == "windows"
"  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
"elseif MySys() == "linux"
"  set gfn=Monospace\ 10
"  set shell=/bin/bash
"endif

if has("gui_running")
    " set background=light
    set background=dark
else
    " termcolors=256 is only needed if the terminal itself is not using the
    " solarized theme, the solarized colors will then be approximated in vim
    "let g:solarized_termcolors=256
    set background=dark
endif

let g:solarized_visibility="high"
colorscheme solarized
