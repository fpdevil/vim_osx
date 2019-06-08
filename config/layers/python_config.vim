"------------------------------------------------------------------------------------
"---------    python/python3 and JEDI syntastic integration for checking    ---------
"----- ycm can also be used,  but pretty happy with the JEDI completion for now -----
"------------------------------------------------------------------------------------
" jedi auto-completion and syntax checking for python3
" the below section first does a check on which version of python to choose

if has('python3')
    let g:jedi#force_py_version        = 3
    let g:pymode_python                = '/usr/local/bin/python3'
elseif has('python')
    let g:jedi#force_py_version        = 2
    let g:pymode_python                = 'python'
else
    let g:loaded_jedi = 1
endif

augroup py
    autocmd!
    " -- completion options display
    au FileType python setlocal completeopt=menu,preview,menuone,longest
    " this is done by jedi plugin (but default python3complete#Complete coming up)
    "au FileType python setlocal omnifunc=jedi#completions
    "au FileType python setlocal completefunc=jedi#completions
    " -- filetype indentation for python (proper pep8)
    au FileType python set tabstop=4|set shiftwidth=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent
    au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
    "spaces for indents and text wraps
    au BufNewFile,BufRead *.py set ts=4 sw=4 textwidth=79 et ai fileformat=unix
augroup end

" ------------------------------------------------------------------------------
"  vim-jedi options
" ------------------------------------------------------------------------------
if isdirectory(expand('~/.vim/plugged/jedi-vim'))
    " set the keymapping for definition browsing (-t)
    "au FileType python let g:jedi#goto_definitions_command   = "<leader>t"
    
    "let g:jedi#auto_vim_configuration = 1
    "let g:jedi#completions_enabled    = 1
    "let g:jedi#popup_select_first     = 0
    
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#completions_enabled    = 1
    
    let g:jedi#goto_assignments_command   = '<leader>lpa'
    let g:jedi#goto_definitions_command   = '<leader>lpg'
    let g:jedi#documentation_command      = '<leader<lpd>'
    let g:jedi#usages_command             = '<leader>lpu'
    let g:jedi#rename_command             = '<leader>lpr'
    let g:jedi#use_splits_not_buffers     = "left"
    let g:jedi#show_call_signatures  = 0
    let g:jedi#show_call_signatures = 1
    if &rtp =~ '\<jedi\>'
        augroup JediSetup
            au!
            au FileType python call jedi#configure_call_signatures()
        augroup END
    endif
endif

if isdirectory(expand('~/.vim/plugged/deoplete-jedi'))
    let g:deoplete#sources#jedi#show_docstring = 1
    let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
endif

" if ropevim is enabled and used for python code assist
if has_key(g:plugs, 'ropevim')
    let g:ropevim_extended_complete=1
endif

" For Syntastic Checker
" custom settings for python through syntastic checker
" if has_key(g:plugs, 'syntastic')
if exists(':SyntasticCheck')
    let g:syntastic_enable_highlighting        = 1
    let g:syntastic_python_checkers            = ['flake8', 'pyflakes', 'pylint']
    let g:syntastic_python_flake8_args         = '--max-line-length=80 ' .
                \ '--max-complexity=10 ' .
                \ '--ignore=D400,E501,E302,E261,E701,E241,E126,E127,E128,W801,' .
                \ 'E111,E114,E121,E125,E129,E131,E133,E201,E202,E203,E211,E221' .
                \ 'E222,E241,E251,E261,E303,E402,W503'
    " not using pylint
    " let g:syntastic_python_pylint_args         = '--disable=C0103'
    " show balloon with mouse hovering over an error
    let g:syntastic_enable_balloons              = 1
    if has('python3')
        let g:syntastic_python_python_exec = '/usr/local/bin/python3'
    elseif has('python')
        let g:syntastic_python_python_exec = 'python'
    endif
endif


" python language specific customizations
" enable all the python syntax highlighting features
let g:python_highlight_all=1

" ------------------------------------------------------------------------------------
" ---                 ultisnips snippets for python2 and python3                   ---
" ------------------------------------------------------------------------------------
if has('python3')
    let g:UltiSnipsUsePythonVersion = 3
else
    let g:UltiSnipsUsePythonVersion = 2
endif


" ------------------------------------------------------------------------------
"  Sort and highlight Python imports in Vim
" ------------------------------------------------------------------------------
"if !empty(glob('~/.vim/plugged/impsort.vim'))
if has_key(g:plugs,'impsort.vim')
    autocmd BufWritePre *.py ImpSort!
endif

" ------------------------------------------------------------------------------
"  for vim-virtualenv
" ------------------------------------------------------------------------------
"if !empty(glob('~/.vim/plugged/vim-virtualenv'))
if has_key(g:plugs,'vim-virtualenv')
    let g:virtualenv_auto_activate = 1
    let g:virtualenv_stl_format    = '(%n)'
endif


" ------------------------------------------------------------------------------
" for python-mode
" ------------------------------------------------------------------------------
" as per https://github.com/davidhalter/jedi-vim
" python-mode VIM plugin seems to  conflict with jedi-vim, therefore you
" should disable it before enabling jedi-vim

"if !empty(glob('~/.vim/plugged/python-mode'))
if has_key(g:plugs,'python-mode')
    let g:pymode_python                  = 'python3'
    let g:pymode_breakpoint_bind         = '<Leader>lpb'

    let g:pymode_trim_whitespaces        = 1
    let g:pymode_options_max_line_length = 300
    let g:pymode_options_colorcolumn     = 0
    let g:pymode_indent                  = 0        " use vim-python-pep8-indent (upstream of pymode)

    let g:pymode_virtualenv              = 0        " use virtualenv plugin (may be required for pylint?)
    let g:pymode_rope                    = 0        " better coordination with jedi

    let g:pymode_rope_completion         = 0
    let g:pymode_rope_complete_on_dot    = 0
    let g:pymode_rope_lookup_project     = 0

    let g:pymode_lint                    = 0        " prefer Syntastic or ALE
    let g:pymode_lint_on_write           = 0
    let g:pymode_lint_cwindow            = 0
    let g:pymode_lint_checkers           = [ '' ]                                  " use ALE linters
    let g:pymode_lint_config             = '$HOME/.pylintrc'
    let g:pymode_lint_ignore             = 'C0111,D100,D101,D102,D103'             " ignore missing docstring error
    " let g:pymode_lint_checkers         = ['pylint', 'pep8', 'mccabe', 'pep257']
    " let g:pymode_lint_ignore           = ''
    
    let g:pymode_breakpoint              = 0

    let g:pymode_syntax                  = 1
    let g:pymode_syntax_all              = 1
    let g:pymode_folding                 = 1
endif

" ------------------------------------------------------------------------------
"  python virtualenv support
" ------------------------------------------------------------------------------
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


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
