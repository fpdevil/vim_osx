"{{{ choose the python binary to select while using YouCompleteMe
if has('python')
    let g:ycm_python_binary_path        = 'python'
    let g:ycm_server_python_interpreter = 'python'
else
    let g:ycm_python_binary_path        = '/usr/local/bin/python3'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
endif
"}}}

if has("gui_running")
    let g:ycm_filetype_specific_completion_to_disable = {
                \ 'gitcommit': 1,
                \ 'tagbar' : 1,
                \ 'nerdtree' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'csv' : 1,
                \ }
endif

" ------------------------------------------------------------------------------------
" --- miscellaneous ycmd settings (https://valloric.github.io/YouCompleteMe)       ---
" --- additional ycm settings including the location of configuration file         ---
" ------------------------------------------------------------------------------------
let g:airline#extensions#ycm#enabled                    = 1
"let g:ycm_confirm_extra_conf                           = 0
let g:ycm_global_ycm_extra_conf                         = '~/.vim/config/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist                           = ['~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
let g:ycm_auto_trigger                                  = 1
let g:ycm_key_invoke_completion                        = '<C-Space>'
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
let g:ycm_complete_in_comments_and_strings              = 1
let g:ycm_add_preview_to_completeopt                    = 1
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_cache_omnifunc                                = 0
let g:ycm_use_ultisnips_completer                       = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_filepath_completion_use_working_dir           = 1
let g:ycm_goto_buffer_command                           = 'vertical-split'
let g:ycm_server_log_level                              = 'debug'
let g:ycm_key_list_select_completion                    = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion                  = ['<C-S-TAB>','<Up>']
let g:ycm_extra_conf_vim_data                           = ['&filetype']


let g:ycm_filetype_blacklist                            = {
            \ 'vim' : 1,
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'md' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \ }

let g:ycm_semantic_triggers =  {
            \ 'c' : ['->', '.'],
            \ 'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s','re!\[.*\]\s'],
            \ 'cpp,objcpp' : ['->', '.', '::'],
            \ 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \ 'erlang' : [':'],
            \ 'haskell' : ['.', 'rel!.']
            \ }

" old semantic trigger
" 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})']

" Default YCM key bindings conflict with those of UltiSnips. Both YCM and UltiSnips
" suggest mapping expansion triggers to different keys, which did was a bit fuzzy,
" so decided to remove any key maps for ycm.
" we will be able to cycle through completion with <C-N> and <C-P> keys

" let g:ycm_key_list_select_completion   = []
" let g:ycm_key_list_previous_completion = []


"{{{ turn off and turn on YCM
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>
"}}}

"{{{ for UltiSnips YCM Integration
"    if !empty(glob('~/.vim/plugged/ultisnips/plugin/UltiSnips.vim'))
if has_key(g:plugs, 'ultisnips') && has_key(g:plugs, 'supertab')
    "let g:UltiSnipsExpandTrigger="<c-j>"
    let g:SuperTabDefaultCompletionType = '<C-n>'
    let g:SuperTabCrMapping             = 0
    let g:UltiSnipsExpandTrigger        = "<tab>"
    let g:UltiSnipsJumpForwardTrigger   = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger  = "<s-tab>"
endif
"}}}
