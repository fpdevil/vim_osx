" set the required color scheme for vim in gui/terminal
" set the colorscheme to solarized light if running macvim in gui
if has("gui_running")
    "colorscheme whitebox
    "colorscheme tender
    colorscheme solarized
    "colorscheme bubblegum-256-light
else " no gui
    if has("unix")
        colorscheme seoul256-light
        "let g:airline_theme = 'cool'
        let g:airline_theme = 'zenburn'
    endif
endif

if exists('g:colors_name') && g:colors_name == 'solarized'
    let g:solarized_termtrans  = 1
    let g:solarized_termcolors = 256
    let g:solarized_contrast   = "high"
    let g:solarized_visibility = "high"
    let g:airline_theme        = 'base16_spacemacs'
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
