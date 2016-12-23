""" Basic
source $VIMRUNTIME/macros/matchit.vim

let b:match_ignorecase = 1

let g:python3_host_prog = expand($HOME) . "/.pyenv/shims/python3"

syntax enable

" Show bottom status
set laststatus=2

set backspace=indent,eol,start
set ambiwidth=double

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

set mouse=c

" Do auto write when do make
set autowrite

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

""" Color
set t_Co=256
set background=dark

" Highlight current position
set cursorline
set cursorcolumn

" Indent type: c lang
" set cindent
"
" set shiftwidth=2
" set softtabstop=2
" set expandtab

""" Mappings
inoremap <C-j> <esc>

" Emacs bind in insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>

nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

nnoremap <Space>s <C-w>s
nnoremap <Space>v <C-w>v
nnoremap <Space>q <C-w>q
nnoremap <Space>w <C-w>w
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l

nnoremap <silent> [q :cnext<CR>
nnoremap <silent> ]q :cprevious<CR>

nnoremap ; :
nnoremap : ;

nnoremap <silent><C-l> :NERDTreeTabsToggle<CR>
nnoremap <silent><C-i> :QuickRun<CR>

tnoremap <C-j> <C-\><C-n>

""" Plugins
if !filereadable(expand("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'junegunn/seoul256.vim'

Plug 'itchyny/lightline.vim'

Plug 'kana/vim-smartinput'
Plug 'tomtom/tcomment_vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'

Plug 'tomlion/vim-solidity', { 'for': 'solidity' }

Plug 'editorconfig/editorconfig-vim'

" Plug 'lycoris0731/tweet.nvim', { 'do': ['make', 'UpdateRemotePlugins'] }

Plug 'othree/html5.vim',           { 'for': 'html' }
Plug 'mattn/emmet-vim',            { 'for': ['html', 'jsx', 'typescript'] }
Plug 'mattn/jscomplete-vim',       { 'for': 'javascript' }
Plug 'pangloss/vim-javascript',    { 'for': 'javascript' }
Plug 'hail2u/vim-css3-syntax',     { 'for': 'css' }
Plug 'elzr/vim-json',              { 'for': 'json' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi',           { 'for': 'typescript' }

Plug 'cespare/vim-toml', { 'for': 'toml' }

Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'thinca/vim-quickrun'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'junegunn/vim-emoji'

Plug 'thinca/vim-splash'
let g:splash#path = $HOME . '/dotfiles/.vim/splash.txt' " All you need is Vim.

Plug 'fatih/vim-go',      { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

call plug#end()

colorscheme seoul256

""" Plugin settings
"" deoplete
let g:deoplete#enable_at_startup = 1

"" editorconfig
let g:EditorConfig_verbose=1

"" Emmet
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \}

"" Lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }

"" neomake
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neomake_javascript_enabled_markers  = ['eslint']
let g:neomake_html_enabled_markers        = ['htmlhint']
let g:neomake_shellscript_enabled_markers = ['shellcheck']
let g:neomake_python_enabled_markers      = ['pep8']
let g:neomake_typescript_tsc_markers      = { 'args': ['--experimentalDecorators'] }
autocmd! BufWritePost * Neomake

"" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" NERDTree
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let NERDTreeShowHidden = 1

"" QuickRun
let g:quickrun_config={
\ '*': {'split': ''}
\}

"" smartinput
" (#) -> ( # ), ( # ) -> (#)
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
    \     'at'    : '(\%#)',
    \     'char'  : '<Space>',
    \     'input' : '<Space><Space><Left>',
    \     })
call smartinput#define_rule({
    \     'at'    : '( \%# )',
    \     'char'  : '<BS>',
    \     'input' : '<Del><BS>',
    \     })
call smartinput#define_rule({
    \     'at'    : '{\%#}',
    \     'char'  : '<Space>',
    \     'input' : '<Space><Space><Left>',
    \     })
call smartinput#define_rule({
    \     'at'    : '{ \%# }',
    \     'char'  : '<BS>',
    \     'input' : '<Del><BS>',
    \     })

" vim-go
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
au FileType go nmap <C-g>b <Plug>(go-build)
au FileType go nmap <C-g>t <Plug>(go-test)
au FileType go nmap <C-g>r <Plug>(go-run)

" set runtimepath^=~/private_works/tweet-nvim
