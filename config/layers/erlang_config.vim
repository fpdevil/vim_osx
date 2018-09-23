" ====================================================================================
" ---                               for erlang                                     ---
" ====================================================================================

" file type settings
augroup erlang_vim
    autocmd!
    autocmd BufRead,BufNewFile *.erl,*.es.*.hrl,*.yaws,*.xrl set expandtab
    au BufNewFile,BufRead *.erl,*.es,*.hrl,*.yaws,*.xrl,relx.config setf erlang
    au FileType erlang set expandtab tabstop=4 softtabstop=4 shiftwidth=4 smartindent 

    " Highlight when a comma is not followed by a space.
    "autocmd FileType erlang match SyntaxHighlight /,[ \n]\@!/

    " Highlight spaces and tabs
    au ColorScheme * highlight ExtraWhitespace guibg=#300000
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au BufEnter * match ExtraWhitespace /\s\+$/
    au BufEnter * match MixTabsAndSpaces /^[ ]\+\t\+/
    au BufEnter * match MixTabsAndSpaces /^\t\+[ ]\+/

    au FileType erlang setlocal commentstring=%\ %s
    au filetype erlang match BadTabIndentation /^[ ]*\t\+/
    au filetype erlang inoremap <buffer> <C-z> <<>><Left><Left>
    au filetype erlang inoremap <buffer> <C-CR> <CR>%%<Space>
    au filetype erlang set keywordprg=erl-man
    au filetype erlang hi link erlangAtom Normal
    au filetype erlang setlocal indentkeys-==),=],=}

    " completions for erlang
    "autocmd FileType erlang setlocal omnifunc=erlangcomplete#Complete
    "autocmd FileType erlang setlocal completefunc=erlang_complete#Complete
augroup END

" highlight groups
highlight BadWhitespace guibg=#300000
highlight link ExtraWhitespace BadWhitespace
highlight link BadTabIndentation BadWhitespace
highlight link MixTabsAndSpaces BadWhitespace

hi link erlangAtom Normal

set conceallevel=1

" Erlang omnicomplete plugin for Vim
"if !empty(glob('~/.vim/plugged/vim-erlang-omnicomplete'))
if has_key(g:plugs,'vim-erlang-omnicomplete')
    let g:erlang_completion_preview_help = 1
endif


" for erlang development - syntax checking through syntaxerl
"if has_key(g:plugs, 'syntastic')
if exists(':SyntasticInfo')
    let g:syntastic_erlang_checkers   = ['escript', '/opt/erlang/syntaxerl/syntaxerl']
    let g:syntastic_erlc_include_path = "ebin"
endif
let g:erlangManPath               = '/usr/local/opt/erlang/lib/erlang/man'      "erlang man pages
let g:erlangCompiler              = 'erlc'
let g:erlangWranglerPath          = '/usr/local/lib/erlang/lib/wrangler-1.2.0/' "wrangler
let g:erlang_show_errors          = 1
let g:erlang_use_conceal          = 1
let g:erlangHighlightBif          = 1
let g:erlangCompletionDisplayDoc  = 1
let g:erlangCompletionGrep        = 1

let g:erlang_path=substitute(system('which erl'), '/bin/erl', '/lib/**/src/', '')


" ================= function for prettifying the erlang code ==================
"   Function  : ErlPretty
"   Desc      : use the erl_tidy module for prettifying the buffer
"   Arguments : nil (current buffer)
" ==============================================================================
function! ErlPretty()
    silent !erl -noshell -eval 'erl_tidy:file("%", [verbose]).' -s erlang halt
endfunction

nmap ep :execute ErlPretty()

" =================== vimerl-complete for erlang completion ====================
"if !empty(glob('~/.vim/plugged/vimerl-complete'))
if has_key(g:plugs,'vimerl-complete')
    let g:vimerl_complete_auto        = 1
    let g:vimerl_complete_only_export = 0
endif

" ==============================================================================
