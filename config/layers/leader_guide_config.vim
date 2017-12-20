"{{{ for vim leader guide
if has_key(g:plugs, 'vim-leader-guide')
    let g:lmap        = {}
    let g:lmap.f      = { 'name' : 'File Menu' }
    let g:lmap.o      = { 'name' : 'Open Stuff' }
    let g:lmap.c      = { 'name' : 'Comments' }
    let g:lmap.u      = { 'name' : 'Unite Family' }
    let g:lmap.a      = { 'name' : 'Tabular Align' }
    let g:lmap.c.c    = ['call feedkeys("\<Plug>NERDCommenterComment")','Comment']
    let g:lmap.c[' '] = ['call feedkeys("\<Plug>NERDCommenterToggle")','Toggle']
    let g:lmap.g      = {
                \ 'name' : 'Git Menu',
		\ 's'    : ['Gstatus', 'Git status'],
                \ 'p'    : ['Gpull',   'Git pull'],
                \ 'u'    : ['Gpush',   'Git push'],
                \ 'c'    : ['Gcommit', 'Git commit'],
                \ 'w'    : ['Gwrite',  'Git write'],
                \ 'l'    : ['Glog', 'Git log']
                \ }
    " provide commans and details of existing mappings
    nmap <silent> <leader>fd :e $MYVIMRC<CR>
    let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']
    nmap <silent> <leader>fs :so %<CR>
    " let g:lmap.f.s = ['so %', 'Source file']
    nmap <silent> <leader>oo  :copen<CR>
    let g:lmap.o.o = ['copen', 'Open quickfix']
    nmap <silent> <leader>ol  :lopen<CR>
    let g:lmap.o.l = ['lopen', 'Open locationlist']
    nmap <silent> <leader>fw :w<CR>
    let g:lmap.f.w = ['w', 'Write file']

    " for vim TabAlign
    let g:lmap.a = {
                \ 'name' : 'Tab Align',
                \ '='    : [ 'Tabularize /=', 'Align region at =' ],
                \ ':'    : [ 'Tabularize /::', 'Align along ::' ],
                \ 'c'    : [ 'Tabularize /:', 'Align along :' ],
                \ 's'    : [ 'Tabularize /;', 'Align along ;' ],
                \ '>'    : [ 'Tabularize /->', 'Align along ->' ],
                \ '<'    : [ 'Tabularize /<-', 'Align along <-' ],
                \ ','    : [ 'Tabularize /,', 'Align along ,' ],
                \ '.'    : [ 'Tabularize /.', 'Align along .' ],
                \ '&'    : [ 'Tabularize /&', 'Align along &' ],
                \ '('    : [ 'Tabularize /(', 'Align along (' ],
                \ ')'    : [ 'Tabularize /)', 'Align along )' ],
                \ '{'    : [ 'Tabularize /{', 'Align along {' ],
                \ '}'    : [ 'Tabularize /}', 'Align along }' ],
                \ '['    : [ 'Tabularize /[', 'Align along [' ],
                \ ']'    : [ 'Tabularize /]', 'Align along ]' ],
                \ }

    " for haskell leader key mappings
    let g:lmap.h = {
                \ 'name' : 'Haskell GHC Menu',
                \ 't'    : [ 'GhcModType', 'echo the type under cursor' ],
                \ 'e'    : [ 'GhcModTypeClear', 'clear highlight from GhcModType' ],
                \ 'p'    : [ 'GhcModInfoPreview', 'get the information about an identifier in preview' ],
                \ 'T'    : [ 'GhcModTypeInsert', 'insert a type signature under the cursor' ],
                \ 'd'    : [ 'GhcModDiagnostics', 'show diagnostics' ],
                \ 'c'    : [ 'SyntasticCheck ghc_mod', 'syntax checking with ghc-mod' ],
                \ 'l'    : [ 'SyntasticCheck hlint', 'syntax checking with hlint' ],
                \ 'h'    : ['Hoogle', 'do a hoogle search of word under cursor' ],
                \ 'H'    : [ 'Hoogle', 'hoogle and prompt for input' ],
                \ 'i'    : [ 'HoogleInfo', 'get detailed documentation using hoogle' ],
                \ 'I'    : [ 'HoogleInfo', 'hoogle detailed documentation and prompt for input' ],
                \ 'z'    : [ 'HoogleClose', 'close the hoogle window' ],
                \ '.'    : [ 'call Pointfree()', 'call for pointfree style' ],
                \ '>'    : [ 'call Pointful()', 'call for pointful style' ],
                \ 'r'    : [ 'call ApplyOneSuggestion()', 'apply a single suggestion from linter' ],
                \ 'R'    : [ 'call ApplyAllSuggestions()', 'apply all suggestions from linter' ],
                \ }

    " to make the guide pop up Register the description dictionary for the prefix first
    call leaderGuide#register_prefix_descriptions("-", "g:lmap")
    nnoremap <silent> <leader> :<c-u>LeaderGuide '-'<CR>
    vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '-'<CR>

    " Leaderguide position botright
    let g:leaderGuide_vertical = 1
    let g:leaderGuide_position = 'botright'
    let g:leaderGuide_hspace   = 5
endif

"}}}
