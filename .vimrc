source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
set t_Co=256
syntax enable
colorscheme zenburn
set nowrap
set noswapfile
set hlsearch
set ignorecase
set smartcase
set ruler
set number
set list
set wildmenu
set showcmd
set clipboard=unnamed
set autoindent

"  indent  "
set shiftwidth=4
set softtabstop=4
set expandtab

set nf=hex
imap <C-j> <esc>
imap [ []<left>
imap ( ()<left>
imap { {}<left>
imap < <><left>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
