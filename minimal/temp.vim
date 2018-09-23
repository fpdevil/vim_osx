scriptencoding utf-8
set hidden

" custom installation helper functions
function! InstallJsHint(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install -g jshint
    endif
endfunction

function! MakeInstall(info)
    if a:info.status ==# 'installed' || a:info.force
        !make install
    endif
endfunction

function! GitRecurse(info)
    if a:info.status ==# 'installed' || a:info.force
        !git submodule update --init --recursive
    endif
endfunction

function! InstallJsBeautify(info)
    if a:info.status ==# 'installed' || a:info.force
        !git submodule update --init --recursive
        !npm install js-beautify
    endif
endfunction

function! BuildTern(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install
        !npm install -g tern
    endif
endfunction

function! GetImport(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install
        !npm install -g import-js
    endif
endfunction

"Function: InstallTS
"Desc: Install TypeScript node binaries
"
"Arguments: info
" check if installed or not
function! InstallTS(info)
    if a:info.status ==# 'installed' || a:info.force
        !npm install -g clausreinke/typescript-tools typescript
    endif
endfunction


" Vim Config - optimized for minimal loading
" load with vim -u minimal_config.vim

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
    Plug 'w0rp/ale'
    Plug 'Shougo/neocomplete.vim'
    Plug 'Shougo/neoinclude.vim'
    Plug 'Chiel92/vim-autoformat'
    
    Plug 'Shougo/vimproc.vim', { 'do': 'make -j4' }
    Plug 'benizi/vim-automkdir'
    Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
    Plug 'mhinz/vim-startify'
    Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/indentLine'
    Plug 'itchyny/calendar.vim'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-dispatch'
    Plug 'conradirwin/vim-bracketed-paste'
    Plug 'shougo/echodoc', { 'on': ['EchoDocEnable', 'EchoDocDisable'] }
    Plug 'Shougo/context_filetype.vim'
    Plug 'schickling/vim-bufonly', { 'on': ['BufOnly', 'Bonly'] }
    Plug 'rhysd/vim-healthcheck'
    Plug 'scrooloose/nerdcommenter'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
    
    Plug 'shougo/vimshell.vim'
    
    Plug 'rbtnn/vimconsole.vim', { 'on': [
                \ 'VimConsoleLog', 'VimConsoleOpen', 'VimConsoleWarn', 'VimConsoleError',
                \ 'VimConsoleError', 'VimConsoleToggle', 'VimConsoleClear', 'VimConsoleRedraw',
                \ ],
                \ }

    Plug 'flazz/vim-colorschemes'
    Plug 'morhetz/gruvbox'
    Plug 'trusktr/seti.vim'
    Plug 'lifepillar/vim-solarized8'
    Plug 'baeuml/summerfruit256.vim'
    Plug 'jacoborus/tender.vim'
    Plug 'kabbamine/yowish.vim'
    Plug 'tyrannicaltoucan/vim-quantum'
    Plug 'lifepillar/vim-wwdc16-theme'
    Plug 'lifepillar/vim-wwdc17-theme'
    
    
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'garbas/vim-snipmate'
    Plug 'shougo/neosnippet.vim'
    Plug 'shougo/neosnippet-snippets'
    Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
    
    
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    
    
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/unite-outline'
    Plug 'ujihisa/unite-colorscheme'
    Plug 'Shougo/neomru.vim'
    Plug 'mattn/unite-vim_advent-calendar'
    Plug 'mattn/webapi-vim'
    Plug 'mattn/wwwrenderer-vim'
    Plug 'thinca/vim-openbuf'
    Plug 'choplin/unite-vim_hacks'
    Plug 'osyo-manga/unite-option'
    Plug 'tsukkee/unite-help'
    Plug 'osyo-manga/unite-quickfix'
    Plug 'zhaocai/unite-scriptnames'
    
    
    "Plug 'shougo/vimfiler.vim'
    "Plug 'xuyuanp/nerdtree-git-plugin'
    "Plug 'jistr/vim-nerdtree-tabs'
    "Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
    "Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    "augroup nerd_tree_loade
    "autocmd!
    "autocmd VimEnter * silent! autocmd! FileExplorer
    "autocmd BufEnter,BufNew *
    "        \  if isdirectory(expand('<amatch>'))
    "        \|   call plug#load('nerdtree')
    "        \|   execute 'autocmd! nerd_tree_load'
    "        \| endif
    "augroup END
    
    
    "Plug 'tpope/vim-fugitive'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'mhinz/vim-signify'
    
    
    "Plug 'ervandew/supertab'
    "Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign']  }
    "Plug 'godlygeek/tabular'
    "Plug 'Shougo/neco-syntax'
    "Plug 'ujihisa/neco-look'
    "Plug 'nathanaelkane/vim-indent-guides'
    
    "Plug 'Shougo/neco-vim', { 'for': 'vim' }
    "Plug 'mhinz/vim-lookup', { 'for': 'vim' }
    
    
    Plug 'neovimhaskell/haskell-vim'
    Plug 'enomsg/vim-haskellConcealPlus'
    Plug 'eagletmt/ghcmod-vim'
    Plug 'eagletmt/neco-ghc'
    
    Plug 'Twinside/vim-hoogle'
    Plug 'osyo-manga/vim-hoogle-web'
    
    Plug 'mpickering/hlint-refactor-vim'
    
    "Plug 'itchyny/vim-haskell-indent'    , { 'for': 'haskell' }                     " haskell indent plugin
    "Plug 'dan-t/vim-hsimport'            , { 'for': 'haskell' }                     " plugin for hsimport
    "Plug 'bitc/vim-hdevtools'           , { 'for': 'haskell' }                     " HDevTools for Haskell
    
    "Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }                      " Stylish Haskell
    "Plug 'alx741/vim-stylishask'                                                    " stylish haskell integration
    
    "Plug 'adinapoli/cumino'              , { 'for': 'haskell' }                     " vim ghci tmux integration
    
    "Plug 'pbrisbin/vim-syntax-shakespeare'                                          " syntax for hl template langs
    "Plug 'pbrisbin/html-template-syntax'                                            " Yesod templates
    
    
    
    "Plug 'idris-hackers/idris-vim'
    "Plug 'rking/ag.vim'
    
    "Plug 'lambdatoast/elm.vim'
    
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'osyo-manga/unite-airline_themes'
    Plug 'majutsushi/tagbar'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'jaxbot/semantic-highlight.vim', { 'on' : [
                \ 'SemanticHighlight',
                \ 'SemanticHighlightRevert',
                \ 'SemanticHighlightToggle'
                \ ] }
    Plug 'rakr/vim-two-firewatch'
    
    
    Plug 'thinca/vim-ft-clojure'
    Plug 'venantius/vim-eastwood'
    Plug 'kovisoft/paredit'
    Plug 'tpope/vim-fireplace'
    Plug 'guns/vim-clojure-highlight'
    Plug 'guns/vim-clojure-static'
    Plug 'venantius/vim-cljfmt'
    
    
    Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
    Plug 'airblade/vim-rooter'          , { 'for': 'java' }
    
    
    Plug 'fatih/vim-go'                 , { 'for': 'go', 'do': ':GoInstallBinaries', 'tag': '*' }
    Plug 'tweekmonster/hl-goimport.vim' , { 'for': 'go' }
    Plug 'nsf/gocode'                   , { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    
    
    Plug 'maksimr/vim-jsbeautify', {
                \ 'do' : function('InstallJsBeautify'),
                \ 'for': ['javascript', 'html'] }
    Plug 'maxmellon/vim-jsx-pretty'     , { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'jelera/vim-javascript-syntax' , { 'for': 'javascript' }
    Plug 'othree/yajs.vim'              , { 'for': 'javascript' }
    Plug 'othree/es.next.syntax.vim'    , { 'for': 'javascript' }
    Plug 'othree/jsdoc-syntax.vim'      , { 'for': 'javascript' }
    Plug 'heavenshell/vim-jsdoc'        , { 'for': 'javascript' }
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript',  { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'elzr/vim-json'
    Plug 'XadillaX/json-formatter.vim'  , { 'do': 'npm install jjson -g' }
    Plug 'rhysd/vim-fixjson'            , { 'do': 'npm install -g fixjson' }
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': [
                \ 'javascript',
                \ 'coffee',
                \ 'ls',
                \ 'typescript']
                \ }
    
    Plug 'marijnh/tern_for_vim', {
                \ 'do': function('BuildTern'),
                \ 'for': ['javascript', 'javascript.jsx']}
    
    Plug 'galooshi/vim-import-js', {
                \ 'do': function('GetImport'),
                \ 'on': ['ImportJSWord', 'ImportJSFix', 'ImportJSGoto']}
    
    Plug 'shutnik/jshint2.vim'        , {
                \ 'do': function('InstallJsHint'),
                \ 'for': 'javascript' }
    
    Plug 'moll/vim-node'              , { 'for': 'javascript' }
    Plug 'mmalecki/vim-node.js'       , { 'for': 'javascript' }
    Plug 'myhere/vim-nodejs-complete' , { 'for': 'javascript' }
    Plug 'mattn/jscomplete-vim'       , { 'for': 'javascript' }
    
    Plug 'jbgutierrez/vim-babel'
    Plug 'mattn/webapi-vim'
    
    Plug '1995eaton/vim-better-javascript-completion'
    
    Plug 'Quramy/tsuquyomi' , {
                \ 'do': function('InstallTS'),
                \ 'for': 'typescript' }
    Plug 'leafgarland/typescript-vim'   , { 'for': 'typescript' }
    Plug 'Quramy/vim-js-pretty-template', { 'for': 'typescript' }
    
    
    Plug 'youthy/vimerl-complete'
    Plug 'vim-erlang/vim-erlang-omnicomplete' , { 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-runtime'      , { 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-compiler'     , { 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-skeletons'    , { 'for': 'erlang' }
    Plug 'vim-erlang/erlang-motions.vim'      , { 'for': 'erlang' }
    Plug 'vim-erlang/vim-erlang-tags'
    Plug 'ehamberg/vim-cute-erlang'           , { 'for': 'erlang' }
    Plug 'melekes/vim-erlang-spec'            , { 'for': 'erlang' }
    
    
    Plug 'christoomey/vim-tmux-navigator'
    
    Plug 'ktonga/vim-follow-my-lead'
    Plug 'hecal3/vim-leader-guide'
    
    Plug 'derekwyatt/vim-scala', { 'for': 'scala'}
    
    Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css', 'scss' ] }
    Plug 'othree/html5.vim'
    Plug 'othree/xml.vim'
    Plug 'sukima/xmledit'
    Plug 'vim-scripts/xslt'
    Plug 'Valloric/MatchTagAlways'
    Plug 'gko/vim-coloresque'
    if has('python') || has('python3')
        Plug 'Rykka/colorv.vim', {
                    \ 'for': [ 'html','javascript', 'css','sass','scss','less','slim','stylus','python','cpp'  ]
                    \ }
    endif
    
    "Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp'] }
    "Plug 'rhysd/vim-clang-format',  { 'on': 'ClangFormat' }
    "Plug 'osyo-manga/vim-reunions', { 'for': 'cpp' }
    "Plug 'vim-jp/vim-cpp',          { 'for': [ 'c', 'cpp'] }
    "Plug 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp'] }
    "Plug 'derekwyatt/vim-fswitch',  { 'for': ['c', 'cpp'] }
    "Plug 'vim-scripts/DoxygenToolkit.vim',   { 'for': 'cpp' }
    "Plug 'osyo-manga/vim-cpp-syntax-reserved_identifiers', { 'for': 'cpp' }
    "Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
    
    
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'voronkovich/ctrlp-nerdtree.vim', { 'on': 'CtrlPNerdTree' }
    Plug 'sgur/ctrlp-extensions.vim',      { 'on': [
                \ 'CtrlPCmdline',
                \ 'CtrlPMenu',
                \ 'CtrlPYankring']
                \ }
    Plug 'pielgrzym/ctrlp-sessions',       { 'on': ['CtrlPSessions', 'MkS'] }
    Plug 'vim-ctrlspace/vim-ctrlspace'
    Plug 'mattn/ctrlp-launcher',           { 'on': 'CtrlPLauncher' }
    Plug 'h14i/vim-ctrlp-buftab',          { 'on': 'CtrlPBufTab' }
    Plug 'mattn/ctrlp-windowselector',     { 'on': 'CtrlPWindowSelector' }
    Plug 'fisadev/vim-ctrlp-cmdpalette',   { 'on': 'CtrlPCmdPalette' }
    Plug 'elentok/ctrlp-objects.vim',      { 'on': [
                \ 'CtrlPModels',
                \ 'CtrlPViews',
                \ 'CtrlPControllers',
                \ 'CtrlPTemplates',
                \ 'CtrlPPresenters' ]
                \ }
    Plug 'jasoncodes/ctrlp-modified.vim'
    Plug 'nmanandhar/vim-ctrlp-menu'
    
    
    "Plug 'ujihisa/repl.vim'
    "Plug 'brookhong/k.vim'
    "Plug 'matze/vim-move'
    "Plug 'edkolev/promptline.vim'
    "Plug 'tyru/current-func-info.vim'
    "Plug 'jiangmiao/auto-pairs'
    "Plug 'tpope/vim-repeat'
    "Plug 'tpope/vim-surround'
    "Plug 'gorkunov/smartpairs.vim'
    "Plug 'beloglazov/vim-online-thesaurus', { 'on': 'OnlineThesaurusCurrentWord' }
    "Plug 'thinca/vim-ref'
    "Plug 'jceb/vim-hier'
    "Plug 'mattesgroeger/vim-bookmarks'
    "Plug 'docunext/closetag.vim'
    "Plug 'ujihisa/neco-look'
    
    
    Plug 'tpope/vim-unimpaired'
    Plug 'dkarter/bullets.vim'
    Plug 'bhurlow/vim-parinfer'
    
    Plug 'tpope/vim-classpath'
    
    Plug 'skywind3000/asyncrun.vim'
    
    Plug 'terryma/vim-multiple-cursors'
    Plug 'osyo-manga/vim-brightest'
    Plug 'osyo-manga/vim-over', { 'on': 'OverCommandLine' }
    Plug 't9md/vim-quickhl'
    "Plug 'valloric/vim-operator-highlight'
    Plug 'osyo-manga/vim-over'
    
    
    "Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
    "Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }
    
    
    "Plug 'vim-pandoc/vim-pandoc'
    "Plug 'vim-pandoc/vim-pandoc-syntax'
    "Plug 'jceb/vim-orgmode'
    "Plug 'tpope/vim-speeddating'
    "Plug 'roxma/vim-syntax-compl-pop'
    
    
    "Plug 'davidhalter/jedi-vim', { 'for': [ 'python' ] }
    "Plug 'vim-scripts/python.vim--Vasiliev', { 'for': [ 'python' ] }
    "Plug 'Vimjas/vim-python-pep8-indent', { 'for': [ 'python' ] }
    "Plug 'tell-k/vim-autopep8', { 'for': [ 'python' ] }
    "Plug 'ehamberg/vim-cute-python', { 'for': [ 'python' ] }
    "Plug 'tweekmonster/impsort.vim', { 'for': [ 'python' ] }
    "Plug 'plytophogy/vim-virtualenv', { 'for': [ 'python' ] }
    
    "Plug 'aklt/plantuml-syntax'
    "Plug 'scrooloose/vim-slumlord'
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

let $PATH=$PATH.':'.expand("~/Library/Haskell/bin")
