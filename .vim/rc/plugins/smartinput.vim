call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)', '<BS>', '<BS>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)', '<BS>', '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)', '<Enter>', '<Enter>')

" (#) -> ( # ), ( # ) -> (#)
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
    \     'at'    : '(\%#)',
    \     'char'  : '<Space>',
    \     'input' : '<Space><Space><Left>',
    \     })
call smartinput#define_rule({
    \     'at'    : '( \%# )',
    \     'char'  : '<BS>',
    \     'input' : '<Del><BS>',
    \     })
