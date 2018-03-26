" ------------------------------------------------------------------------------
" -------        JAVASCRIPT Syntax and Completions Configuration          ------
" ------------------------------------------------------------------------------

"  for proper javascript indentation
autocmd FileType javascript set tabstop=4|setl shiftwidth=4|setl shiftwidth=4|setl expandtab|setl autoindent
au BufEnter *.js setl ai sw=4 ts=4 sts=4

" {{{ for tern completions with omnifunc
if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif

let g:neocomplete#sources#omni#functions.javascript = [
            \ 'tern#Complete',
            \ 'jspc#omni'
            \ ]

if exists('g:plugs["tern_for_vim"]')
    let g:tern#command                      = ['tern']
    let g:tern#arguments                    = ['--persistent']
    let g:tern_map_keys                     = 1
    let g:tern_show_signature_in_pum        = 1
    let g:tern_show_argument_hints          = 'on_hold'
    let tern#is_show_argument_hints_enabled = 1

    " set autocompletion
    autocmd FileType javascript setlocal omnifunc=tern#Complete

    function! s:gotodef() abort
        if exists(':TernDef')
            TernDef
        endif
    endfunction
endif
"}}}

"{{{ nodejs omnifunc for vim
"    refer https://github.com/myhere/vim-nodejs-complete
if has_key(g:plugs, 'vim-nodejs-complete')
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    "autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
    " default omnifunc is javascriptcomplete#CompleteJS
    " if jscomplete is needed as omnifunc, uncomment below
    " if filereadable(expand("~/.vim/plugged/jscomplete-vim/autoload/jscomplete.vim"))
    "     let g:nodejs_complete_config = {
    "         \ 'js_compl_fn': 'jscomplete#CompleteJS',
    "         \ 'max_node_compl_len': 0
    "         \ }
    " endif
endif
"}}}


"{{{ utility function for javascript Tern Definitions
function! GoToDef()
    if exists(':TernDef')
        TernDef
    endif
endfunction
"}}}

" ternjs with deoplete
if isdirectory(expand('~/.vim/plugged/deoplete.nvim'))
    " Set bin if you have many instalations
    let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
    let g:deoplete#sources#ternjs#timeout  = 1
    " Whether to include the types of the completions in the result data. Default: 0
    let g:deoplete#sources#ternjs#types = 1
    " Whether to include the distance (in scopes for variables, in prototypes for
    " properties) between the completions and the origin position in the result
    " data. Default: 0
    let g:deoplete#sources#ternjs#depths = 1
    " Whether to include documentation strings (if found) in the result data.
    " Default: 0
    let g:deoplete#sources#ternjs#docs = 1
    " When on, only completions that match the current word at the given point will
    " be returned. Turn this off to get all results, so that you can filter on the
    " client side. Default: 1
    let g:deoplete#sources#ternjs#filter = 0
    " Whether to use a case-insensitive compare between the current word and
    " potential completions. Default 0
    let g:deoplete#sources#ternjs#case_insensitive = 1
    " When completing a property and no completions are found, Tern will use some
    " heuristics to try and return some properties anyway. Set this to 0 to
    " turn that off. Default: 1
    let g:deoplete#sources#ternjs#guess = 0
    " Determines whether the result set will be sorted. Default: 1
    let g:deoplete#sources#ternjs#sort = 0
    " When disabled, only the text before the given position is considered part of
    " the word. When enabled (the default), the whole variable name that the cursor
    " is on will be included. Default: 1
    let g:deoplete#sources#ternjs#expand_word_forward = 0
    " Whether to ignore the properties of Object.prototype unless they have been
    " spelled out by at least two characters. Default: 1
    let g:deoplete#sources#ternjs#omit_object_prototype = 0
    " Whether to include JavaScript keywords when completing something that is not
    " a property. Default: 0
    let g:deoplete#sources#ternjs#include_keywords = 1
    " If completions should be returned when inside a literal. Default: 1
    let g:deoplete#sources#ternjs#in_literal = 0
    "Add extra filetypes
    let g:deoplete#sources#ternjs#filetypes = [
                    \ 'jsx',
                    \ 'javascript.jsx',
                    \ 'javascript',
                    \ ]
endif


" ------------------------------------------------------------------------------------
" -----------      javascript code beautifying & character concealing      -----------
" ------------------------------------------------------------------------------------
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call JsBeautify()<cr>

nnoremap <leader>jsf :%!js-beautify -j -q -B -f -<CR>

" Character Concealing enable in the editor mode
set conceallevel=1

" for jsdoc stntax highlight and character concealing
" https://github.com/pangloss/vim-javascript
if has_key(g:plugs,'vim-javascript')
    let g:javascript_conceal_function       = "ƒ"
    let g:javascript_conceal_null           = "ø"
    let g:javascript_conceal_this           = "@"
    let g:javascript_conceal_return         = "⇚"
    let g:javascript_conceal_undefined      = "¿"
    let g:javascript_conceal_NaN            = "ℕ"
    let g:javascript_conceal_prototype      = "¶"
    let g:javascript_conceal_static         = "•"
    let g:javascript_conceal_super          = "Ω"
    let g:javascript_conceal_arrow_function = "⇒"

    let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_ngdoc = 1
    let g:javascript_plugin_flow  = 1
endif

map <leader>jcl :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

if (has_key(g:plugs, 'vim-jsx-pretty'))
    let g:vim_jsx_pretty_colorful_config = 1
endif

" javascript-libraries-syntax customization
if isdirectory(expand('~/.vim/plugged/javascript-libraries-syntax.vim'))
    let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,react,jquery,chai,d3'
endif

" syntax checking with syntastic
if (has_key(g:plugs, 'syntastic'))
    " real time syntax checking with jshint lint for javascript
    " jshint will be installed as a dependency while installing the syntastic
    " vim plugin using the underlying os x npm installer
    " -- for a local install of the eslint or a global
    let g:syntastic_javascript_eslint_exe     = '[ -f $(npm bin)/eslint ] && $(npm bin)/eslint || eslint'
    let g:syntastic_javascript_eslint_exec    = '/bin/ls'
    let g:syntastic_javascript_eslint_generic = 1
    let g:syntastic_javascript_eslint_args    = '-f compact'
    let g:syntastic_javascript_checkers       = ['eslint', 'jshint', 'jslint', 'jsxhint']
    let g:syntastic_check_on_open             = 0 " show any js linting errors immediately
    let g:syntastic_javascript_jsxhint_exec   = 'jsx-jshint-wrapper'
    "let g:syntastic_javascript_checkers      = ['eslint', 'jshint', 'jsxhint', 'jscs']
endif


"{{{ for vim-jsx settings
if has_key(g:plugs, 'vim-jsx')
    " if 1 (default) expects jsx files to have .jsx extension
    " if 0 .js files will also be opened as filetype javascript.jsx
    let g:jsx_ext_required = 1
endif
"}}}

" ------------------------------------------------------------------------------------
" -------                settings for the jshint2 js linting                   -------
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'jshint2.vim')
    let jshint2_read  = 1   " lint files after reading it
    let jshint2_save  = 1   " lint files after saving it
    let jshint2_close = 0   " do not automatically close orphaned error lists
endif

" ------------------------------------------------------------------------------------
" -----                 settings for vim-js-context-coloring                     -----
" ------------------------------------------------------------------------------------
" let g:js_context_colors_colorize_comments        = 1    " colorize comments
" let g:js_context_colors_show_error_message       = 1    " handling error mesages
" let g:js_context_colors_highlight_function_names = 1    " highlight function names
" let g:js_context_colors_block_scope              = 1    " color scope
" let g:js_context_colors_jsx                      = 1    " colors for jsx files
" let g:js_context_colors_allow_jsx_syntax         = 1    " colors allowed for es6 and jsx

" ------------------------------------------------------------------------------------
" -----                 settings for galooshi/vim-import-js                      -----
" ------------------------------------------------------------------------------------
if (has_key(g:plugs,'vim-import-js'))
    nnoremap <silent><buffer> <F4> :ImportJSWord<CR>
    nnoremap <silent><buffer> <Leader>ji :ImportJSWord<CR>
    nnoremap <silent><buffer> <Leader>jf :ImportJSFix<CR>
    nnoremap <silent><buffer> <Leader>jg :ImportJSGoto<CR>

    inoremap <silent><buffer> <F4> <Esc>:ImportJSWord<CR>a
    inoremap <silent><buffer> <C-j>i <Esc>:ImportJSWord<CR>a
    inoremap <silent><buffer> <C-j>f <Esc>:ImportJSFix<CR>a
    inoremap <silent><buffer> <C-j>g <Esc>:ImportJSGoto<CR>a
endif

" ------------------------------------------------------------------------------------
" -----                  settings for heavenshell/vim-jsdoc                      -----
" ------------------------------------------------------------------------------------
if has_key(g:plugs, 'vim-jsdoc')
    let g:jsdoc_allow_input_prompt = 1 " allow prompt for interactive input
    let g:jsdoc_input_description  = 1 " prompt for the function description
    let g:jsdoc_enable_es6         = 1 " enable the usage of ECMAScript6's shorthand function notations
    let g:jsdoc_underscore_private = 1 " turn on the detection of functions starting with an underscore as private functions
endif

" for some nicer looking colors
highlight xmlAttrib ctermfg=121
highlight jsThis ctermfg=224
highlight jsSuper ctermfg=13
highlight jsFuncCall ctermfg=cyan
highlight jsComment ctermfg=245 ctermbg=none
highlight jsClassProperty ctermfg=14 cterm=bold
