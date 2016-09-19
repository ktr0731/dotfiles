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

call plug#end()
