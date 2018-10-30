" set the required color scheme for vim in gui/terminal
" set the colorscheme to solarized light if running macvim in gui

if has('gui_macvim')
    "silent! colo solarized8
    if !exists('g:vim_gui_color_scheme')
        let color_scheme = 'solarized8_flat'
        if HasColorScheme(g:color_scheme)
            exec 'colorscheme '. g:color_scheme
        endif
    else
        if HasColorScheme(g:vim_gui_color_scheme)
            exec 'colorscheme '. g:vim_gui_color_scheme
        endif
    endif
else " has no gui
    if has('unix')
        if !exists('g:vim_color_scheme')
            let color_scheme = 'NeoSolarized'
            if HasColorScheme(g:color_scheme)
                exec 'colorscheme '. g:color_scheme
            endif
        else
            if HasColorScheme(g:vim_color_scheme)
                exec 'colorscheme '. g:vim_color_scheme
           endif
        endif
        "set background=light
        "set the airline theme as required
        if !exists('g:vim_airline_theme')
            let g:airline_theme = 'dark'
        else
            let g:airline_theme = g:vim_airline_theme
        endif

        if exists('g:colors_name')
            set termguicolors
        endif
    endif
endif


if exists('g:colors_name') && g:colors_name ==# 'solarized8'
    if has('gui_running')
        let g:solarized_diffmode     = 'normal'
        let g:solarized_visibility   = 'high'
        let g:solarized_term_italics = 1
        let g:airline_theme          = 'ayu_mirage'
    else
        let g:solarized_term_italics = 1
        let g:solarized_visibility   = 'normal'
    endif
elseif exists('g:colors_name') && g:colors_name ==# 'quantum'
    set background=dark
    let g:quantum_italics=1
elseif exists('g:colors_name') && g:colors_name ==# 'OceanicNext'
    set background=dark
elseif exists('g:colors_name') && g:colors_name ==# 'solarized8_flat'
    set background=light
    let g:solarized_term_italics=1
elseif exists('g:colors_name') && g:colors_name ==# 'NeoSolarized'
    set background=light
    let g:neosolarized_bold = 1
    let g:neosolarized_underline = 1
    let g:neosolarized_italic = 1
elseif exists('g:colors_name') && g:colors_name ==# 'ayu'
    let ayucolor='light'
elseif exists('g:colors_name') && g:colors_name ==# 'PaperColor'
    set background=light
    let g:PaperColor_Theme_Options = {
      \   'language': {
      \     'python': {
      \         'highlight_builtins' : 1
      \     },
      \     'javascript': {
      \         'highlight_builtins' : 1
      \     },
      \     'cpp': {
      \         'highlight_standard_library': 1
      \     },
      \     'c': {
      \         'highlight_builtins' : 1
      \     }
      \   }
      \ }
endif

" set shortcut for checking the current color theme
let g:lmap = get(g:, 'lmap', {})
if has_key(g:lmap, 't')
    let g:lmap.t.u = {
                \ 'name': '+UI Themes and Colors ',
                \ 't': ['call ToggleBG()', 'Toggle the background color '],
                \ 'c': ['call ShowColorTheme()', 'Display current color theme '],
                \ 'b': ['set bg?', 'Display current bacground color '],
                \ }
endif

if has('termguicolors') && $COLORTERM ==# 'truecolor'
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum" " Needed in tmux
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum" " Ditto
    set termguicolors
endif
