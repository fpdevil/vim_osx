" ====================================================================================
" ---------        customizations and settings for vim-clang and cpp         ---------
" ====================================================================================


"{{{ syntastic checker for cpp
" syntastic checker settings for c and c++
"let g:syntastic_c_compiler                = 'gcc'
"let g:syntastic_cpp_compiler              = 'g++'

let g:syntastic_c_compiler                = '/usr/bin/clang'
let g:syntastic_cpp_compiler              = '/usr/bin/clang++'
let g:syntastic_cpp_compiler_options      = '-std=c++11 -stdlib=libstdc++ -Wall -Wextra -Weverything'
let g:syntastic_c_compiler_options        = '-Wall -std=c11'
let g:syntastic_cpp_cpplint_exec          = 'cpplint'
let g:syntastic_c_checkers                = ['gcc', 'make']
let g:syntastic_cpp_checkers              = ['cppcheck', 'cpplint', 'gcc']
let g:syntastic_cpp_check_header          = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_include_dirs          = [
            \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1',
            \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include',
            \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
            \ '/usr/include',
            \ '/usr/local/include',
            \ '/usr/local/opt/opencv3/include'
            \ ]
"}}}

" vim-clang completions
" vim-clang supports relative include path in .clang configuration file
" contents of .clang -I.
if has_key(g:plugs, 'vim-clang')
    let g:clang_c_options                   = '-std=gnu11'
    let g:clang_cpp_options                 = '-std=c++11 -stdlib=libc++'
    autocmd FileType c,cpp setlocal omnifunc=ClangComplete
    "let g:clang_compilation_database = './build'
endif

" =============================================================================
" ---                         vim clang-format setup                        ---
" =============================================================================
let g:clang_format#command       = "/usr/local/bin/clang-format"
let g:clang_format#style_options = {
            \ "Standard": "C++11",
            \ "SortIncludes": "false",
            \ "AccessModifierOffset": -4,
            \ "PointerBindsToType": "false",
            \ "DerivePointerBinding": "false",
            \ "AllowShortLoopsOnASingleLine": "false",
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "AlwaysBreakTemplateDeclarations": "false",
            \ "AlignConsecutiveDeclarations": "true",
            \ "AlignConsecutiveAssignments": "true",
            \ "AlignEscapedNewlinesLeft": "true",
            \ "AlignTrailingComments": "true",
            \ "AlignOperands": "true",
            \ "ColumnLimit": 80,
            \ "TabWidth": 4
            \ }

" default formatting with LLVM
let g:clang_enable_format_command = 1

" select the file type for ClangFormat
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>= :ClangFormat<cr>

" languages to load clang-based plugins for (YCM, color_coded)
let g:clang_languages       = ['c', 'cpp', 'objc', 'python', 'haskell']
let g:color_coded_filetypes = ['c', 'cpp', 'objc', 'python', 'haskell']

" set the CLANG library path manually
"let s:xcode_usr_path      = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/'
"let s:clang_library_path = s:xcode_usr_path . 'lib/'

if has_key(g:plugs,'clang-complete') || has_key(g:plugs,'clang_complete')
    let g:clang_exec          = "/usr/bin/clang"
    let s:clang_library_path  = '/Library/Developer/CommandLineTools/usr/lib'
    if isdirectory(s:clang_library_path)
        let g:clang_library_path=s:clang_library_path
    endif

    " user options for clang
    let g:clang_user_options =
                \ '-std=c++11' .
                \ '-stdlib=libc++' .
                \ '-I/usr/include' .
                \ '-I/usr/local/include' .
                \ '-I/usr/local/opt/opencv3/include' .
                \ '-I/usr/local/Cellar/opencv3/HEAD-a4db983_4/include'
    let g:clang_sort_algo       = "priority"
    let g:clang_snippets_engine = "ultisnips"

    let g:clang_complete_auto  = 0
    let g:clang_auto_select    = 1
    let g:clang_use_library    = 1
    let g:clang_snippets       = 1
    let g:clang_complete_copen = 1
    let g:clang_hl_errors      = 1
    " let g:clang_user_options = '-std=c++1y -I ' . s:xcode_usr_path . 'include/c++/v1 -I /usr/local/include'
endif

" Doxygen for CPP and Python Documentation settings
autocmd Filetype c,cpp set comments^=:///
let g:DoxygenToolkit_commentType = "C++"

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
" --- async clang code completion (https://github.com/osyo-manga/vim-marching)    ----
" ====================================================================================
if has_key(g:plugs, 'vim-marching')
    let g:marching_clang_command         = "/usr/bin/clang"
    let g:marching#clang_command#options = {
                \ "cpp" : "-std=c++1y"
                \ }
    let g:marching_include_paths = [
                \  "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1",
                \  "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include",
                \  "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include",
                \  "/usr/include",
                \  "/usr/local/include",
                \  "/usr/local/Cellar/opencv3/include"
                \ ]
    let g:marching_enable_neocomplete = 1
    set updatetime=200
endif

"{{{ insert c template header and enable tools
"    http://www.thegeekstuff.com/2009/01/tutorial-make-vim-as-your-cc-ide-using-cvim-plugin
let g:C_CustomTemplateFile = '~/.vim/templates/c.templates'
let g:C_UseTool_cmake      = 'yes'
let g:C_UseTool_doxygen    = 'yes'
"}}}

" ====================================================================================
"                       OmniCppComplete completion engine
" ====================================================================================
if has_key(g:plugs, 'OmniCppComplete')
    set omnifunc=syntaxcomplete#Complete  "override built-in C omnicomplete with C++ OmniCppComplete plugin
    let OmniCpp_NamespaceSearch     = 1
    let OmniCpp_GlobalScopeSearch   = 1
    let OmniCpp_DisplayMode         = 1
    let OmniCpp_ShowScopeInAbbr     = 0   " do not show namespace in pop-up
    let OmniCpp_ShowPrototypeInAbbr = 1   " show function parameters
    let OmniCpp_ShowAccess          = 1   " show access in pop-up
    let OmniCpp_SelectFirstItem     = 0   " if 1 select first item in pop-up
    let OmniCpp_MayCompleteDot      = 1   " autocomplete after .
    let OmniCpp_MayCompleteArrow    = 1   " autocomplete after ->
    let OmniCpp_MayCompleteScope    = 1   " autocomplete after ::
    let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
    "au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
endif

" ====================================================================================
"             automatically open and close the popup menu / preview window
" ====================================================================================
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd FileType cpp set completeopt=menuone,menu,longest,preview
autocmd FileType c set completeopt=menuone,menu,longest,preview

