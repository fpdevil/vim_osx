"------------------------------------------------------------------------------------
"-----                      for tab alignment configuration                     -----
"------------------------------------------------------------------------------------
"if has_key(g:plugs, 'tabular')
if !empty(glob('~/.vim/plugged/tabular'))
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.a = {
                \ 'name' : 'Tabular Alignment' ,
                \ '='    : [ 'Tabularize /='   , 'Align region at =' ],
                \ ':'    : [ 'Tabularize /::'  , 'Align along ::' ],
                \ 'c'    : [ 'Tabularize /:'   , 'Align along :' ],
                \ 's'    : [ 'Tabularize /;'   , 'Align along ;' ],
                \ '>'    : [ 'Tabularize /->'  , 'Align along ->' ],
                \ '<'    : [ 'Tabularize /<-'  , 'Align along <-' ],
                \ ','    : [ 'Tabularize / , ' , 'Align along , ' ],
                \ '.'    : [ 'Tabularize /.'   , 'Align along .' ],
                \ '&'    : [ 'Tabularize /&'   , 'Align along &' ],
                \ '('    : [ 'Tabularize /('   , 'Align along (' ],
                \ ')'    : [ 'Tabularize /)'   , 'Align along )' ],
                \ '{'    : [ 'Tabularize /{'   , 'Align along {' ],
                \ '}'    : [ 'Tabularize /}'   , 'Align along }' ],
                \ '['    : [ 'Tabularize /['   , 'Align along [' ],
                \ ']'    : [ 'Tabularize /]'   , 'Align along ]' ],
                \ }
endif
