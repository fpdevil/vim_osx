" Vim Config - optimized for minimal loading
" load with vim -u minimal_config.vim

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'mhinz/vim-startify'
    Plug 'Shougo/neocomplete.vim'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'Shougo/vimproc.vim'

    Plug 'eagletmt/ghcmod-vim'
    Plug 'eagletmt/neco-ghc'

    Plug 'lukerandall/haskellmode-vim'

    "Plug 'neovimhaskell/haskell-vim'
    "Plug 'enomsg/vim-haskellConcealPlus'    " unicode for haskell operators
    "Plug 'Twinside/vim-hoogle'
    "Plug 'pbrisbin/html-template-syntax'    " Yesod templates

    "Plug 'mpickering/hlint-refactor-vim',{ 'for': 'haskell' }
    "Plug 'itchyny/vim-haskell-indent',{ 'for': 'haskell' }
    "Plug 'dan-t/vim-hsimport',{ 'for': 'haskell' }
    "Plug 'bitc/vim-hdevtools',{ 'for': 'haskell' }
    "Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }
    "Plug 'alx741/vim-stylishask'
    "Plug 'adinapoli/cumino',{ 'for': 'haskell' }
    "Plug 'pbrisbin/vim-syntax-shakespeare'

    Plug 'w0rp/ale'
call plug#end()

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_debug = 1

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

" show quickfix by ctrlp.vim
let g:ghcmod_open_quickfix_function = 'GhcModQuickFixByCtrlP'
function! GhcModQuickFixByCtrlP()
    CtrlPQuickfix
endfunction

" highlighting the mod type
hi ghcmodType ctermbg=yellow
let g:ghcmod_type_highlight = 'WildMenu'

let s:default_path = escape(&path, '\ ')
autocmd BufRead *
            \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
            \ exec "set path-=".s:tempPath |
            \ exec "set path-=".s:default_path |
            \ exec "set path^=".s:tempPath |
            \ exec "set path^=".s:default_path

autocmd FileType haskell setlocal commentstring=--\ %s
autocmd FileType haskell setlocal nospell

if has_key(g:plugs,'haskell-vim')
    let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
    let g:haskell_enable_recursivedo      = 1   " to enable highlighting of `mdo` and `rec`
    let g:haskell_enable_arrowsyntax      = 1   " to enable highlighting of `proc`
    let g:haskell_enable_pattern_synonyms = 1   " to enable highlighting of `pattern`
    let g:haskell_enable_typeroles        = 1   " to enable highlighting of type roles
    let g:haskell_enable_static_pointers  = 1   " to enable highlighting of `static`
    let g:haskell_backpack                = 1   " to enable highlighting of backpack keywords
    let g:haskell_indent_case_alternative = 1
    let g:haskell_indent_if               = 4
    let g:haskell_indent_case             = 4
    let g:haskell_indent_in               = 0
    let g:haskell_indent_before_where     = 2

    let g:hs_highlight_delimiters	  = 1   " highlight delimiter characters
    let g:hs_highlight_boolean    	  = 1   " treat True and False as keywords
    let g:hs_highlight_types      	  = 1   " treat names of primitive types as keywords
    let g:hs_highlight_more_types 	  = 1   " treat names of other common types as keywords
    let g:hs_highlight_debug      	  = 1   " highlight names of debugging functions
endif

hi clear Conceal
let g:haskell_conceal_wide         = 1
let g:haskell_conceal_enumerations = 1

autocmd BufEnter *.hs set formatprg=pointfree
function! Pointfree()
    call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
    call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>

autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"

" Enable some tabular presets for Haskell
let g:haskell_tabular = 1

let g:hlintRefactor#disableDefaultKeybindings = 1
" hlint-refactor-vim keybindings
map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>

if has_key(g:plugs,'vim-stylish-haskell')
    let g:stylish_haskell_command="~/Library/Haskell/bin/stylish-haskell"
endif

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1

if has_key(g:plugs,'haskellmode-vim')
    au Bufenter *.hs compiler ghc
    let g:haddock_browser = "open"
    let g:haddock_browser_callformat = "%s %s"
endif

let $PATH=$PATH.':'.expand("~/Library/Haskell/bin")
