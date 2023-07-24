set encoding=utf-8
scriptencoding utf-8

source $VIMRUNTIME/macros/matchit.vim

let b:match_ignorecase = 1

let g:python3_host_prog = '/Users/ktr/.pyenv/shims/python3'
syntax enable
" Show bottom status
set laststatus=2

set backspace=indent,eol,start
set ambiwidth=double
set nowrap
set noswapfile
set nobackup

set hlsearch
set incsearch
set ignorecase
set smartcase " When a capital letter is included, not ignore the uppercase

set ruler
set number
set list " Show space char
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if !exists('g:vscode')
  set listchars=tab:>-,trail:.,nbsp:+
endif

set scrolloff=5 " Margin scroll
set sidescroll=1
set sidescrolloff=15
set cursorline
set cursorcolumn
set colorcolumn=120

" Use tab completion
set wildmenu
set showcmd
set wildignore+=*.o,*.obj,*.out
set wildignore+=*.zip,*.tar.gz
set wildignore+=*/vendor/*,.git

set completeopt=menuone,longest

set hidden

if has('nvim')
  set inccommand=split
endif

" Use clipboard of system
set clipboard=unnamed

set autoindent

set mouse=c

" Do auto write when do make
set autowrite

" Do auto read when opened file is changed
set autoread

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

set t_Co=256
set background=dark

" Indent type: c lang
set cindent

set shiftwidth=2
set softtabstop=2
set expandtab

""" Mappings
let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"

inoremap <C-j> <Esc>
inoremap jj <Esc>

" Emacs bind
inoremap <C-f> <Right>
inoremap <C-b> <Left>

nnoremap <Leader>o :call whichpr#open_line()<CR>

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap <M-s> <C-w>s
nnoremap <M-v> <C-w>v
nnoremap <M-w> <C-w>w
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nmap <Space>] :vs<CR><C-]>

nnoremap <silent>[q :cprevious<CR>
nnoremap <silent>]q :cnext<CR>
nnoremap <silent>[Q :cfirst<CR>
nnoremap <silent>]Q :clast<CR>

nnoremap Y y$

nnoremap n nzz
nnoremap N Nzz

nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

nnoremap <silent><C-l> :NERDTreeTabsToggle<CR>

nnoremap <silent><Leader><Space> :Files<CR>
nnoremap <silent><Leader>a :Ag<CR>
nnoremap <silent><Leader>b :Buffers<CR>
nnoremap <silent><Leader>c :History:<CR>
nnoremap <silent><Leader>g :Files ~/.ghq/src<CR>
nnoremap <silent><Leader>h :History<CR>
nnoremap <silent><Leader>s :History/<CR>
nnoremap <silent><Leader>w :Windows<CR>

nnoremap <C-S-j> :lprevious<CR>
nnoremap <C-S-k> :lnext<CR>
nnoremap <C-j> :cprevious<CR>
nnoremap <C-k> :cnext<CR>

nnoremap re :Ag<Space><C-r>=expand("<cword>")<CR><CR>
nnoremap te :Ag<Space>

" if has('nvim')
tnoremap <C-j> <C-\><C-n>
nnoremap <silent><Leader>t :sp<CR>:terminal<CR>
nnoremap <silent><Leader>vt :vs<CR>:terminal<CR>
" endif

" Dash.vim
nnoremap <silent><leader>d <Plug>DashSearch

cnoremap <C-f> <Right>
:cnoremap <C-b> <Left>

""" Plugins
if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'

Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'itchyny/vim-cursorword'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-jp/vital.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

Plug 'elzr/vim-json',              { 'for': 'json' }
Plug 'cespare/vim-toml', { 'for': ['toml', 'tml'] }
Plug 'jparise/vim-graphql'
Plug 'uarun/vim-protobuf', { 'for': 'proto' }
Plug 'jjo/vim-cue', { 'for': 'cue' }

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/vim-xxdcursor'

Plug 'vim-jp/vimdoc-ja'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'

Plug 'thinca/vim-splash'
let g:splash#path = $HOME . '/.vim/splash.txt' " All you need is Vim.

Plug 'pocke/whichpr'

let g:lsp_async_completion = 1
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme seoul256

""" Plugin settings
"" Lightline
let g:lightline = {
  \   'colorscheme': 'solarized',
  \ }

"" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ? <Plug>(neosnippet_expand_or_jump)" : <TAB>

" My snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

"" NERDTree
let g:NERDTreeShowHidden = 1

" autocmd FileType go nmap <C-g>b <Plug>(go-build)
" autocmd FileType go nmap <C-g>t <Plug>(go-test)
" autocmd FileType go nmap <C-g>r <Plug>(go-run)
"
" autocmd FileType go nmap <C-g>ds <Plug>(go-def-split)
" autocmd FileType go nmap <C-g>dv <Plug>(go-def-vertical)
" autocmd FileType go nmap <C-g>dt <Plug>(go-def-tab)
"
" autocmd FileType go nmap <C-g>e <Plug>(go-rename)
"
" autocmd FileType go nmap <C-g>a <Plug>(go-alternate)
" autocmd FileType go nmap <C-g>i <Plug>(go-impl)
"
" autocmd FileType go nmap <F9> :GoCoverageToggle -short<CR>
" autocmd FileType go nmap <F10> :GoTest -short<CR>

" GoTo code navigation.
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! CocRename :call CocActionAsync('rename')<CR>
command! GoAlternative :CocCommand go.test.toggle

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

""" development
if $DEV_VIM == 1
  exe 'set runtimepath^=' . getcwd()
  augroup dev_vim
    au!
    au BufWritePost *.vim source %
  augroup END
  vnoremap <Space><Space> :'<,'>CTree<CR>
endif

" fzf
nnoremap <silent> <C-h> :GFiles<CR>

" my func
if !exists('*ReloadVimrc')
  function! ReloadVimrc() abort
    :write
    :edit!
    :source ~/.config/nvim/init.vim
  endfunction

  " my command
  command! ReloadVimrc :call ReloadVimrc()
endif

command! Vimrc :e ~/.config/nvim/init.vim
