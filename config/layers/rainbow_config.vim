" ------------------------------------------------------------------------------------
" ------ customizing the rainbow parenthesis with choice of colors upto depth 9 ------
" ------------------------------------------------------------------------------------

if isdirectory(expand("~/.vim/plugged/rainbow_parentheses.vim"))
    let g:rbpt_colorpairs = [
                \ ['yellow',  'RoyalBlue3'],
                \ ['darkgreen',   'SeaGreen3'],
                \ ['darkcyan',    'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['DarkMagenta', 'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['yellow',  'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['DarkMagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['yellow',  'DarkOrchid3'],
                \ ['darkred',     'firebrick3'],
                \ ]

    let g:rbpt_max            = 16
    let g:rbpt_loadcmd_toggle = 0

    " Enable rainbow parentheses for all buffers
    augroup rainbow_parentheses
        au!
        au VimEnter * RainbowParenthesesActivate
        au BufEnter * RainbowParenthesesLoadRound
        au BufEnter * RainbowParenthesesLoadSquare
        au BufEnter * RainbowParenthesesLoadBraces
    augroup END
endif
