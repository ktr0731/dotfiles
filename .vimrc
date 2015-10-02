source $VIMRUNTIME/macros/matchit.vim

let b:match_ignorecase = 1

" emmet
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \}

" sass
au BufRead,BufNewFile *.scss set filetype=sass

set t_Co=256
syntax enable
set background=dark
colorscheme solarized
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

"  indent
set shiftwidth=2
set softtabstop=2
set expandtab

set nf=hex
imap <C-j> <esc>
imap [ []<left>
imap ( ()<left>
imap { {}<left>
imap < <><left>
nmap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap ; :
nnoremap : ;

inoremap ;; <C-O>$;<CR>

"  NeoBundle
if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
" Write plugin here
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'editorconfig/editorconfig-vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

