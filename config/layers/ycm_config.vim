" =============================================================================
" ---      YouCompleteMe auto completion in gui mode for MacVim             ---
" =============================================================================
let s:fts = ['c', 'cpp']

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB key 
"if has_key(g:plugs, 'youcompleteme') && (exists('g:vim_auto_complete_engine') && g:vim_auto_complete_engine ==# 'youcompleteme')
if has_key(g:plugs, 'youcompleteme') && has('gui_macvim')
    " custom functions
    " make UltiSnips works nicely with YCM
    function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
            if pumvisible()
                return "\<C-n>"
            else
                call UltiSnips#JumpForwards()
                if g:ulti_jump_forwards_res == 0
                    return "\<TAB>"
                endif
            endif
        endif
        return ''
    endfunction

    " Expand snippet or return
    let g:ulti_expand_res = 1
    function! Ulti_ExpandOrEnter()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res
            return ''
        else
            return "\<return>"
        endif
    endfunction
    " Set <space> as primary trigger
    inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

    function! g:UltiSnips_Reverse()
        call UltiSnips#JumpBackwards()
        if g:ulti_jump_backwards_res == 0
            return "\<C-P>"
        endif
    
        return ''
    endfunction


    if has_key(g:plugs,'jedi-vim')
        let g:jedi#auto_initialization = 0
    endif

    "if (has('gui_macvim') && index(s:fts, &filetype) != -1)
    "    call NeoCompleteToggle()
    "endif

    " =============================================================================
    " choose the python binary to select while using YouCompleteMe
    " =============================================================================
    if has('python3')
        let g:ycm_python_binary_path        = '/usr/local/bin/python3'
        let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
    else
        let g:ycm_python_binary_path        = 'python'
        let g:ycm_server_python_interpreter = 'python'
    endif

    let g:ycm_filetype_specific_completion_to_disable = {
                \ 'gitcommit': 1,
                \ 'tagbar' : 1,
                \ 'nerdtree' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'csv' : 1,
                \ }

    "au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set completefunc=youcompleteme#CompleteFunc

    " ------------------------------------------------------------------------------------
    " --- miscellaneous ycmd settings (https://valloric.github.io/YouCompleteMe)       ---
    " --- additional ycm settings including the location of configuration file         ---
    " ------------------------------------------------------------------------------------
    let g:airline#extensions#ycm#enabled                    = 1
    let g:ycm_confirm_extra_conf                            = 0
    let g:ycm_global_ycm_extra_conf                         = '~/.vim/config/.ycm_extra_conf.py'
    let g:ycm_extra_conf_globlist                           = ['~/.vim/plugged/youcompleteme/third_party/ycmd/cpp/ycm/*','!~/*']
    let g:ycm_extra_conf_vim_data                           = [ '&filetype' ]
    let g:ycm_auto_trigger                                  = 1
    let g:ycm_enable_diagnostic_highlighting                = 1
    let g:ycm_enable_diagnostic_signs                       = 1
    let g:ycm_max_diagnostics_to_display                    = 10000
    let g:ycm_min_num_identifier_candidate_chars            = 0
    let g:ycm_min_num_of_chars_for_completion               = 1
    let g:ycm_open_loclist_on_ycm_diags                     = 1
    let g:ycm_always_populate_location_list                 = 1
    let g:ycm_show_diagnostics_ui                           = 1
    let g:ycm_collect_identifiers_from_tags_files           = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_comments                          = 1
    let g:ycm_complete_in_strings                           = 0
    let g:ycm_complete_in_comments_and_strings              = 1
    let g:ycm_add_preview_to_completeopt                    = 1
    let g:ycm_autoclose_preview_window_after_completion     = 1
    let g:ycm_cache_omnifunc                                = 0
    let g:ycm_use_ultisnips_completer                       = 1   "default 1, just ensure
    let g:ycm_seed_identifiers_with_syntax                  = 1
    let g:ycm_filepath_completion_use_working_dir           = 1   "completion for programming languages
    let g:ycm_goto_buffer_command                           = 'vertical-split'
    let g:ycm_server_log_level                              = 'debug'
    let g:ycm_key_list_stop_completion                      = ['']
    let g:ycm_filetype_blacklist                            = {
                \ 'tagbar'   : 1,
                \ 'qf'       : 1,
                \ 'notes'    : 1,
                \ 'unite'    : 1,
                \ 'vimwiki'  : 1,
                \ 'pandoc'   : 1,
                \ 'infolog'  : 1,
                \ 'mail'     : 1,
                \ 'help'     : 1
                \ }
    "let g:ycm_key_invoke_completion  = '<C-Space>'
    let g:ycm_extra_conf_vim_data    = [ '&filetype' ]


    " semantic triggers
    let g:ycm_semantic_triggers = get(g:, 'ycm_semantic_triggers', {})
    function! s:set_ft_triggers(ft, expr, override) abort
        if a:override
            let g:ycm_semantic_triggers[a:ft] = a:expr
        elseif !has_key(g:ycm_semantic_triggers, a:ft)
            let g:ycm_semantic_triggers[a:ft] = a:expr
        endif
    endfunction

    call s:set_ft_triggers('c', ['->', '.'], 0)
    call s:set_ft_triggers('objc', ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s','re!\[.*\]\s'], 0)
    call s:set_ft_triggers('ocaml', ['.', '#'], 0)
    call s:set_ft_triggers('cpp,objcpp', ['->', '.', '::'], 0)
    call s:set_ft_triggers('perl', ['->'], 0)
    call s:set_ft_triggers('php', ['->', '::'], 0)
    call s:set_ft_triggers('python', ['.'], 0)
    call s:set_ft_triggers('cs,javascript,d,perl6,scala,vb,elixir,go', ['.'], 0)
    call s:set_ft_triggers('java,jsp', ['.'], 0)
    call s:set_ft_triggers('vim', ['$', '&', 're![\w&$<-][\w:#<>-]*'], 0)
    call s:set_ft_triggers('ruby', ['.', '::'], 0)
    call s:set_ft_triggers('lua', ['.', ':'], 0)
    call s:set_ft_triggers('erlang', [':'], 0)
    call s:set_ft_triggers('haskell', ['.', 'rel!.'], 0)
    call s:set_ft_triggers('sh', ['re![\w-]{2}', '/', '-'], 0)
    call s:set_ft_triggers('zsh', ['re![\w-]{2}', '/', '-'], 0)

    " #############################################################################
    " old semantic trigger
    " 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})']

    " Default YCM key bindings conflict with those of UltiSnips. Both YCM and UltiSnips
    " suggest mapping expansion triggers to different keys, which did was a bit fuzzy,
    " so decided to remove any key maps for ycm.
    " we will be able to cycle through completion with <C-N> and <C-P> keys

    " let g:ycm_key_list_select_completion   = []
    " let g:ycm_key_list_previous_completion = []
    " #############################################################################

    " =============================================================================
    " turn off and turn on YCM
    " =============================================================================
    "nnoremap <leader>ycx :let g:ycm_auto_trigger=0<CR>
    "nnoremap <leader>ycy :let g:ycm_auto_trigger=1<CR>
    let g:lmap = get(g:, 'lmap', {})
    let g:lmap.t.y = {
                \ 'name': 'YouCompleteMe ',
                \ 'x' : [':let g:ycm_auto_trigger=0', 'Toggle YCM Off '],
                \ 'y' : [':let g:ycm_auto_trigger=1', 'Toggle YCM On '],
                \ }

    " =============================================================================
    "    for UltiSnips, SuperTab & YCM Integration
    "    if !empty(glob('~/.vim/plugged/ultisnips/plugin/UltiSnips.vim'))
    " =============================================================================
    if has_key(g:plugs, 'ultisnips') && has_key(g:plugs, 'supertab')
        " make YCM compatible with UltiSnips (using supertab)
        let g:ycm_key_list_select_completion             = ['<C-n>', '<Down>']
        let g:ycm_key_list_previous_completion           = ['<C-p>', '<Up>']
        let g:SuperTabCrMapping                          = 'C-n'
        " better key bindings for UltiSnipsExpandTrigger
        " remap Ultisnips for compatibility for YCM
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
        augroup ycm_ultisnips
            autocmd!
            au InsertEnter * exec 'inoremap <silent> ' . g:UltiSnipsExpandTrigger     . ' <C-R>=g:UltiSnips_Complete()<cr>'
            au InsertEnter * exec 'inoremap <silent> ' . g:UltiSnipsJumpBackwardTrigger . ' <C-R>=g:UltiSnips_Reverse()<cr>'
        augroup END
    endif
endif

" =============================================================================
