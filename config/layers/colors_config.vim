" set the required color scheme for vim in gui/terminal
" set the colorscheme to solarized light if running macvim in gui
if has("gui_running")
    colorscheme solarized
else " has no gui
    if has("unix")
        "set background=dark
        colorscheme PaperColor
        "colorscheme seoul256-light
        let g:airline_theme = 'vice'
    endif
endif

if exists('g:colors_name') && g:colors_name == 'solarized'
    if has('gui_running')
        let g:solarized_bold       = 0
        let g:solarized_underline  = 1
        let g:solarized_italic     = 1
        let g:solarized_contrast   = "high"
        let g:solarized_visibility = "high"
        let g:airline_theme        = 'base16_spacemacs'
    else
        let g:solarized_termcolors = 256
        let g:solarized_degrade    = 0
        let g:solarized_termtrans  = 1
        set background=light
    endif
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
