" ------------------------------------------------------------------------------------
" ------                      Haskell ghc customization                         ------
" ------------------------------------------------------------------------------------
" ghc-mod shortcuts {{{
" normal mode key mappings (ex: press -ht)
nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>he :GhcModTypeClear<CR>
nmap <silent> <leader>hi :GhcModTypeInsert<CR>
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>
" }}}


" hoogle shortcuts {{{
nnoremap <silent> <leader>hh :Hoogle<CR>        " Hoogle the word under the cursor
nnoremap <leader>hH :Hoogle                     " Hoogle and prompt for input
nnoremap <silent> <leader>hi :HoogleInfo<CR>    " Hoogle for detailed documentation (e.g. "Functor")
nnoremap <leader>hI :HoogleInfo                 " Hoogle for detailed documentation and prompt for input
nnoremap <silent> <leader>hz :HoogleClose<CR>   " Hoogle, close the Hoogle window
" }}}
  
" haskell linting with ghcmod {{{
" install with `cabal install ghcmod` if missing
if !executable("ghcmod")
    autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync
endif
"}}}

" key-bindings for the haskell hdevtools type info {{{
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
" }}}

" vim-commentary and highlighting for Haskell {{{
autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType haskell setlocal nospell
" }}}

" for haskell-vim customization {{{
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1   " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1   " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1   " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1   " to enable highlighting of `static`
" }}}


"{{{ Pretty unicode haskell symbols
let g:haskell_conceal_wide         = 1
let g:haskell_conceal_enumerations = 1
let hscoptions                     = "𝐒𝐓𝐄𝐌xRtB𝔻w"
" }}}

"{{{ syntax checker for haskell

let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}

"}}}

" ------------------------------------------------------------------------------------
" -----                     neco-ghc (haskell autocompleion)                     -----
" ------------------------------------------------------------------------------------
let $PATH=$PATH.':'.expand("~/Library/Haskell/bin/")
" disablei/enable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell    setlocal omnifunc=necoghc#omnifunc
autocmd BufEnter *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc
" if necoghc_enable_detailed_browse = 1, it provides detailed info,
" but if boot time is more disable it with the following
" let g:necoghc_enable_detailed_browse = 0
let g:necoghc_enable_detailed_browse = 1

" -- treat Frege files as haskell based
autocmd BufEnter *.fr :filetype haskell

" Support for pointfree styles
" In visual mode you can now press gq to convert a expression to it’s
" pointfree form.Though quite often the resulting form is more
" obfuscated than the original.
autocmd BufEnter *.hs set formatprg=pointfree
