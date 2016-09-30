""" Basic
set runtimepath+=~/private_works/nvim

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

nnoremap ; :
nnoremap : ;

noremap <CR> o<ESC>
noremap <Space> i<Space><ESC>

nnoremap <silent><C-l> :NERDTreeToggle<CR>
nnoremap <silent><C-i> :QuickRun<CR>

""" Plugins
call plug#begin('~/.vim/plugged')

Plug 'hail2u/vim-css3-syntax'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-smartinput'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-pathogen'
Plug 'scrooloose/nerdtree'
Plug 'benekastah/neomake'
autocmd! BufWritePost * Neomake
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tomlion/vim-solidity'
Plug 'junegunn/seoul256.vim'

Plug 'mattn/emmet-vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim', { 'on': 'Unite' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/jscomplete-vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-surround'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'thinca/vim-quickrun'
Plug 'zerowidth/vim-copy-as-rtf'

call plug#end()

""" Plugin settings
"" seoul256
colorscheme seoul256

"" CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

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

"" neocomplete
let g:neocomplete#enable_at_startup = 1    " 使用する
let g:neocomplete#max_list = 5             " 候補の数
let g:neocomplete#enable_ignore_case = 1   "
let g:neocomplete#enable_auto_select = 1   " 自動選択
let g:neocomplete#enable_smart_case = 1    " 大文字小文字を無視

"" neomake
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neomake_javascript_enabled_markers  = ['eslint']
let g:neomake_html_enabled_markers        = ['htmlhint']
let g:neomake_shellscript_enabled_markers = ['shellcheck']
let g:neomake_python_enabled_markers      = ['pep8']
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

" Show NERDTree if buffer is empty.
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

"" QuickRun
let g:quickrun_config={
\ '*': {'split': ''}
\}

"" smartinput
" call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)', '<BS>', '<BS>')
" call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)', '<BS>', '<C-h>')
" call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)', '<Enter>', '<Enter>')
"
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

"" Unite
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

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', '']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
execute pathogen#infect()

" For my development
let g:splash#path = $HOME . '/dotfiles/.vim/rc/plugins/splash.txt'
