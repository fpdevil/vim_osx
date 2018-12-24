scriptencoding utf-8

" set the terminal vim color scheme
" if commented, default is solarized
"let g:vim_color_scheme = 'quantum'
"let g:vim_color_scheme = 'OceanicNext'
"let g:vim_color_scheme = 'hydrangea'
let g:vim_color_scheme = 'ayu'

" color scheme in gui mode
let g:vim_gui_color_scheme = 'solarized8_light'

" font in the gui mode
let g:vimosx_gui_font = 'MonacoForPowerline:h12'

" terminal status line / airline theme (default: dark)
let g:vim_airline_theme = 'solarized_flood'

" clear search highlighting {0 | 1}
let g:vim_clear_search_highlight = 1

" syntax checker selection (deoplete | neocomplete | YouCompleteMe)
" select the appropriate auto completion framework
let g:vim_auto_complete_engine = 'neocomplete'
"let g:vim_auto_complete_engine = 'deoplete'
"let g:vim_auto_complete_engine = 'youcompleteme'

" let the syntax checker know of ALE (1) or Syntastic (0)
let g:vim_syntax_ale = 1

" ALE Syntax checker settings
" do on the fly syntax checking with ale
let g:vim_lint_on_the_fly = 0

" C/C++ Completion Engines
" c/cpp completion engine with vim-marching (enable = 1 | disable = 0)
let g:vim_cpp_marching_completion = 0

" c/cpp completion engine with vim-clang (enable = 1 | disable = 0)
let g:vim_cpp_vim_clang = 0

" c/cpp completion engine with OmniCppComplete (enable = 1 | disable = 0)
let g:vim_cpp_omni_completion = 0

"c/c++ completion engine using clang-complete (enable = 1 | disable = 0)
let g:vim_cpp_clang_completion = 1

" C/C++ Support  –  Vim Plug-In
" IDE features for ViM
let g:is_cpp_ide_enabled = 0
