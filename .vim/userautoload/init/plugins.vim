"  [Start] dein Scripts  --------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)

  let s:toml = '~/.vim/userautoload/init/plugins.toml'
  let s:lazy_toml = '~/.vim/userautoload/init/plugins_lazy.toml'

  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()

endif

if dein#check_install()
  call dein#install()
endif

" Required :
filetype plugin indent on

"  [End] dein Scripts --------------------
