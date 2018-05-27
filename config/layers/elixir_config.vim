" == == == == == == == == == == == == == == == == == == == == == == == == ==
" ELIXIR Configuration and Setting
" == == == == == == == == == == == == == == == == == == == == == == == == ==
if !empty(glob('~/.vim/plugged/alchemist.vim/')
    let g:alchemist#elixir_erlang_src = '/usr/local/opt/erlang/lib/erlang/lib'
    let g:alchemist_iex_term_size     = 15
    let g:alchemist_iex_term_split    = 'split'
endif
