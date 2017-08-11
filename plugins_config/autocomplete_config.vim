" ------------------------------------------------------------------------------------
" ----------    Next generation completion framework after NeoComplcache    ----------
" ----------            NeoComplcache (advanced auto completion)            ----------
" ----------       using neocomplete instead of the neocomplete cache       ----------
" ------------------------------------------------------------------------------------
let g:acp_enableAtStartup                            = 0             " for disabling the AutoComplPop
let g:neocomplete#enable_at_startup                  = 1             " use neocomplete at startup
let g:neocomplete#enable_smart_case                  = 1             " use smart-case
let g:neocomplete#enable_camel_case                  = 1
let g:neocomplete#enable_fuzzy_completion            = 1
let g:neocomplete#sources#syntax#min_keyword_length  = 1             " set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern           = '\*ku\*'      " regex for buffer name
let g:neocomplete#enable_auto_delimiter              = 1
let g:neocomplete#enable_auto_select                 = 0             " AutoComplPop like behaviour
let g:neocomplete#enable_refresh_always              = 1

" define a dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default'     : '',
            \ 'vimshell'    : $HOME . '/.vim/dict/.vimshell_hist',
            \ 'scheme'      : $HOME . '/.vim/dict/.gosh_completions',
            \ 'erlang'      : $HOME . '/.vim/dict/erlang.dict',
            \ 'javascript'  : $HOME . '/.vim/dict/javascript.dict',
            \ 'scala'       : $HOME . '/.vim/dict/scala.dict',
            \ 'int-erl'     : $HOME . '/.vim/dict/erlang.dict',
            \ 'objc'        : $HOME . '/.vim/dict/objc.dict'
            \ }

if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.c          = 'ref-man,ref-erlang'
let g:neocomplete#same_filetypes.ruby       = 'ref-refe'
let g:neocomplete#same_filetypes.erlang     = 'ref-erlang'
let g:neocomplete#same_filetypes.objc       = 'c'
let g:neocomplete#same_filetypes['int-erl'] = 'erlang,ref-erlang'

" {{{ settings for enabling the OmniCompletion for various languages

"set omnifunc=syntaxcomplete#Complete
autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c             set      omnifunc=ccomplete#CompleteCpp
"autocmd FileType c set omnifunc=ccomplete#Complete
" using tern completion instead of CompleteJS
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

if has('python3')
    autocmd FileType python setlocal omnifunc=python3complete#Complete
else
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
endif

" }}}

"{{{ neocomplete patterns
"    define the keyword patterns
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\k*'

" enable heavy omni completion
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp          = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.python       = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#sources#omni#input_patterns.c          = '\%(\.\|->\)\h\w*'
let g:neocomplete#sources#omni#input_patterns.cpp        = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.javascript = '\%(\h\w*\|[^. \t]\.\w*\)'
let g:neocomplete#sources#omni#input_patterns.markdown   = ''
let g:neocomplete#sources#omni#input_patterns.gitcommit  = ''
let g:neocomplete#sources#omni#input_patterns.go         = '[^.[:digit:] *\t]\.\w*'
let g:neocomplete#sources#omni#input_patterns.erlang     = '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'

"}}}

"{{{
let g:neocomplete#sources#vim#complete_functions = {
            \ 'Unite': 'unite#complete_source',
            \ 'VimShell': 'vimshell#complete'
            \ }
"}}}

"{{{ omni patterns for external plugins

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions        = {}
endif

let g:neocomplete#sources#omni#functions.go      = 'gocomplete#Complete'
let g:neocomplete#sources#omni#functions.clojure = 'vimclojure#OmniCompletion'

"}}}

"{{{ plugin key mappings for NeoComplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-e> neocomplete#cancel_popup()
"}}}
