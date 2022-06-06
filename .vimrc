" ========================
" General settings
" ========================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
"set mousemodel=popup

" show the line and column number of the cursor position, separated by comma
set ruler
" A comma separated list of options for Insert mode completion
set completeopt-=preview
set guicursor=a:blinkon0
set ttyfast

" copy&paste with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"colorscheme pablo
set background=light
colorscheme default
"let g:gruvbox_termcolors=256
set cursorline

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"syntax check
syntax on
"filetype on
filetype plugin indent on
"Open every buffer in its tabpage
"tab sball
set switchbuf=useopen

" easytags
set tags=./tags;,~/.vimtags

"disable beeper and blinking
set visualbell t_vb=
set novisualbell

set enc=utf-8   "utf-8 by default

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus=0

hi LineNr       term=bold cterm=bold ctermfg=2 ctermbg=236 guifg=Grey guibg=Grey90
hi clear CursorLine

"common stuff
" briefly jumt to the matching bracket
set showmatch
"tenths of a second to show the matching paren when 'showmatch' is set
set matchtime=2
set nocompatible
set hidden
" print the line number in front of each line
set number
" Changes the special characters that can be used in search patterns
set magic
" Show (partial) command in the last line of the screen
set showcmd
set title
" no backup files
set nobackup
" Vim will change the current working directory whenever you open a file
set autochdir
" lines longer than the width of the window will wrap and displaying continues on the next line
set wrap
set nolinebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set cmdheight=2
set noshowmode

"swap files
set noswapfile

set mouse=a

"case
set ignorecase
set smartcase

"indents
set autoindent
" set to 'no' due to #comments not to be intended
set nosmartindent

"tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

"tab completion stuff
set wildmenu
set wildmode=list:longest,full

"search
set hlsearch
set incsearch
set nolazyredraw
set showmatch
set mat=2

"statusbar
set laststatus=2
set ttimeoutlen=50
set t_Co=256

"scroll
"5 lines scroll for each time
set scrolloff=5

"mappings
"tabs
map <A-Tab> :tabnext<CR>
nmap <A-t> :tabnew<CR>
nmap <A-w> :tabclose<CR>

nmap <leader>n :set invnumber<CR>

"motion
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap { {zz
nmap } }zz

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i
imap <leader>< <><ESC>i

"swap split panels
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>


" ==========================
" Python-mode settings
" ==========================

let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_completion_on_dot = 1

" documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" check code
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E265,E501,W601,C0110"


" check code after save
let g:pymode_lint_write = 1

" virtualenv support
let g:pymode_virtualenv = 1

" breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'


" syntax highlight
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" disable autofold
let g:pymode_folding = 1

" possibility to run code
let g:pymode_run = 0

let g:pymode_python = 'python3'

" =============
""" ALE
" =============
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0


" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

" =============
" ANSIBLE & YML
" =============
autocmd BufNewFile,BufRead *.yml set filetype=ansible
" Flag unnecessary whitespaces
highlight BadWhitespace ctermbg=52
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ============
" User hotkeys
" ============

" CTRL-SHIFT-C is for Copy
vnoremap <C-S-c> "+y

" run interpreter by F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
" a debug-mode F6
nnoremap <F6> :ext "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Check code accordingly to PEP8 via <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" Do not display docstring (jedi vim)
autocmd FileType python setlocal completeopt-=preview


" Autocomplecte via <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" -- airblade/vim-gitgutter settings --
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Enabling GoMetaLinter on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" Enable neosnippet
"let g:go_snippet_engine = "neosnippet"
"let g:neosnippet#snippets_directory=''



" -- fzf --
nnoremap <C-p> :<C-u>FZF<CR>


" Plugins need to be added to runtime path before helptags can be generated
packloadall
" Load all of the helptags now, after plugins have been loaded
" All messages and errors will be ignored.
silent! helptags ALL
