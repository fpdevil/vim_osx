if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required
set backspace=indent,eol,start

" custom installation helper functions
function! InstallJsHint(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install -g jshint
    endif
endfunction

function! MakeInstall(info)
    if a:info.status ==# 'installed' || a:info.force
        !make install
    endif
endfunction

function! GitRecurse(info)
    if a:info.status ==# 'installed' || a:info.force
        !git submodule update --init --recursive
    endif
endfunction

function! InstallJsBeautify(info)
    if a:info.status ==# 'installed' || a:info.force
        !git submodule update --init --recursive
        !npm install js-beautify
    endif
endfunction

function! BuildTern(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install
        !npm install -g tern
    endif
endfunction

function! GetImport(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install
        !npm install -g import-js
    endif
endfunction

"Function: InstallTS
"Desc: Install TypeScript node binaries
"
"Arguments: info
" check if installed or not
function! InstallTS(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install -g clausreinke/typescript-tools typescript
    endif
endfunction

" function for handling the YouCompleteMe post build and installation
function! YCMBuilder(info)
    " info dictionary structure has following 3 fields
    " -- name: name of plugin
    " -- status: 'installed', 'updated', 'unchanged'
    " -- force: set with PlugInstall! or PlugUpdate!
    if a:info.status ==# 'installed' || a:info.force
        let $EXTRA_CMAKE_ARGS='-DEXTERNAL_LIBCLANG_PATH'
                    \ . '='
                    \ . '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/lib/libclang.dylib'
                    "\ . '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
        !python3 install.py --clang-completer --system-libclang --gocode-completer --tern-completer
        !cd ./third_party/ycmd/third_party/tern_runtime && npm install
    endif
endfunction


call plug#begin('~/.vim/plugged')
    " syntax checkers
    Plug 'w0rp/ale'

    " --- snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'garbas/vim-snipmate'

    " --- supertab
    Plug 'ervandew/supertab'

    " --- utilities section
    Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }

    " -- languages
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'marijnh/tern_for_vim'

    Plug 'justmao945/vim-clang'

    Plug 'youthy/vimerl-complete'

    Plug 'valloric/youcompleteme',
                \ {
                \ 'do': function('YCMBuilder'),
                \ 'for': [ 'c', 'cpp', 'go', 'javascript', 'erlang', 'python', 'haskell' ]
                \ }
call plug#end()

if has('python3')
    let g:ycm_python_binary_path        = '/usr/local/bin/python3'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
else
    let g:ycm_python_binary_path        = 'python'
    let g:ycm_server_python_interpreter = 'python'
endif

let g:ycm_global_ycm_extra_conf                         = '~/vim_osx/config/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_extra_conf_globlist                           = ['~/vim_osx/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
let g:ycm_auto_trigger                                  = 1
let g:ycm_key_invoke_completion                         = '<C-Space>'
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
let g:ycm_complete_in_comments                          = 0
let g:ycm_complete_in_strings                           = 0
let g:ycm_complete_in_comments_and_strings              = 1
let g:ycm_add_preview_to_completeopt                    = 1
let g:ycm_autoclose_preview_window_after_completion     = 1
let g:ycm_cache_omnifunc                                = 0
let g:ycm_use_ultisnips_completer                       = 1
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_filepath_completion_use_working_dir           = 1
let g:ycm_goto_buffer_command                           = 'vertical-split'
let g:ycm_server_log_level                              = 'debug'
let g:ycm_extra_conf_vim_data                           = ['&filetype']
let g:ycm_filetype_blacklist                            = {
            \ 'vim'      : 1,
            \ 'tagbar'   : 1,
            \ 'qf'       : 1,
            \ 'notes'    : 1,
            \ 'markdown' : 1,
            \ 'md'       : 1,
            \ 'unite'    : 1,
            \ 'text'     : 1,
            \ 'vimwiki'  : 1,
            \ 'pandoc'   : 1,
            \ 'infolog'  : 1,
            \ 'mail'     : 1
            \ }


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
call s:set_ft_triggers('cs,javascript,d,python,perl6,scala,vb,elixir,go', ['.'], 0)
call s:set_ft_triggers('java,jsp', ['.'], 0)
call s:set_ft_triggers('vim', ['re![_a-zA-Z]+[_\w]*\.'], 0)
call s:set_ft_triggers('ruby', ['.', '::'], 0)
call s:set_ft_triggers('lua', ['.', ':'], 0)
call s:set_ft_triggers('erlang', [':'], 0)
call s:set_ft_triggers('haskell', ['.', 'rel!.'], 0)
call s:set_ft_triggers('sh', ['re![\w-]{2}', '/', '-'], 0)
call s:set_ft_triggers('zsh', ['re![\w-]{2}', '/', '-'], 0)

" vim: tabstop=4 shiftwidth=4 softtabstop=4 expandtab
