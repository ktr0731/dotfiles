"  [Start] dein Scripts  --------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" Required :
set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim
" Required :
call dein#begin(expand('~/.vim/bundle/'))

" Required :
call dein#add('Shougo/dein.vim')

" My plugins
call dein#add('altercation/vim-colors-solarized')
call dein#add('mattn/emmet-vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('kana/vim-smartinput')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('itchyny/lightline.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('davidhalter/jedi-vim')
call dein#add('kevinw/pyflakes-vim')
call dein#add('scrooloose/syntastic')
call dein#add('mattn/jscomplete-vim')
call dein#add('plasticboy/vim-markdown')

" Required :
call dein#end()

" Required :
filetype plugin indent on

" If some plugins not installed on startup
if dein#check_install()
  call dein#install()
endif
"  [End] dein Scripts --------------------
