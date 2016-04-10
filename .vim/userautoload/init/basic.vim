source $VIMRUNTIME/macros/matchit.vim

let b:match_ignorecase = 1

let g:python3_host_prog = expand($HOME) . "/.pyenv/shims/python3"

syntax enable

" Show bottom status
set laststatus=2

set backspace=indent,eol,start

set nowrap

" Not create swap file
set noswapfile

set hlsearch

" Search options
set ignorecase
set smartcase

set ruler

" Show row number
set number

" Show space char
set list
set listchars=tab:>-,trail:.,nbsp:+

" Use tab completion
set wildmenu

set showcmd

" Use clipboard of system
set clipboard=unnamed

set autoindent

" Margin scroll
set scrolloff=5

set nobackup
