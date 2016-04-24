let g:neocomplete#enable_at_startup = 1    " 使用する
let g:neocomplete#max_list = 5             " 候補の数
let g:neocomplete#enable_ignore_case = 1   " 
let g:neocomplete#enable_auto_select = 1   " 自動選択
let g:neocomplete#enable_smart_case = 1    " 大文字小文字を無視

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
