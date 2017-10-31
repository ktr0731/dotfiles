set encoding=utf-8
scriptencoding utf-8

source $VIMRUNTIME/macros/matchit.vim

let b:match_ignorecase = 1

let g:python3_host_prog = '/usr/local/bin/python3'
syntax enable
" Show bottom status
set laststatus=2

set backspace=indent,eol,start
set ambiwidth=double
set nowrap
set noswapfile
set nobackup

set hlsearch
set ignorecase
set smartcase " When a capital letter is included, not ignore the uppercase

set ruler
set number
set list " Show space char
set listchars=tab:>-,trail:.,nbsp:+
set scrolloff=5 " Margin scroll
set sidescroll=1
set sidescrolloff=15
set cursorline
set cursorcolumn

" Use tab completion
set wildmenu
set showcmd
set wildignore+=*.o,*.obj,*.out
set wildignore+=*.zip,*.tar.gz
set wildignore+=*/vendor/*,.git

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

map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" Emacs bind
inoremap <C-f> <Right>
inoremap <C-b> <Left>

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

" cannot jump from location list by this
" nnoremap <CR> :<C-u>call append(expand('.'), '')<CR>j

nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;

nnoremap <silent><C-l> :NERDTreeTabsToggle<CR>

nnoremap <silent><Leader><Space> :GFiles<CR>
nnoremap <silent><Leader>a :Ag<CR>
nnoremap <silent><Leader>b :Buffers<CR>
nnoremap <silent><Leader>c :History:<CR>
nnoremap <silent><Leader>g :Files ~/.ghq/src<CR>
nnoremap <silent><Leader>h :History<CR>
nnoremap <silent><Leader>s :History/<CR>
nnoremap <silent><Leader>w :Windows<CR>

nnoremap V v
nnoremap v V

nnoremap re :Grep<CR>
nnoremap <C-j> :lprevious<CR>
nnoremap <C-k> :lnext<CR>

if has('nvim')
  tnoremap <C-j> <C-\><C-n>
  nnoremap <silent><Leader>t :sp<CR>:terminal<CR>
  nnoremap <silent><Leader>vt :vs<CR>:terminal<CR>
endif

" ctags
nnoremap <C-]> g<C-]>

" Dash.vim
nnoremap <silent><leader>d <Plug>DashSearch

cnoremap <C-f> <Right>
:cnoremap <C-b> <Left>

""" Plugins
if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-grep'
Plug 'itchyny/vim-cursorword'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-jp/vital.vim'
Plug 'haya14busa/vim-asterisk'

Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'rizzatti/dash.vim'
Plug 'rhysd/conflict-marker.vim'

Plug 'tomlion/vim-solidity', { 'for': 'solidity' }

Plug 'editorconfig/editorconfig-vim'

Plug 'othree/html5.vim',           { 'for': 'html' }
Plug 'mattn/emmet-vim',            { 'for': ['html', 'jsx', 'typescript', 'riot', 'ejs'] }
Plug 'mattn/jscomplete-vim',       { 'for': 'javascript' }
Plug 'hail2u/vim-css3-syntax',     { 'for': 'css' }
Plug 'elzr/vim-json',              { 'for': 'json' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi',           { 'for': 'typescript' }
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'riot'] }
Plug 'ryym/vim-riot',              { 'for': 'riot' }
Plug 'nikvdp/ejs-syntax',          { 'for': 'ejs' }
Plug 'wavded/vim-stylus',          { 'for': 'stylus' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'tpope/vim-fugitive'
" Plug 'mephux/vim-jsfmt', { 'for': ['javascript'] }

Plug 'derekwyatt/vim-scala'

Plug 'cespare/vim-toml', { 'for': ['toml', 'tml'] }

Plug 'dag/vim-fish'

Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/vim-xxdcursor'

if has('nvim')
  Plug 'Shougo/denite.nvim'
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
  Plug 'zchee/deoplete-go', { 'for': 'go' }
  Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
endif

Plug 'AndrewRadev/inline_edit.vim'
Plug 'thinca/vim-quickrun'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/limelight.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'lambdalisue/gina.vim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'thinca/vim-splash'
let g:splash#path = $HOME . '/.vim/splash.txt' " All you need is Vim.

Plug 'fatih/vim-go',         { 'for': 'go' }
Plug 'jodosha/vim-godebug',  { 'for': 'go' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

Plug 'uarun/vim-protobuf', { 'for': 'proto' }

Plug 'hashivim/vim-hashicorp-tools'
Plug 'lifepillar/pgsql.vim'

call plug#end()

colorscheme seoul256

""" Plugin settings
"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 20 " Default: 100

"" Emmet
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
  \   'variables': {
  \     'lang': 'ja'
  \   }
  \ }

"" Lightline
let g:lightline = {
  \   'colorscheme': 'solarized',
  \ }

let g:quickrun_config = {
  \   'javascript': {
  \     'command': 'node'
  \   }
  \ }

"" neomake
" let g:neomake_javascript_enabled_makers  = ['eslint']
let g:neomake_html_enabled_makers        = ['htmlhint']
let g:neomake_sh_enabled_makers          = ['shellcheck']
let g:neomake_python_enabled_makers      = ['pep8']
let g:neomake_vim_enabled_makers         = ['vint']
let g:neomake_typescript_tsc_makers      = { 'args': ['--experimentalDecorators'] }

augroup Neomake
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

"" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB>
"   \   pumvisible() ? <C-n> :
"   \   neosnippet#expandable_or_jumpable() ? <Plug>(neosnippet_expand_or_jump) : <TAB>
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? <Plug>(neosnippet_expand_or_jump)" : <TAB>

" My snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

"" NERDTree
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:NERDTreeShowHidden = 1

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'
" let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"

autocmd FileType go nmap <C-g>b <Plug>(go-build)
autocmd FileType go nmap <C-g>t <Plug>(go-test)
autocmd FileType go nmap <C-g>r <Plug>(go-run)

autocmd FileType go nmap <C-g>ds <Plug>(go-def-split)
autocmd FileType go nmap <C-g>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <C-g>dt <Plug>(go-def-tab)

autocmd FileType go nmap <C-g>gd <Plug>(go-doc)
autocmd FileType go nmap <C-g>gv <Plug>(go-doc-vertical)

autocmd FileType go nmap <C-g>s <Plug>(go-implements)
autocmd FileType go nmap <C-g>e <Plug>(go-rename)

autocmd FileType go nmap <C-g>a <Plug>(go-alternate)
autocmd FileType go nmap <C-g>i <Plug>(go-impl)

autocmd FileType go nmap <F9> :GoCoverageToggle -short<CR>
autocmd FileType go nmap <F10> :GoTest -short<CR>

" gocode
let g:go_gocode_unimported_packages = 1

" vim-tags
let g:vim_tags_auto_generate = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" rust.vim
let g:rustfmt_autosave = 1

" jsfmt
let g:js_fmt_autosave = 1

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
nnoremap <C-i> :call fzf#run({
\   'source': 'itunes list',
\   'sink':   '!itunes play',
\ })<CR>

nnoremap <silent> <tab> :GFiles<CR>

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

command! Vimrc :e ~/.vimrc

