" JAVASCRIPT Completions Configuration

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" {{{ for tern completions with omnifunc
if !exists('g:neocomplete#omni#functions')
    let g:neocomplete#omni#functions = {}
endif

let g:neocomplete#omni#functions.javascript = [
            \ 'tern#Complete',
            \ 'jspc#omni'
            \ ]

if exists('g:plugs["tern_for_vim"]')
    let g:tern#command               = ['tern']
    let g:tern#arguments             = ['--persistent']
    let g:tern_map_keys              = 1
    let g:tern_show_signature_in_pum = 1
    let g:tern_show_argument_hints   = 'on_hold'
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
"}}}

"{{{ nodejs omnifunc for vim
"    refer https://github.com/myhere/vim-nodejs-complete
if has_key(g:plugs, 'vim-nodejs-complete')
    autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
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


" ------------------------------------------------------------------------------------
" -----------      javascript code beautifying & character concealing      -----------
" ------------------------------------------------------------------------------------
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call JsBeautify()<cr>

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
endif

" javascript-libraries-syntax customization
let g:used_javascript_libs = 'underscore,angularjs,jasmine,chai'

" real time syntax checking with jshint lint for javascript
" jshint will be installed as a dependency while installing the syntastic
" vim plugin using the underlying os x npm installer
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

" show any javascript based linting errors immediately
let g:syntastic_check_on_open = 0


" settings for vim-js-context-coloring
" let g:js_context_colors_colorize_comments        = 1    " colorize comments
" let g:js_context_colors_show_error_message       = 1    " handling error mesages
" let g:js_context_colors_highlight_function_names = 1    " highlight function names
" let g:js_context_colors_block_scope              = 1    " color scope
" let g:js_context_colors_jsx                      = 1    " colors for jsx files
" let g:js_context_colors_allow_jsx_syntax         = 1    " colors allowed for es6 and jsx

"{{{ for vim-jsx settings
if has_key(g:plugs, 'vim-jsx')
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files
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
