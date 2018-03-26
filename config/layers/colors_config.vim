" set the required color scheme for vim in gui/terminal
" set the colorscheme to solarized light if running macvim in gui

" function to check for existence of colorscheme
function! HasColorScheme(name)
    let pattern = 'colors/' . a:name . '.vim'
    return !empty(globpath(&rtp, pattern))
endfunction

if has("gui_running")
    silent! colo solarized8
else " has no gui
    if has("unix")
        if HasColorScheme('quantum')
            colorscheme quantum
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
