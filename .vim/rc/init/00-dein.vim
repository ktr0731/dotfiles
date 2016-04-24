if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if !dein#load_state(s:dein_dir)
  finish
endif

let s:toml      = '~/.vim/rc/init/plugins.toml'
let s:lazy_toml = '~/.vim/rc/init/plugins_lazy.toml'

call dein#begin(s:dein_dir, [s:toml, s:lazy_toml])

call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
