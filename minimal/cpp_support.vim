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
    " completions
    Plug 'Shougo/neocomplete.vim'

    " syntax checkers
    Plug 'w0rp/ale'

    " --- snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'

    " --- supertab
    Plug 'ervandew/supertab'

    " --- utilities section
    Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }

    " -- languages
    "Plug 'osyo-manga/vim-marching'
    Plug 'osyo-manga/vim-cpp-syntax-reserved_identifiers', { 'for': 'cpp' }
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

    "Plug 'vim-scripts/OmniCppComplete'

    "Plug 'justmao945/vim-clang',             { 'for': ['cpp','c'] }         " clang completion plugin for vim
    
    Plug 'Rip-Rip/clang_complete',
                \ {
                \ 'for': ['c', 'cpp']
                \ }
call plug#end()


" UltiSnips
let g:UltiSnipsExpandTrigger       = "<c-z>"
let g:UltiSnipsJumpForwardTrigger  = "<c-z>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
let g:UltiSnipsUsePythonVersion    = 3


"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

if has_key(g:plugs, 'vim-marching')
    au! BufEnter *.cpp,*.c setlocal omnifunc=marching#complete
    "let s:marching_clang_library         = '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin'
    "let s:marching_clang_library         = '/Library/Developer/CommandLineTools/usr'
    let s:marching_clang_library         = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr'

    let g:marching_clang_command         = s:marching_clang_library . '/bin/clang'
    let g:marching_backend               = 'clang_command'
    let g:marching#clang_command#options = {
                \ 'cpp' : '-std=gnu++1y'
                \ }
    let g:marching_include_paths = [
                \ '/usr/include',
                \ '/usr/local/include',
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/9.1.0/include',
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
                \ ]
    let g:marching_enable_neocomplete     = 1
    let g:marching_enable_refresh_always  = 1
    let g:marching_debug                  = 1

    set updatetime=200

    imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
    imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
endif

if has_key(g:plugs, 'vim-clang')
    let g:clang_auto                            = 1
    let g:clang_vim_exec                        = 'vim'
    let g:clang_exec                            = '/usr/bin/clang'
    let g:clang_c_options                       = '-std=c11'
    let g:clang_cpp_options                     = '-std=gnu++1y -stdlib=libc++'
    let g:clang_format_exec                     = 'clang-format'
    let g:clang_format_style                    = 'LLVM'
    let g:clang_enable_format_command           = 1
    let g:clang_include_sysheaders              = 1
    let g:clang_c_completeopt                   = 'longest,menuone'
    let g:clang_cpp_completeopt                 = 'longest,menuone,preview'
    let g:clang_verbose_pmenu                   = 1
    let g:clang_debug                           = 1     " 4 is highest
    let g:clang_diagsopt                        = 'rightbelow'
    let g:clang_sh_exec                         = 'bash'
    let g:clang_statusline                      = '%s\ \|\ %%l/\%%L\ \|\ %%p%%%%'
    let g:clang_use_path                        = 1
    "au FileType c,cpp,objc,objcpp setl omnifunc = clang_complete#ClangComplete
    "let g:clang_compilation_database           = './build'
endif

if has_key(g:plugs,'clang_complete')
    " set proper omnifunc to ClangComplete
    "au FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete

    " set the location of the pre-built llvm-clang for osx
    "let s:xcode_usr_path  = '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/'
    "let s:xcode_usr_path  = '/Library/Developer/CommandLineTools/usr'
    let s:xcode_usr_path  = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/'
    if isdirectory(s:xcode_usr_path)
        let g:clang_exec         = s:xcode_usr_path . 'bin/clang'
        let g:clang_library_path = s:xcode_usr_path . 'lib/libclang.dylib'
    endif

    " user options for clang
    let g:clang_user_options =
                \ '-std=gnu++1y' .
                \ '-stdlib=libc++' .
                \ '-I' . s:xcode_usr_path .
                \ '-I/usr/include' .
                \ '-I/usr/local/include' .
                \ '-I/usr/local/opt/opencv/include'

    let g:clang_sort_algo                          = 'priority'
    let g:clang_snippets                           = 1
    let g:clang_snippets_engine                    = 'clang_complete'
    let g:clang_complete_optional_args_in_snippets = 1

    let g:clang_complete_auto               = 1  " if 0 disable auto completion use <c-x> <c-o>
    let g:clang_auto_select                 = 1
    let g:clang_close_preview               = 1
    let g:clang_use_library                 = 1
    let g:clang_complete_copen              = 1
    let g:clang_hl_errors                   = 1
    let g:clang_complete_copen              = 1  " clang errors in the quickfix
    let g:clang_omnicppcomplete_compliance  = 0  " this makes <C-X><C-U> as main clang completion
    "let g:clang_user_options               = '-std=c++1y -I ' . s:xcode_usr_path . 'include/c++/v1 -I /usr/local/include'
endif


if has_key(g:plugs, 'OmniCppComplete')
    let g:OmniCpp_NamespaceSearch     = 1
    let g:OmniCpp_GlobalScopeSearch   = 1
    let g:OmniCpp_DisplayMode         = 1
    let g:OmniCpp_ShowScopeInAbbr     = 0   " do not show namespace in pop-up
    let g:OmniCpp_ShowPrototypeInAbbr = 1   " show function parameters
    let g:OmniCpp_ShowAccess          = 1   " show access in pop-up
    let g:OmniCpp_SelectFirstItem     = 0   " if 1 select first item in pop-up
    let g:OmniCpp_MayCompleteDot      = 1   " autocomplete after .
    let g:OmniCpp_MayCompleteArrow    = 1   " autocomplete after ->
    let g:OmniCpp_MayCompleteScope    = 1   " autocomplete after ::
    let g:OmniCpp_DefaultNamespaces   = ['std', '_GLIBCXX_STD']
    " we want omni completion to be done by clang...so commenting this
    "setlocal omnifunc=syntaxcomplete#Complete  "override built-in C omnicomplete with C++ OmniCppComplete plugin
    au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
endif


" Cpp Enhanced Highlight
let g:cpp_class_scope_highlight = 1

let g:ale_completion_enabled = 0
let g:ale_completion_delay = -1
let g:ale_echo_delay = 300
let g:ale_lint_on_text_changed = 'always'
let g:ale_cpp_clang_executable = '/usr/bin/clang'
let g:ale_cpp_clang_options = '-std=gnu++1y -stdlib=libc++ -Wall'
let g:ale_cpp_gcc_options = '-std=c++1y -stdlib=libc++ -Wall'


" vim: tabstop=4 shiftwidth=4 softtabstop=4 expandtab
