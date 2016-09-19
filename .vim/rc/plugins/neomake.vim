let g:neomake_javascript_enabled_markers  = ['eslint']
let g:neomake_html_enabled_markers        = ['htmlhint']
let g:neomake_shellscript_enabled_markers = ['shellcheck']
let g:neomake_python_enabled_markers      = ['pep8']

autocmd! BufWritePost * Neomake
