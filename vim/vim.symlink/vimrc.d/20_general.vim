" Plugins_Included:
"     > minibufexpl.vim - http://www.vim.org/scripts/script.php?script_id=159
"       Makes it easy to get an overview of buffers:
"           info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
"
"     > bufexplorer - http://www.vim.org/scripts/script.php?script_id=42
"       Makes it easy to switch between buffers:
"           info -> :help bufExplorer
"
"     > snipMate.vim - http://www.vim.org/scripts/script.php?script_id=2540
"       Snippets for many languages (similar to TextMate's):
"           info -> :help snipMate
"
"     > mru.vim - http://www.vim.org/scripts/script.php?script_id=521
"       Plugin to manage Most Recently Used (MRU) files:
"           info -> :e ~/.vim_runtime/plugin/mru.vim
"
"     > Command-T - http://www.vim.org/scripts/script.php?script_id=3025
"       Command-T plug-in provides an extremely fast, intuitive mechanism for opening filesa:
"           info -> :help CommandT
"           screencast and web-help -> http://amix.dk/blog/post/19501

" TODO, look into:
" - set smartindent
" - tabstop=4
" - shiftwidth=4
" - expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Where to find the ctags file: first in current directory,
" then working its way until /
set tags=./tags,/

" When editing a file, always jump to the last cursor position
au BufReadPost *
            \ if ! exists("g:leave_my_cursor_position_alone") |
            \     if line("'\"") > 0 && line ("'\"") <= line("$") |
            \         exe "normal! g`\"" |
            \     endif |
            \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set scrolloff=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hidden "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set line numbers
set nu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
"    if MySys() == "windows"
"      set undodir=C:\Windows\Temp
"    else
      set undodir=~/.vim_runtime/undodir
"    endif

    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
" set textwidth=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

" Show the margin at 80 characters
if exists('+colorcolumn')
    set colorcolumn=80
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map C-[hjkl] to moving around in insert mode
imap <C-h> <left>
imap <C-j> <down>
imap <C-k> <up>
imap <C-l> <right>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<CR>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" tab behavior
try
  set switchbuf=usetab " when switching to a certain buffer, take other tabs into account as well
  set showtabline=1 " show tab line only when more than 1 tab open
catch
endtry


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always show the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    " TODO: replace username by dynamic function
    let curdir = substitute(getcwd(), '/Users/sgeb/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction



set guitablabel=%t


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

" SG
" let vim set the terminal's title
set title

" scroll the viewport 3 lines at once
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:·,eol:$,precedes:<,extends:>
nmap <silent> <leader>/ :set nolist!<CR>

" shorten command-line text and hide startup screen on empty buffer
set shortmess=atI

" Add mouse support for terminal (enable in GUI by default)
set mouse=a
