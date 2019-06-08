" ====================================================================================
" ---------        customizations and settings for vim-clang and cpp         ---------
" ====================================================================================

" filetype associations and general indent
augroup cpp_sane
    au BufNewFile,BufRead *
                \ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
                \     if &ft != 'cpp'                                                                         |
                \         set ft=cpp                                                                          |
                \     endif                                                                                   |
                \ endif
    autocmd FileType cpp setl shiftwidth=4 softtabstop=4 tabstop=4 makeprg=g++\ %\ -o\ %:t:r
    autocmd FileType c   setl shiftwidth=4 softtabstop=4 tabstop=4 makeprg=gcc\ %\ -o\ %:t:r
augroup END

"{{{ syntastic checker for cpp
" syntastic checker settings for c and c++
if exists(':SyntasticCheck')
    "let g:syntastic_c_compiler                = 'gcc'
    "let g:syntastic_cpp_compiler              = 'g++'

    let g:syntastic_c_compiler                = '/usr/bin/clang'
    let g:syntastic_cpp_compiler              = '/usr/bin/clang++'
    let g:syntastic_cpp_compiler_options      = '-std=c++11 -stdlib=libstdc++ -Wall -Wextra -Weverything'
    let g:syntastic_c_compiler_options        = '-Wall -std=c11'
    let g:syntastic_cpp_cpplint_exec          = '/usr/local/bin/cpplint'
    let g:syntastic_c_checkers                = ['gcc', 'make']
    let g:syntastic_cpp_checkers              = ['cppcheck', 'cpplint', 'gcc']
    let g:syntastic_cpp_check_header          = 1
    let g:syntastic_cpp_remove_include_errors = 1
    let g:syntastic_c_include_dirs            = ['include', '../include']
    let g:syntastic_cpp_include_dirs          = [
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/10.0.0/include',
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
                \ '/usr/include',
                \ '/usr/local/include'
                \ ]
endif
"}}}


" ====================================================================================
" --- async clang code completion (https://github.com/osyo-manga/vim-marching)    ----
"  'cpp' : '-std=c++1y'
" ====================================================================================
if has_key(g:plugs, 'vim-marching')
    " setting of this omnifunc was necessary as ALE checker was overwriting
    " the omnifunc with ClangComplete
    augroup marching_complete
        autocmd!
        au! BufEnter *.cpp,*.c,*.h,*.hpp setlocal omnifunc=marching#complete
    augroup END

    set completeopt=menuone,menu,longest,preview

    "let s:marching_clang_library         = '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin'
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
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include',
                \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
                \ ]
    let g:marching_enable_neocomplete     = 1
    let g:marching_enable_refresh_always  = 1
    let g:marching_debug                  = 1

    set updatetime=200

    au FileType *.cpp *.c *.hpp *.h imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)
    au FileType *.cpp *.c *.hpp *.h imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)
endif


" =============================================================================
"                   clang for completing C/C++ code
" =============================================================================
if has_key(g:plugs,'clang_complete')
    " set proper omnifunc to ClangComplete
    au FileType c,cpp,objc,objcpp setl omnifunc=ClangComplete
    au FileType c,cpp,objc,objcpp setl completefunc=ClangComplete

    " set the location of the pre-built llvm-clang for osx
    "let s:xcode_usr_path  = '/Library/Developer/CommandLineTools/usr'
    let s:xcode_usr_path  = '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/'
    "let s:xcode_usr_path  = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/'

    if isdirectory(s:xcode_usr_path)
        let g:clang_exec         = s:xcode_usr_path . 'bin/clang'
        let g:clang_library_path = s:xcode_usr_path . 'lib/'
    endif

    " user options for clang
    let g:clang_user_options =
                \ '-std=c++1y' .
                \ '-stdlib=libc++' .
                \ '-I' . s:xcode_usr_path .
                \ '-I/usr/include' .
                \ '-I/usr/local/include' .
                \ '-I/usr/local/opt/opencv/include'

    let g:clang_snippets                           = 1
    "let g:clang_snippets_engine                   = 'clang_complete'
    let g:clang_snippets_engine                    = 'ultisnips'
    let g:clang_complete_optional_args_in_snippets = 1

    let g:clang_close_preview                      = 1
    let g:clang_sort_algo                          = 'alpha'
    let g:clang_complete_auto                      = 1  " if 0 disable auto completion use <c-x> <c-o>
    let g:clang_auto_select                        = 1
    let g:clang_close_preview                      = 1
    let g:clang_use_library                        = 1
    let g:clang_complete_copen                     = 1  " clang errors in the quickfix
    let g:clang_omnicppcomplete_compliance         = 1  " this makes <C-X><C-U> as main clang completion
    let g:clang_complete_macros                    = 1
    let g:clang_complete_patterns                  = 1
    let g:clang_make_default_keymappings           = 1
    let g:clang_use_library                        = 1
    let g:clang_debug                              = 1

    "let g:clang_user_options               = '-std=c++1y -I ' . s:xcode_usr_path . 'include/c++/v1 -I /usr/local/include'
endif


" =============================================================================
" Doxygen for CPP and Python Documentation settings
" =============================================================================
autocmd Filetype c,cpp set comments^=:///
let g:DoxygenToolkit_commentType = 'C++'


" =============================================================================
"          vim-clang completions (support c++0x features and use libcxx)
" =============================================================================
" vim-clang supports relative include path in .clang configuration file
" contents of .clang -I.
if has_key(g:plugs, 'vim-clang')
    let g:clang_auto                            = 0
    let g:clang_exec                            = '/usr/bin/clang'
    let g:clang_c_options                       = '-std=c11'
    let g:clang_cpp_options                     = '-std=c++1y -stdlib=libc++'
    let g:clang_format_auto                     = 0
    let g:clang_format_exec                     = 'clang-format'
    let g:clang_format_style                    = 'LLVM'
    let g:clang_enable_format_command           = 1
    let g:clang_include_sysheaders              = 1
    let g:clang_c_completeopt                   = 'longest,menuone'
    let g:clang_cpp_completeopt                 = 'longest,menuone,preview'
    let g:clang_verbose_pmenu                   = 1
    let g:clang_debug                           = 0     " 4 is highest
    let g:clang_diagsopt                        = 'rightbelow'
    let g:clang_sh_exec                         = 'bash'
    let g:clang_statusline                      = '%s\ \|\ %%l/\%%L\ \|\ %%p%%%%'
    let g:clang_use_path                        = 1
    "au FileType c,cpp,objc,objcpp setl omnifunc = clang_complete#ClangComplete
    "let g:clang_compilation_database           = './build'
endif

" =============================================================================
" ---                         vim clang-format setup                        ---
" =============================================================================
let g:clang_format#command       = '/usr/local/bin/clang-format'
let g:clang_format#style_options = {
            \ 'Standard': 'C++11',
            \ 'SortIncludes': 'false',
            \ 'AccessModifierOffset': -4,
            \ 'PointerBindsToType': 'false',
            \ 'DerivePointerBinding': 'false',
            \ 'AllowShortLoopsOnASingleLine': 'false',
            \ 'AllowShortBlocksOnASingleLine' : 'false',
            \ 'AllowShortIfStatementsOnASingleLine': 'false',
            \ 'AlwaysBreakTemplateDeclarations': 'false',
            \ 'AlignConsecutiveDeclarations': 'true',
            \ 'AlignConsecutiveAssignments': 'true',
            \ 'AlignEscapedNewlinesLeft': 'true',
            \ 'AlignTrailingComments': 'true',
            \ 'AlignOperands': 'true',
            \ 'ColumnLimit': 80,
            \ 'TabWidth': 4
            \ }

" default formatting with LLVM
let g:clang_enable_format_command = 1

" select the file type for ClangFormat
augroup clang_format
    au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>= :ClangFormat<cr>
augroup END

" languages to load clang-based plugins for (YCM, color_coded)
let g:clang_languages       = ['c', 'cpp', 'objc', 'python', 'python3']
let g:color_coded_filetypes = ['c', 'cpp', 'objc', 'python', 'python3']

" set the CLANG library path manually
"let s:xcode_usr_path      = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/'
"let s:clang_library_path = s:xcode_usr_path . 'lib/'

" ====================================================================================
" -----               vim-cpp-enhanced-highlight custom settings                 -----
" ====================================================================================
if has_key(g:plugs,'vim-cpp-enhanced-highlight')
    let g:cpp_class_scope_highlight           = 1        " highlight class scope
    let g:cpp_experimental_template_highlight = 1        " highlight template functions
    let g:cpp_concepts_highlight              = 1        " highlight library concepts
    let g:cpp_member_variable_highlight       = 1        " highlight member variables
endif


" ====================================================================================
"                       OmniCppComplete completion engine
" ====================================================================================
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
    "au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
endif

" ====================================================================================
"   preview handling - automatically open and close the popup menu / preview window
" ====================================================================================
augroup cpp_preview
    autocmd!
    "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    autocmd FileType *.cpp *.hpp *.cc setlocal completeopt=menuone,menu,longest,preview
    autocmd FileType *.c setlocal completeopt=menuone,menu,longest,preview
augroup END


" ====================================================================================
" custom function to compile or interpret
" ====================================================================================
func! CompileRunGcc()
    exec "w"
    exec "!gcc --std=c99 -Wall % -o %<.out; ./%<.out"
endfunc

func! CompileRunGpp()
    exec "w"
    exec "!g++ --std=c++14 % -Wall -g -o %<.out && ./%<.out"
endfunc

