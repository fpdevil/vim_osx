" ------------------------------------------------------------------------------------
" ---------        customizations and settings for vim-clang and cpp         ---------
" ------------------------------------------------------------------------------------
let g:clang_c_options            = '-std=gnu11'
let g:clang_cpp_options          = '-std=c++11 -stdlib=libc++'

" vim clang-format setup
let g:clang_format#command       = "/usr/local/bin/clang-format"
let g:clang_format#style_options = {
            \ "Standard": "Cpp11",
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

" select the file type for ClangFormat
au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>= :ClangFormat<cr>

" languages to load clang-based plugins for (YCM, color_coded)
let g:clang_languages       = ['c', 'cpp', 'objc', 'python', 'haskell']
let g:color_coded_filetypes = ['c', 'cpp', 'objc', 'python', 'haskell']

" set the CLANG library path manually
let g:clang_exec         = "/usr/bin/clang"
let s:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib'
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


" Doxygen for CPP and Python Documentation settings
autocmd Filetype c,cpp set comments^=:///
let g:DoxygenToolkit_commentType = "C++"

" ------------------------------------------------------------------------------------
" -----               vim-cpp-enhanced-highlight custom settings                 -----
" ------------------------------------------------------------------------------------
let g:cpp_class_scope_highlight           = 1        " highlight class scope
let g:cpp_experimental_template_highlight = 1        " highlight template functions
let g:cpp_concepts_highlight              = 1        " highlight library concepts
let g:cpp_member_variable_highlight       = 1        " highlight member variables

" ------------------------------------------------------------------------------------
" --- async clang code completion (https://github.com/osyo-manga/vim-marching)    ----
" ------------------------------------------------------------------------------------
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
let g:C_CustomTemplateFile = '~/.vim/templates/c.templates'
let  g:C_UseTool_cmake     = 'yes'
let  g:C_UseTool_doxygen   = 'yes'
"}}}
