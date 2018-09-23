" ------------------------------------------------------------------------------------
" ------ customizing the rainbow parenthesis with choice of colors upto depth 9 ------
" ------------------------------------------------------------------------------------

if isdirectory(expand("~/.vim/plugged/rainbow_parentheses.vim"))
    let g:rbpt_colorpairs = [
                \ ['yellow',      'RoyalBlue3'],
                \ ['darkgreen',   'SeaGreen3'],
                \ ['darkcyan',    'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['DarkMagenta', 'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['yellow',      'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['DarkMagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['yellow',      'DarkOrchid3'],
                \ ['darkred',     'firebrick3'],
                \ ]

    let g:rbpt_max            = 16
    let g:rbpt_loadcmd_toggle = 0

    " Enable rainbow parentheses for all buffers
    "augroup rainbow_parentheses
    "    au!
    "    au VimEnter * RainbowParenthesesToggle
    "    au Syntax * RainbowParenthesesLoadRound
    "    au Syntax * RainbowParenthesesLoadSquare
    "    au Syntax * RainbowParenthesesLoadBraces
    "    au Syntax * RainbowParenthesesLoadChevrons
    "augroup END

    " Enable only for clojure
    augroup rainbow_parentheses
        au!
        autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
        autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
        autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
        autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
        autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
        au VimEnter *.py,*.js,*.html,*.css,*.sls RainbowParenthesesToggle
        au Syntax *.py,*.js,*.html,*.css,*.sls RainbowParenthesesLoadRound
        au Syntax *.py,*.js,*.html,*.css,*.sls RainbowParenthesesLoadSquare
        au Syntax *.py,*.js,*.html,*.css,*.sls RainbowParenthesesLoadBraces
    augroup END
endif
