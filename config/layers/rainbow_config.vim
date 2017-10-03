" ------------------------------------------------------------------------------------
" ------ customizing the rainbow parenthesis with choice of colors upto depth 9 ------
" ------------------------------------------------------------------------------------

if has_key(g:plugs,'rainbow_parentheses.vim')
    let g:rbpt_colorpairs = [
                \ ['darkyellow',  'RoyalBlue3'],
                \ ['darkgreen',   'SeaGreen3'],
                \ ['darkcyan',    'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['DarkMagenta', 'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['darkyellow',  'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['DarkMagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['darkyellow',  'DarkOrchid3'],
                \ ['darkred',     'firebrick3'],
                \ ]
    
    let g:rbpt_max            = 16
    let g:rbpt_loadcmd_toggle = 0
    
    " Rainbow Always On
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
endif
