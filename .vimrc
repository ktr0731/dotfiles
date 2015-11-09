source $VIMRUNTIME/macros/matchit.vim

let b:match_ignorecase = 1

" emmet
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \}

" neocomplete
let g:neocomplete#enable_at_startup = 1    " 使用する
let g:neocomplete#max_list = 5             " 候補の数
let g:neocomplete#enable_ignore_case = 1   " 
let g:neocomplete#enable_auto_select = 1   " 自動選択
let g:neocomplete#enable_smart_case = 1    " 大文字小文字を無視

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" smartinput

" backspace で削除
imap <expr> <BS>
      \ neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"

" <C-h> で閉じる
imap <expr> <C-h>
      \ neocomplete#smart_close_popup()

" Enterで候補選択する なかったら普通に改行
imap <expr> <CR> pumvisible() ?
      \ neocomplete#close_popup() : "\<Plug>(smartinput_CR)"

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

" sass
au BufRead,BufNewFile *.scss set filetype=sass

" unite
noremap <C-p> :Unite buffer<CR>
noremap <C-n> :Unite -buffer-name=file file<CR>
noremap <C-z> :Unite file_mru<CR>
noremap :uff :<C-u>UnitewithBufferDir file -buffer-name=file<CR>
" split
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> Unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> Unite#do_action('split')
" vsplit
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> Unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> Unite#do_action('vsplit')
" End by esc*2
au FileType Unite nnoremap <silent> <buffer> <Esc><Esc> :q<CR>
au FileType Unite inoremap <silent> <buffer> <Esc><Esc> <Esc>:q<CR>

" lightline
let g:lightline = {
  \ 'colorscheme': 'solarized'
  \ }

set laststatus=2
set t_Co=256
syntax enable
set background=dark
colorscheme solarized
set backspace=indent,eol,start
set nowrap
set cindent
set noswapfile
set hlsearch
set ignorecase
set smartcase
set ruler
set number
set list
set listchars=tab:>-,trail:.
set wildmenu
set showcmd
set clipboard=unnamed
set autoindent

"  indent
set shiftwidth=2
set softtabstop=2
set expandtab

set nf=hex
inoremap <C-j> <esc>

nmap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap ; :
nnoremap : ;

" cursor
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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
NeoBundle 'Shougo/neocomplete'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundleCheck
call neobundle#end()
filetype plugin indent on

call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      \                        '<BS>',
      \                        '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      \                        '<BS>',
      \                        '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      \                        '<Enter>',
      \                        '<Enter>')
