" backspace で削除
imap <expr> <BS>
      \ neocomplete#smart_close_popup() . "\<Plug>(smartinput_BS)"

" <C-h> で閉じる
imap <expr> <C-h>
      \ neocomplete#smart_close_popup()

" Enterで候補選択する なかったら普通に改行
imap <expr> <CR> pumvisible() ?
      \ neocomplete#close_popup() : "\<Plug>(smartinput_CR)"

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'

call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      \                        '<BS>',
      \                        '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      \                        '<BS>',
      \                        '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      \                        '<Enter>',
      \                        '<Enter>')
