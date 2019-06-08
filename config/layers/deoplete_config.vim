" -----------------------------------------------------------------------------
" ------               asynchronous completion framework                 ------
" -----------------------------------------------------------------------------

if has_key(g:plugs,'deoplete.nvim')
    let g:deoplete#enable_at_startup           = 1
    let g:deoplete#enable_smart_case           = 1
    let g:deoplete#enable_ignore_case          = 1
    let g:deoplete#auto_complete_start_length  = 1
    let g:deoplete#enable_refresh_always       = 1

    let g:deoplete#sources#jedi#show_docstring = 1
    let g:deoplete#sources#jedi#python_path    = '/usr/local/bin/python3'
    let g:deoplete#sources#jedi#debug_server   = 1

    let g:deoplete#ignore_sources      = {}
    let g:deoplete#keyword_patterns    = {}

    " with zchee/deoplete-clang
    let g:deoplete#sources#clang#executable    = '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/bin/clang'
    let g:deoplete#sources#clang#libclang_path = '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/lib/libclang.dylib'
    let g:deoplete#sources#clang#clang_header  = '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/include/'
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
    call deoplete#custom#source('omni', 'functions', {
		        \ 'javascript': ['tern#Complete', 'jspc#omni']
		        \ })
    call deoplete#custom#source('ternjs', 'mark', 'tern')
    call deoplete#custom#source('ternjs', 'rank', 9999)

    " for public settings
    call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
    call deoplete#custom#source('file/include', 'matchers', ['matcher_head'])

    " for jedi python debugging
    call deoplete#custom#option('profile', v:true)
    call deoplete#custom#source('jedi', 'debug_enabled', 1)
    call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')

    " custom key mappings
    "inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

    " autocmd InsertEnter * call deoplete#enable()


    ""use TAB as the mapping
    "inoremap <silent><expr> <TAB>
    "            \ pumvisible() ?  "\<C-n>" :
    "            \ <SID>check_back_space() ? "\<TAB>" :
    "            \ deoplete#mappings#manual_complete()
    "inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    "inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    function! s:check_back_space() abort
        let l:col = col('.') - 1
        return !l:col || getline('.')[l:col - 1]  =~? '\s'
    endfunction
endif

" vim:set et sw=4
