" Vim Config - optimized for minimal loading
" load with vim -u minimal_config.vim

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    if (has('python3') == 0)
        echoerr "Deoplete needs NeoVim with +Python3 support!"
    endif
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'Shougo/neco-syntax'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'python-mode/python-mode', {'branch': 'develop'}
    Plug 'yssource/python.vim'
    Plug 'zchee/deoplete-jedi'

    Plug 'travitch/hasksyn'
    Plug 'dag/vim2hs'
    Plug 'Twinside/vim-haskellConceal'
    Plug 'Twinside/vim-haskellFold'
    Plug 'lukerandall/haskellmode-vim'
    Plug 'eagletmt/neco-ghc'
    Plug 'eagletmt/ghcmod-vim'
    Plug 'adinapoli/cumino'
    Plug 'bitc/vim-hdevtools'

    " Javascript and React syntax/indentation
    Plug 'neoclide/vim-jsx-improve'
    " ES Next syntax
    Plug 'othree/es.next.syntax.vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    " CoffeeScript
    Plug 'kchmck/vim-coffee-script'
    " Vue.js
    Plug 'posva/vim-vue'
    " Elm syntax
    Plug 'ElmCast/elm-vim'
    Plug 'othree/yajs.vim'
    Plug 'moll/vim-node'
    Plug 'elzr/vim-json'
    Plug 'heavenshell/vim-jsdoc'
    if executable('flow')
        Plug 'flowtype/vim-flow'
    endif
    Plug 'ternjs/tern_for_vim'
    Plug 'carlitux/deoplete-ternjs'

    "bash scripting
    Plug 'WolfgangMehner/bash-support'

    " erlang
    Plug 'vim-erlang/vim-erlang-runtime'
    Plug 'vim-erlang/vim-erlang-omnicomplete'
    Plug 'vim-erlang/vim-erlang-compiler'

    "cpp
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'vim-scripts/c.vim'
    Plug 'vim-scripts/a.vim'
    Plug 'peterhoeg/vim-qml'
    Plug 'Rip-Rip/clang_complete'
    Plug 'tweekmonster/deoplete-clang2'
call plug#end()

" -----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 2
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" -----------------------------------------------------------------------

let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" javascript
if exists('g:evervim_js_ligatures')
    let g:javascript_conceal_function             = "ƒ"
    let g:javascript_conceal_null                 = "ø"
    let g:javascript_conceal_this                 = "@"
    let g:javascript_conceal_return               = "⇚"
    let g:javascript_conceal_undefined            = "¿"
    let g:javascript_conceal_NaN                  = "ℕ"
    let g:javascript_conceal_prototype            = "¶"
    let g:javascript_conceal_super                = "Ω"
    let g:javascript_conceal_arrow_function       = "⇒"
    let g:javascript_conceal_noarg_arrow_function = "🞅"
    let g:javascript_conceal_underscore_arrow_function = "🞅"
endif
if executable('flow')
    let g:javascript_plugin_flow = 1
endif
nmap <silent> <Leader>ld <Plug>(jsdoc)

" c & cpp completions
let g:C_MapLeader = '\'
let g:deoplete#sources#clang#libclang_path = ""
call deoplete#custom#var('clangx', 'clang_binary', '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/bin')
let g:clang_library_path = '/opt/software/clang+llvm-7.0.0-x86_64-apple-darwin/lib/libclang.dylib'


" Enable omni-completion.
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menu,preview,longest

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
