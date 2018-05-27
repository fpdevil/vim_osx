" ------------------------------------------------------------------------------------
" ----------    Next generation completion framework after NeoComplcache    ----------
" ----------            NeoComplcache (advanced auto completion)            ----------
" ----------       using neocomplete instead of the neocomplete cache       ----------
" ------------------------------------------------------------------------------------
let s:fts = ['c', 'cpp']


if isdirectory(expand('~/.vim/plugged/neocomplete.vim'))
    let g:acp_enableAtStartup                            = 0             " for disabling the AutoComplPop
    if (has_key(g:plugs, 'youcompleteme') && index(s:fts, &filetype) != -1)
        let g:neocomplete#enable_at_startup              = 0             " do not use neocomplete at startup for c/c++ & ycm
    else
        let g:neocomplete#enable_at_startup              = 1             " use neocomplete at startup
    endif
    let g:neocomplete#data_directory                     = GetCacheDir('neocomplete')
    let g:neocomplete#enable_smart_case                  = 1             " use smart-case
    let g:neocomplete#enable_camel_case                  = 1
    let g:neocomplete#enable_fuzzy_completion            = 1
    let g:neocomplete#sources#syntax#min_keyword_length  = 2             " set minimum syntax keyword length
    let g:neocomplete#sources#syntax#min_syntax_length   = 1
    let g:neocomplete#lock_buffer_name_pattern           = '\*ku\*'      " regex for buffer name
    let g:neocomplete#enable_auto_delimiter              = 1
    let g:neocomplete#enable_auto_select                 = 0             " AutoComplPop like behaviour
    let g:neocomplete#enable_refresh_always              = 0             " increases screen flicker
    let g:neocomplete#use_vimproc                        = 1

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

    if executable('/usr/local/bin/ctags')
        let g:neocomplete#ctags_command = '/usr/local/bin/ctags'
    endif

    if !exists('g:neocomplete#same_filetypes')
        let g:neocomplete#same_filetypes = {}
    endif
    let g:neocomplete#same_filetypes.c          = 'ref-man,ref-erlang'
    let g:neocomplete#same_filetypes.ruby       = 'ref-refe'
    let g:neocomplete#same_filetypes.erlang     = 'ref-erlang'
    let g:neocomplete#same_filetypes.objc       = 'c'
    let g:neocomplete#same_filetypes['int-erl'] = 'erlang,ref-erlang'

    "{{{ neocomplete includes for c/c++
    if !exists('g:neocomplete#sources#inckude#paths')
        let g:neocomplete#sources#include#paths = {}
    endif
    let g:neocomplete#sources#include#paths.cpp = '.,/usr/local/include'
    let g:neocomplete#sources#include#paths.c   = '.,/usr/include'

    let g:neocomplete#sources#include#patterns = { 'c' : '^\s*#\s*include', 'cpp' : '^\s*#\s*include' }
    "}}}

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

    let g:neocomplete#force_overwrite_completefunc = 1
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.javascript   = '[^. \t]\.\w*'
    let g:neocomplete#force_omni_input_patterns.jsx          = '\.'
    let g:neocomplete#force_omni_input_patterns.c            = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp          = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.erlang       = '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'
    let g:neocomplete#force_omni_input_patterns.python       = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

    let g:neocomplete#sources#omni#input_patterns.c          = '\%(\.\|->\)\h\w*'
    let g:neocomplete#sources#omni#input_patterns.cpp        = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.javascript = '\%(\h\w*\|[^. \t]\.\w*\)'
    let g:neocomplete#sources#omni#input_patterns.markdown   = ''
    let g:neocomplete#sources#omni#input_patterns.gitcommit  = ''
    let g:neocomplete#sources#omni#input_patterns.go         = '[^.[:digit:] *\t]\.\w*'
    let g:neocomplete#sources#omni#input_patterns.erlang     = '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'
    let g:neocomplete#sources#omni#input_patterns.clojure    = '\.\|/'
    "}}}

    "{{{ delimiter pattern to smart complete a function
    if !exists('g:neocomplete#delimiter_patterns')
        let g:neocomplete#delimiter_patterns = {}
    endif
    let g:neocomplete#delimiter_patterns.vim    = ['#']
    let g:neocomplete#delimiter_patterns.cpp    = ['::']
    let g:neocomplete#delimiter_patterns.erlang = [':']
    "}}}

    "{{{ decide use source names
	if !exists('g:neocomplete#sources')
	    let g:neocomplete#sources = {}
	endif
	"let g:neocomplete#sources._ = ['buffer']
	"let g:neocomplete#sources.cpp = ['buffer', 'dictionary', 'omni', 'file', 'tag', 'member']
    "}}}

    "{{{
    let g:neocomplete#sources#vim#complete_functions = {
                \ 'Unite': 'unite#complete_source',
                \ 'VimShell': 'vimshell#complete'
                \ }
    "}}}

    "{{{ omni patterns for external plugins
    if !exists('g:neocomplete#sources#omni#functions')
        let g:neocomplete#sources#omni#functions = {}
    endif

    let g:neocomplete#sources#omni#functions.go      = 'gocomplete#Complete'
    "let g:neocomplete#sources#omni#functions.clojure = 'vimclojure#OmniCompletion'
    "}}}

    "{{{ plugin key mappings for NeoComplete
    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-l> neocomplete#complete_common_string()
    inoremap <expr><C-e> neocomplete#cancel_popup()
    "}}}

    " toggle the neo-complete auto selection feature
    function! ToggleNeoComplete()
        if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
            let g:neocomplete#disable_auto_complete = 0
            let g:neocomplete#enable_auto_select    = 0
        elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
            let g:neocomplete#disable_auto_complete = 1
            let g:neocomplete#enable_auto_select    = 0
        elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
            let g:neocomplete#disable_auto_complete = 0
            let g:neocomplete#enable_auto_select    = 1
        endif
    endfunction
    
    " nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>
    " ------------------------------------------------------------------------------------
    "  initialize the leader key map for misc section
    " ------------------------------------------------------------------------------------
    let g:lmap = get(g:, 'lmap', {})
    if has_key(g:lmap,'m')
        let g:lmap.m.c.t = ['call ToggleNeoComplete()', 'Toggle NeoComplete auto-select on/off ']
    endif


    " ------------------------------------------------------------------------------------
    "  unite menu integration for python
    " ------------------------------------------------------------------------------------
    " Unite Menu {{{
    let g:unite_source_menu_menus.code = {
        \ 'description' : '           coding
            \                                                ⌘ [space]c',
        \}
    let g:unite_source_menu_menus.code.command_candidates = [
        \['▷ toggle auto-completion state (manual → disabled → auto)  ⌘ <Leader>ea',
            \'call ToggleNeoComplete()'],
        \['▷ syntastic toggle                           (syntastic)',
            \'SyntasticToggleMode'],
        \['▷ syntastic check & errors                   (syntastic)   ⌘ <Leader>N',
            \'normal <Leader>N'],
        \['▷ count lines of code',
            \'Unite -default-action= output:call\\ LinesOfCode()'],
        \['▷ toggle indent lines                                      ⌘ <Leader>L',
            \'IndentLinesToggle'],
        \]
    
    let g:unite_source_menu_menus.code.command_candidates =
                \ custom_functions#unite_menu_gen(g:unite_source_menu_menus.code.command_candidates, [])
    
    nnoremap <silent>[menu]c :Unite -silent menu:code<CR>
    " END Unite Menu }}}

endif


