let g:neomake_javascript_enabled_markers  = ['eslint']
let g:neomake_html_enabled_markers        = ['htmlhint']
let g:neomake_shellscript_enabled_markers = ['shellcheck']

autocmd! BufWritePost * Neomake
