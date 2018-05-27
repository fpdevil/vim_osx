" set the required color scheme for vim in gui/terminal
" set the colorscheme to solarized light if running macvim in gui

if has("gui_running")
    silent! colo solarized8
else " has no gui
    if has("unix")
        if !exists('g:vim_color_scheme')
            let color_scheme = "solarized8_flat"
            if HasColorScheme(g:color_scheme)
                exec 'colorscheme '.g:color_scheme
            endif
        else
            if HasColorScheme(g:vim_color_scheme)
                exec 'colorscheme '.g:vim_color_scheme
            endif
        endif
        "set background=light
        let g:airline_theme = 'dark'
        if exists('g:colors_name')
            set termguicolors
        endif
    endif
endif


if exists('g:colors_name') && g:colors_name == 'solarized8'
    if has('gui_running')
        let g:solarized_diffmode     = "normal"
        let g:solarized_visibility   = "high"
        let g:solarized_term_italics = 1
        let g:airline_theme          = 'base16_spacemacs'
    else
        let g:solarized_term_italics = 1
        let g:solarized_visibility   = "normal"
    endif
elseif exists('g:colors_name') && g:colors_name == 'quantum'
    set background=dark
    let g:quantum_italics=1
elseif exists('g:colors_name') && g:colors_name == 'solarized8_flat'
    set background=light
    let g:solarized_term_italics=1
elseif exists('g:colors_name') && g:colors_name == 'PaperColor'
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

" italics in comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic
