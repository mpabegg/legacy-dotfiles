syntax enable "Enable syntax hl
colorscheme twilight

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
  " set t_Co=256
  set background=dark
  "colorscheme peaksea
  set nonu
else
  "colorscheme default
  "set background=dark

  set nonu
endif
