"------------------------------------------------------------------------------------
"---------    python/python3 and JEDI syntastic integration for checking    ---------
"----- ycm can also be used,  but pretty happy with the JEDI completion for now -----
"------------------------------------------------------------------------------------
" jedi auto-completion and syntax checking for python3
" the below section first does a check on which version of python to choose

if has('python')
    let g:jedi#force_py_version        = 2
    let g:syntastic_python_python_exec = 'python'
    let g:pymode_python                = 'python'
elseif has('python3')
    let g:jedi#force_py_version        = 3
    let g:syntastic_python_python_exec = '/usr/local/bin/python3'
    let g:pymode_python                = '/usr/local/bin/python3'
else
    let g:loaded_jedi = 1
endif

" omnifunc for python
" autocmd FileType python setlocal completefunc=jedi#complete

autocmd FileType python setlocal omnifunc=jedi#completions
au FileType python setlocal completeopt=preview,menu,longest

" set the keymapping for definition browsing (-t)
au FileType python let g:jedi#completions_enabled        = 0
au FileType python let g:jedi#goto_definitions_command   = "<leader>t"
au FileType python let g:jedi#show_call_signatures_delay = 0
au FileType python let g:jedi#auto_close_doc             = 1
au FileType python let g:jedi#show_call_signatures       = 2
au FileType python let g:jedi#auto_vim_configuration     = 0
au FileType python let g:jedi#smart_auto_mappings        = 1
"au FileType python let g:jedi#popup_on_dot               = 1

"{{{ using rope for python code assist
"if has_key(g:plugs, 'ropevim')
if !empty(glob('~/.vim/plugged/ropevim'))
    let ropevim_extended_complete=1
endif
"}}}

" custom settings for python through syntastic checker
"if has_key(g:plugs, 'syntastic')
if !empty(glob('~/.vim/plugged/syntastic'))
    let g:syntastic_enable_highlighting        = 1
    let g:syntastic_python_python_exec         = '/usr/local/bin/python3'
    let g:syntastic_python_checkers            = ['flake8', 'pyflakes', 'pylint']
    let g:syntastic_python_flake8_args         = '--max-line-length=80 ' .
                \ '--max-complexity=10 ' .
                \ '--ignore=D400,E501,E302,E261,E701,E241,E126,E127,E128,W801,' .
                \ 'E111,E114,E121,E125,E129,E131,E133,E201,E202,E203,E211,E221' .
                \ 'E222,E241,E251,E261,E303,E402,W503'
    " not using pylint
    " let g:syntastic_python_pylint_args         = '--disable=C0103'
endif

"{{{ show balloon with mouse hovering over an error
let g:syntastic_enable_balloons = 1
"}}}


"{{{  python language specific customizations
"     enable all the python syntax highlighting features
let python_highlight_all=1
"}}}

" ------------------------------------------------------------------------------------
" ---                 ultisnips snippets for python2 and python3                   ---
" ------------------------------------------------------------------------------------
if has("python")
    let g:UltiSnipsUsePythonVersion = 2
else
    let g:UltiSnipsUsePythonVersion = 3
endif

" ------------------------------------------------------------------------------
"  for proper pep8 indentation
" ------------------------------------------------------------------------------
autocmd FileType python set tabstop=4|set shiftwidth=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

" ------------------------------------------------------------------------------
"  Sort and highlight Python imports in Vim
" ------------------------------------------------------------------------------
"if has_key(g:plugs,'impsort.vim')
if !empty(glob('~/.vim/plugged/impsort.vim'))
    autocmd BufWritePre *.py ImpSort!
endif

" ------------------------------------------------------------------------------
"  for vim-virtualenv
" ------------------------------------------------------------------------------
"if has_key(g:plugs,'vim-virtualenv')
if !empty(glob('~/.vim/plugged/vim-virtualenv'))
    let g:virtualenv_auto_activate = 1
    let g:virtualenv_stl_format    = '(%n)'
endif

" for python-mode
"if has_key(g:plugs,'python-mode')
if !empty(glob('~/.vim/plugged/python-mode'))
    let g:pymode_python          = 'python3'
    let g:pymode_breakpoint_bind = '<Leader>B'
    
    let g:pymode_lint          = 1
    let g:pymode_lint_on_write = 0
    let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
    let g:pymode_lint_ignore   = ''
    let g:pymode_virtualenv    = 1
    let g:pymode_rope          = 1
    
    let g:pymode_rope_completion      = 0
    let g:pymode_rope_complete_on_dot = 1
    
    " Ignore missing docstring error
    let g:pymode_lint_ignore = "C0111,D100,D101,D102,D103" 
endif


"== == == == == == == == == == == == == == == == == == == == == == == == == ==
"  Unite Menu for python tools
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.python = {
    \ 'description' : '         python tools
    \                                          ⌘ [space]p',
    \}

" push candidates for commands
let g:unite_source_menu_menus.python.command_candidates = [
        \ ['▷ run python code                            (pymode)        ⌘ <Leader>r', 'PymodeRun'],
        \ ['▷ show docs for the current word             (pymode)        ⌘ K', 'normal K'],
        \ ['▷ insert a breakpoint                        (pymode)        ⌘ <Leader>B', 'normal <Leader>B'],
        \ ['▷ pylint check                               (pymode)        ⌘ <Leader>n', 'PymodeLint'],
        \ ['▷ pylint auto correct                        (pymode)        ⌘ <Leader>N', 'PymodeLintAuto'],
        \ ['▷ go to definition                           (pymode-rope)   ⌘ C-C g', 'call pymode#rope#goto_definition()'],
        \ ['▷ find where a function is used              (pymode-rope)   ⌘ C-C f', 'call pymode#rope#find_it()'],
        \ ['▷ show docs for current word                 (pymode-rope)   ⌘ C-C d', 'call pymode#rope#show_doc()'],
        \ ['▷ reorganize imports                         (pymode-rope)   ⌘ C-C r o', 'call pymode#rope#organize_imports()'],
        \ ['▷ refactorize - rename                       (pymode-rope)   ⌘ C-C r r', 'call pymode#rope#rename()'],
        \ ['▷ refactorize - inline                       (pymode-rope)   ⌘ C-C r i', 'call pymode#rope#inline()'],
        \ ['▷ refactorize - move                         (pymode-rope)   ⌘ C-C r v', 'call pymode#rope#move()'],
        \ ['▷ refactorize - use function                 (pymode-rope)   ⌘ C-C r u', 'call pymode#rope#use_function()'],
        \ ['▷ refactorize - change signature             (pymode-rope)   ⌘ C-C r s', 'call pymode#rope#signature()'],
        \ ['▷ refactorize - rename current module        (pymode-rope)   ⌘ C-C r 1 r', 'PymodeRopeRenameModule'],
        \ ['▷ refactorize - module to package            (pymode-rope)   ⌘ C-C r 1 p', 'PymodeRopeModuleToPackage'],
        \ ['▷ list virtualenvs                           (virtualenv)', 'Unite output:VirtualEnvList'],
        \ ['▷ activate virtualenv                        (virtualenv)', 'VirtualEnvActivate'],
        \ ['▷ deactivate virtualenv                      (virtualenv)', 'VirtualEnvDeactivate'],
        \ ['▷ run coverage2                              (coveragepy)', 'call system("coverage2 run ".bufname("%")) | Coveragepy report'],
        \ ['▷ run coverage3                              (coveragepy)', 'call system("coverage3 run ".bufname("%")) | Coveragepy report'],
        \ ['▷ toggle coverage report                     (coveragepy)', 'Coveragepy session'],
        \ ['▷ toggle coverage marks                      (coveragepy)', 'Coveragepy show'],
        \ ]

let g:unite_source_menu_menus.python.command_candidates =
            \ custom_functions#unite_menu_gen(g:unite_source_menu_menus.python.command_candidates, [])

nnoremap <silent>[menu]p :Unite -silent -winheight=42 menu:python<CR>
