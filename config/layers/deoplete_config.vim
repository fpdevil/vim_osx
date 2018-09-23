" -----------------------------------------------------------------------------
" ------               asynchronous completion framework                 ------
" -----------------------------------------------------------------------------

if has_key(g:plugs,'deoplete.nvim')
    let g:deoplete#enable_at_startup          = 1
    let g:deoplete#auto_complete_start_length = 1
    let g:deoplete#enable_yarp                = 1
    let g:deoplete#enable_ignore_case         = 1
    let g:deoplete#enable_smart_case          = 1
    let g:deoplete#enable_camel_case          = 1
    let g:deoplete#enable_refresh_always      = 1
    let g:deoplete#max_abbr_width             = 0
    let g:deoplete#max_menu_width             = 0


    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni_patterns       = {}
    let g:deoplete#keyword_patterns    = {}
    let g:deoplete#omni#functions      = {}
    let g:deoplete#sources             = {}

    let g:deoplete#sources._           = ['omni', 'snippet', 'tag', 'buffer']

    " with zchee/deoplete-clang
    let g:deoplete#sources#clang#executable    = '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/bin/clang'
    let g:deoplete#sources#clang#libclang_path = '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header  = '/opt/software/clang+llvm-6.0.0-x86_64-apple-darwin/include/'
    let g:deoplete#sources#clang#flags         = [
          \ '-isystem',
          \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/include/c++/v1',
          \ '-isystem',
          \ '/usr/local/include',
          \ '-isystem',
          \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/9.1.0/include',
          \ '-isystem',
          \ '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include',
          \ '-isystem',
          \ '/usr/include',
          \ '-isystem',
          \ '/System/Library/Frameworks',
          \ '-isystem',
          \ '/Library/Frameworks',
          \ ]

    " for javascript
    let g:deoplete#sources['javascript']     = ['tern', 'omni', 'file', 'buffer', 'ultisnips', 'tag']
    let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'tag']
    let g:deoplete#omni#functions.javascript = [
                \ 'tern#Complete',
                \ 'jspc#omni'
                \ ]


    " for clojure
    let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

    " accept partial fuzzy matches like YouCompleteMe
    call g:deoplete#custom#source('ghc', 'sorters', ['sorter_word'])
    call g:deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
    call g:deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
    call g:deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

    call g:deoplete#custom#source('ternjs', 'mark', 'tern')
    call g:deoplete#custom#source('ternjs', 'rank', 9999)

    call g:deoplete#custom#source('file/include', 'matchers', ['matcher_head'])


    ""use TAB as the mapping
    inoremap <silent><expr> <TAB>
                \ pumvisible() ?  "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort
        let l:col = col('.') - 1
        return !l:col || getline('.')[l:col - 1]  =~? '\s'
    endfunction
endif

" vim:set et sw=4
