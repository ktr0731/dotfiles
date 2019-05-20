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

nnoremap <silent><Leader><Space> :GFiles<CR>
nnoremap <silent><Leader>a :Ag<CR>
nnoremap <silent><Leader>b :Buffers<CR>
nnoremap <silent><Leader>c :History:<CR>
nnoremap <silent><Leader>g :Files ~/.ghq/src<CR>
nnoremap <silent><Leader>h :History<CR>
nnoremap <silent><Leader>s :History/<CR>
nnoremap <silent><Leader>w :Windows<CR>

nnoremap re :Rg<Space>
nnoremap <C-S-j> :lprevious<CR>
nnoremap <C-S-k> :lnext<CR>
nnoremap <C-j> :cprevious<CR>
nnoremap <C-k> :cnext<CR>

if has('nvim')
  tnoremap <C-j> <C-\><C-n>
  nnoremap <silent><Leader>t :sp<CR>:terminal<CR>
  nnoremap <silent><Leader>vt :vs<CR>:terminal<CR>
endif

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
Plug 'junegunn/limelight.vim'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-grep'
Plug 'jremmen/vim-ripgrep'
Plug 'itchyny/vim-cursorword'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'vim-jp/vital.vim'

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
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'riot'] }
Plug 'ryym/vim-riot',              { 'for': 'riot' }
Plug 'nikvdp/ejs-syntax',          { 'for': 'ejs' }
Plug 'wavded/vim-stylus',          { 'for': 'stylus' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'posva/vim-vue'

Plug 'derekwyatt/vim-scala'

Plug 'cespare/vim-toml', { 'for': ['toml', 'tml'] }

Plug 'dag/vim-fish'

Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'mattn/vim-xxdcursor'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

if has('nvim')
  Plug 'Shougo/denite.nvim'
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
Plug 'google/yapf',          { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'

Plug 'uarun/vim-protobuf', { 'for': 'proto' }

Plug 'hashivim/vim-hashicorp-tools'
Plug 'lifepillar/pgsql.vim'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
let g:lsp_async_completion = 1

call plug#end()

colorscheme seoul256

""" Plugin settings
" laungage server
if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'go-lang',
          \ 'cmd': {server_info->['gopls']},
          \ 'whitelist': ['go'],
          \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
    "autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
    "autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
    "autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
  augroup END
endif

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
let g:neomake_html_enabled_makers        = ['htmlhint']
let g:neomake_sh_enabled_makers          = ['shellcheck']
let g:neomake_python_enabled_makers      = ['pep8']
let g:neomake_rust_enabled_makers        = ['rustc']
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

smap <expr><TAB> neosnippet#expandable_or_jumpable() ? <Plug>(neosnippet_expand_or_jump)" : <TAB>

" My snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

"" NERDTree
let g:NERDTreeShowHidden = 1

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'
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

" vim-tags
let g:vim_tags_auto_generate = 1

" rust.vim
let g:rustfmt_autosave = 1

" vim-racer
let g:racer_cmd = '/usr/local/bin/racer'
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <buffer> <silent> <C-]> <Plug>(rust-def)

" gist-vim
let g:gist_post_private = 1

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

command! Vimrc :e ~/.config/nvim/init.vim

let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_NCM_LOG_LEVEL="DEBUG"
let $NVIM_NCM_MULTI_THREAD=0

function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'gotags %s',
    \ expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
