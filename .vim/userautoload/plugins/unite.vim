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
