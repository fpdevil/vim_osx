"
"
"   ██╗   ██╗ ██╗ ███╗   ███╗ ██████╗   ██████╗
"   ██║   ██║ ██║ ████╗ ████║ ██╔══██╗ ██╔════╝
"   ██║   ██║ ██║ ██╔████╔██║ ██████╔╝ ██║
"   ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ██╔══██╗ ██║
" ██╗╚████╔╝  ██║ ██║ ╚═╝ ██║ ██║  ██║ ╚██████╗
" ╚═╝ ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ╚═╝  ╚═╝  ╚═════╝
"
"
" Sampath Singamsetty (Singamsetty.Sampath@gmail.com)
" Last Updated Date: 12 Nov 2016
"
" Customized .vim configuration file
" It supports some of the major languages which I use
" Haskell
" Erlang
" JavaScript ... flavors
" Python
" Scala
" Clojure (I don't use, but interested in learning)
"
" Original configuration template used from Yann Esposito
" http://yannesposito.com
" THANKS TO @yogsototh
"
" ---------------------------- VERY IMPORTANT ----------------------------
" ----        To install plugin the first time:                       ----
" ----        > vim +BundleInstall +qall                              ----
" ----        cd ~/.vim/bundle/vimproc.vim && make                    ----
" ----        cabal install ghc-mod                                   ----
" ------------------------------------------------------------------------
"
"
" ########################################################################
" ########         for unicode support character and font         ########
" ########################################################################
" For UNICODE Support "⚠"
" note: set encoding BEFORE scriptencoding
set encoding=utf-8
scriptencoding utf-8

" ########################################################################
" ########################    Plugin conf start   ########################
" ########################################################################

call plug#begin('~/.vim/plugged')
"
" #### set rtp+=~/.vim/vundle/Vundle.vim/
" set rtp+=~/.vim/bundle/vundle/
" ### call vundle#rc()
" the vundle plugin to install vim plugin
" Bundle 'gmarik/vundle'
" completion during typing
" Pligins section {{{
"
Plug 'Shougo/neocomplete.vim'                                 " neocompletion with cache (need lua support)
Plug 'neocomplcache'                                          " neo compile caching
"Plug 'benekastah/neomake'                                    " make and linting framework for nvim/vim
Plug 'altercation/vim-colors-solarized'                       " solarized colorscheme
Plug 'flazz/vim-colorschemes'                                 " Color Schemes
Plug 'morhetz/gruvbox'                                        " Retro groove color scheme
" the right way to handle trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'                        " remove trailing whitespaces
Plug 'scrooloose/nerdtree'                                    " NERDTree
" depending on vimproc
" you have to go to .vim/plugin/vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim'                                     " vimproc
Plug 'Shougo/unite.vim'                                       " unite
Plug 'mhinz/vim-startify'                                     " fancy start screen for vim
" for writing pandoc documents
Plug 'vim-pandoc/vim-pandoc'                                  " pandoc text
Plug 'vim-pandoc/vim-pandoc-syntax'                           " pandoc text
" GIT Supporting
Plug 'tpope/vim-fugitive'                                     " git support
" show which line changed using git
Plug 'airblade/vim-gitgutter'                                 " git gutter
" for aligning the code or text manipulation
Plug 'junegunn/vim-easy-align'                                " text and code alignment
Plug 'scrooloose/syntastic'                                   " raltime syntax checker
Plug 'godlygeek/tabular'                                      " text filtering and alignment
Plug 'nathanaelkane/vim-indent-guides'                        " vim indentation display
" for haskell (load only for haskell)
"Plug 'yogsototh/haskell-vim', { 'for': 'haskell' }           " syntax indentation / highlight
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }        " syntax indentation / highlight
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }    " unicode for concealing haskell operators
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }              " ghcmod for haskell in vim
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }                " ghc haskell
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }              " Hoogle haskell search
Plug 'pbrisbin/html-template-syntax', { 'for': 'haskell' }    " Yesod templates
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }               " HDevTools for Haskell
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }     " Stylish Haskell
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }    " Hlint refactor
Plug 'itchyny/vim-haskell-indent'                             " haskell indent plugin
"Plug 'dag/vim2hs'                                            " vimscripts for haskell development
" for eye candies like bars and status colors
"Plug 'bling/vim-airline'                                     " using vim-airline repo
"Plug 'bling/vim-bufferline'                                  " show number of buffers
Plug 'vim-airline/vim-airline'                                " Airline statusbar
Plug 'vim-airline/vim-airline-themes'                         " Airline themes
Plug 'majutsushi/tagbar'                                      " tagbar support
" for XML
Plug 'othree/xml.vim'                                         " xml support
" for Rainbow colors
Plug 'kien/rainbow_parentheses.vim'                           " rainbow parenthesis
" ### Clojure                       ###
Plug 'guns/vim-clojure-static'                                " clojure support
Plug 'guns/vim-sexp'                                          " vim expression support
Plug 'tpope/vim-repeat'                                       " vim repetition
" Loaded when clojure file is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }              " clojure support
" Multiple file types (loaded when clj or scheme are opened)
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }     " clojure and scheme support
" vim-fireplace dependencies
" Plug 'tpope/vim-classpath'                                  " vim classpath
" Plug 'jpalardy/vim-slime'                                   " slime for vim
" for Agda support
Plug 'rking/ag.vim'                                           " AGDA language
" for elm-lang
Plug 'lambdatoast/elm.vim'                                    " ELM language
" for Idris
Plug 'idris-hackers/idris-vim'                                " idris language support
" -- reload browser on change
" Plug 'Bogdanp/browser-connect.vim'                          " browser integration
" for JavaScript
Plug 'maksimr/vim-jsbeautify'                                 " beautify javascript
Plug 'pangloss/vim-javascript'                                " javascript for vim
" Yet Another JavaScript Syntax for Vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }               " javascript support - lazy loading
Plug 'einars/js-beautify'                                     " javscript beautify
" JavaScript Context Coloring in Vim
Plug 'bigfish/vim-js-context-coloring'                        " javascript highlighting
" extends syntax for with jQuery,backbone,etc.
Plug 'othree/javascript-libraries-syntax.vim'                 " javascript library support
Plug 'mxw/vim-jsx'                                            " json/js support
Plug 'elzr/vim-json'                                          " json highlighting
" Syntax file for JavaScript libraries.
Plug 'othree/javascript-libraries-syntax.vim'                 " javascript library support
" for erlang
Plug 'vim-erlang/vim-erlang-runtime'                          " erlang runtime check
Plug 'vim-erlang/vim-erlang-omnicomplete'                     " erlang autocomplete
Plug 'vim-erlang/vim-erlang-compiler'                         " erlang support
" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'                         " TMUX support
" for scala
Plug 'derekwyatt/vim-scala'                                   " scala support
"Plug 'ensime/ensime-vim'                                     " ensime for scala autocomplete
Plug 'tyru/current-func-info.vim'                             " get current function name
Plug 'jiangmiao/auto-pairs'                                   " parenthesis autopairing
" for html, xml ...
Plug 'othree/html5.vim'                                       " html5
" for python3
Plug 'davidhalter/jedi-vim'                                   " python jedi autocompletion
"Plug 'lambdalisue/vim-pyenv'                                 " python virtual env
" for c/c++
" Plug 'Rip-Rip/clang_complete'                               " clang completion
" Code to execute when the plugin is loaded on demand
" On-demand loading
" Plug 'Valloric/YouCompleteMe', { 'for': ['cpp','python'] }  " ycm
" Plug 'ryanoasis/vim-devicons'                               " vim icons
Plug 'edkolev/promptline.vim'                                 " promptline
Plug 'vim-ctrlspace/vim-ctrlspace'                            " ctrlspace
" Plugins for vim textual snippets
Plug 'tomtom/tlib_vim'                                        " for snippets
Plug 'MarcWeber/vim-addon-mw-utils'                           " for snippets
Plug 'garbas/vim-snipmate'                                    " for snippets
Plug 'honza/vim-snippets'                                     " for snippets
Plug 'hecal3/vim-leader-guide'                                " vim keymap-display
"}}}
" autocmd! User YouCompleteMe call youcompleteme#Enable()

call plug#end()

" ########################################################################
" ########################     Plugin conf end    ########################
" ########################################################################

set nocompatible
set hidden

" ########################################################################
" ########################  Plugin customizations ########################
" ########################################################################


" ========================================================================
" ---                    Haskell customization                         ---
" ========================================================================
let mapleader="-"
let g:mapleader="-"
set tm=2000

" normal mode key mappings (ex: press -ht)
nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>he :GhcModTypeClear<CR>
nmap <silent> <leader>hi :GhcModTypeInsert<CR>
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>

"let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ['haskell'],'passive_filetypes': []}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
" skip syntax checking while exiting using :wq
let g:syntastic_check_on_wq = 0


" Auto-checking on writing
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

" For hdevtools type info
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" ========================================================================
" ---                for haskell-vim customization                     ---
" ========================================================================
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`


" ========================================================================
" ---                for nerdtree configuration                        ---
" ========================================================================
nmap <leader>nt :NERDTreeToggle<CR>

" ========================================================================
" ---                for tab alignment configuration                   ---
" ========================================================================
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" ========================================================================
" ---             neocomplcache (advanced completion)                  ---
" ========================================================================
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'.ghosh_completions'
    \ }
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
function! SetToCabalBuild()
    if glob("*.cabal") != ''
        set makeprg=cabal\ build
    endif
endfunction
autocmd BufEnter *.hs,*.lhs :call SetToCabalBuild()

" ========================================================================
" ---                            neco-ghc                              ---
" ========================================================================
" let $PATH=$PATH.':'.expand("~/.cabal/bin")
let $PATH=$PATH.':'.expand("~/Library/Haskell/bin/")
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd BufEnter *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc
" if necoghc_enable_detailed_browse = 1, it provides detailed info,
" but if boot time is more disable it necoghc_enable_detailed_browse = 0
let g:necoghc_enable_detailed_browse = 0

" -- Frege
autocmd BufEnter *.fr :filetype haskell

" ========================================================================
" ---                    ctrlspace customization                       ---
" --- getting help with the below options                              ---
" --- :help g:CtrlSpaceSymbols                                         ---
" ========================================================================
if has("gui_running")
    " Settings for vim and monaco powerline font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

" ========================================================================
" ---                             GIT Gutter                           ---
" ========================================================================
" -- vim-gitgutter
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk
let g:gitgutter_realtime = 0

" ========================================================================
" ---                              neomake                             ---
" ========================================================================
" let g:neomake_javascript_jshint_maker = {
"     \ 'args': ['--verbose'],
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"     \ }
" let g:neomake_javascript_enable_makers = ['jshint']

" ========================================================================
" ---                              Themes                              ---
" ========================================================================
" -- solarized theme
"set background=dark
"try
"    colorscheme solarized
"catch
"endtry

" ========================================================================
" ---                         File Management                          ---
" ========================================================================
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :split<cr> :<C-u>Unite file<cr>
nnoremap <space>g :split<cr> :<C-u>Unite -start-insert file_rec/git<cr>
" make a grep on all files!
nnoremap <space>/ :split<cr> :<C-u>Unite grep:.<cr>
" see the yank history
nnoremap <space>y :split<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" ========================================================================
" ---                             Clojure                              ---
" ========================================================================
" Clojure {{{
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
" Fix I don't know why
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
" }}}

" ========================================================================
" --                 Rainbow parenthesis customization                  --
" ========================================================================
let g:rbpt_colorpairs = [
	\ ['darkyellow',  'RoyalBlue3'],
	\ ['darkgreen',   'SeaGreen3'],
	\ ['darkcyan',    'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['DarkMagenta', 'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['DarkMagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkred',     'firebrick3'],
	\ ]

" Rainbow Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ######################################################################
" ####################### Personal Configuration #######################
" ######################################################################

" Use powerline fonts for airline
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" vim powerline symbols in statusbar
let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set bs=2		                " allow backspacing over everything in insert mode
set viminfo='20,\"50        " read/write a .viminfo file, don't store more
			                      " than 50 lines of registers
set history=10000           " keep 100000 lines of command line history
set ruler                   " show the cursor position all the time
syntax on                   " syntax highlighting
set hlsearch                " highlight searches
set laststatus=2            " always show the status line
set visualbell              " no beep

if &term =~ '256color'
   " disable Background Color Erase (BCE) so that color schemes
   " render properly when inside 256-color tmux and GNU screen.
   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" sudo save
cmap w!! w !sudo tee >/dev/null %

" Tab and indentation management
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
set cinoptions=(0,u0,U0

" Spellchecking
if has("spell") " if vim support spell checking
    " Download dictionaries automatically
    if !filewritable($HOME."/.vim/spell")
        call mkdir($HOME."/.vim/spell","p")
    endif
    set spellsuggest=10 " z= will show suggestions (10 at most)
    " spell checking for text, HTML, LaTeX, markdown and literate Haskell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spelllang=fr,en
    " better error highlighting with solarized
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif

" Alignment Helper
" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" .ymd file type
autocmd BufEnter *.ymd set filetype=markdown
autocmd BufEnter *.cljs,*.cljs.hl set filetype=clojure
"  Reload browser on cljs save
"  don't forget to put <script src="http://localhost:9001/ws"></script>
"  in your HTML
"  au BufWritePost *.cljs :BCReloadPage


" Searing red very visible cursor
" red back ground
hi Cursor guibg=red

" Use same color behind the concealed unicode characters
hi clear Conceal

" Easier anti-quote
imap éé `

" -- show the column number 81
if (exists('+colorcolumn'))
    "set colorcolumn=80
    set colorcolumn=120
    highlight ColorColumn ctermbg=0
endif

" --- type ° to search the word in all files in the current dir
nmap ° :Ag <c-r>=expand("<cword>")<cr><cr>

" set noswapfile
" -- vim-pandoc folding
let g:pandoc#modules#disabled = ["folding"]

" ========================================================================
" ---                              Slime                               ---
" ========================================================================
" {{{
vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars
" }}}

" ========================================================================
" ---                         TMUX configuration                       ---
" ========================================================================
" {{{
" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1
let g:slime_target = "tmux"

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" Support pointfree styles
" In visual mode you can now press gq to convert a expression to it’s
" pointfree form.Though quite often the resulting form is more
" obfuscated than the original.
autocmd BufEnter *.hs set formatprg=pointfree

" {{{
" -------------------------------------------------------------------------
" ---                    FANCY abcdefgh in status bar                   ---
" -------------------------------------------------------------------------
function! AccentDemo()
  let keys = ['a','b','c','d','e','f','g','h']
  for k in keys
    call airline#parts#define_text(k, k)
endfor
  call airline#parts#define_accent('a', 'red')
  call airline#parts#define_accent('b', 'green')
  call airline#parts#define_accent('c', 'blue')
  call airline#parts#define_accent('d', 'yellow')
  call airline#parts#define_accent('e', 'orange')
  call airline#parts#define_accent('f', 'purple')
  call airline#parts#define_accent('g', 'bold')
  call airline#parts#define_accent('h', 'italic')
  let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()
" }}}

" Airline Eye Candies {{{
"git gutter show
let g:airline#extensions#hunks#enabled=1
" personal appearance options
"let g:airline_left_sep='['
"let g:airline_right_sep=']'
let g:airline_linecolumn_prefix = '§'
let g:airline_paste_symbol = 'Þ'
let g:airline_readonly_symbol = 'Ʀ'
let g:airline_enable_branch=1
let g:airline_enable_syntastic=0
"}}}

" for erlang development support - syntaxerl
let g:syntastic_erlang_checkers=['syntaxerl']

"{{{
" Python Specific Custmoizations
" enable all Python syntax highlighting features
let python_highlight_all=1

" ycm - youcompleteme disabled
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
" let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

if has('python')
  let g:jedi#force_py_version = 2
  let g:syntastic_python_python_exec = 'python2'
  let g:pymode_python = 'python2'
elseif has('python3')
  "let g:jedi#force_py_version = 3
  let g:syntastic_python_python_exec = 'python3'
  "let g:pymode_python = 'python3'
else
  let g:loaded_jedi = 1
endif
"}}}


" -------------------------------------------------------------------------
" ---                  personal settings for Syntastic                  ---
" - By default, Syntastic uses arrow symbols to indicate line with error. -
" - To spice things up, you can specify any Unicode symbol as the symbol. -
" -------------------------------------------------------------------------

" getbg function {{{
" gets background of a highlighting group with fallback to SignColumn group
function! s:getbg(group)
    if has("gui_running")
        let l:mode = 'gui'
        let l:validation = '\w\+\|#\x\+'
    else
        let l:mode = 'cterm'
        let l:validation = '\w\+'
    endif

    if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
    else
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
        else
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
        endif
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        return ''
    endif

    return l:mode . 'bg=' . l:bg
endfunction
"}}}

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
hi! link SyntasticErrorLine Visual
hi! link SyntasticWarningLine Visual
au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')

" syntactic integration
let g:syntastic_enable_highlighting        = 1
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_python_python_exec         = '/usr/local/bin/python3'
" Using pylint
"let g:syntastic_python_checkers            = ['pylint']
"let g:syntastic_python_pylint_args         = '--disable=C0103'
" Using flake8
let g:syntastic_python_checkers            = ['flake8']
let g:syntastic_python_flake8_args         = '--ignore="D400"'
"let g:syntastic_python_flake8_args         = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'

" syntastic for cpp
let g:syntastic_cpp_compiler = "g++"

" -------------------------------------------------------------------------
" ---                    javascript  beautifying                        ---
" -------------------------------------------------------------------------
" JavaScript {{{
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call JsBeautify()<cr>
" Character Conceling
" https://github.com/pangloss/vim-javascript
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" javascript-libraries-syntax customization
let g:used_javascript_libs = 'underscore,angularjs,jasmine,chai'

" real time syntax checking for javascript
" use jshint
let g:syntastic_javascript_checkers = ['jshint']
" show any linting errors immediately
let g:syntastic_check_on_open = 1
" neocompletion for js
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" }}}

" colors and alerts
highlight Cursor guifg=pink guibg=black
highlight Search guifg=black guibg=gray

highlight CommaAndNonSpace      ctermbg=red guifg=white guibg=red
highlight EOLSpace              ctermbg=red guifg=white guibg=red
highlight HashRocketAndNonSpace ctermbg=red guifg=white guibg=red
highlight NonSpaceAndHashRocket ctermbg=red guifg=white guibg=red
highlight SpaceAndComma         ctermbg=red guifg=white guibg=red
highlight Tab                   ctermbg=red guifg=white guibg=red
highlight WideEisuu             ctermbg=red guifg=white guibg=red
highlight WideSpace             ctermbg=red guifg=white guibg=red

function! s:highlight_general_checkstyles()
    "let w:m1=matchadd('Tab', '    ', -1)
    let w:m1=matchadd('WideSpace', '　', -1)
    let w:m2=matchadd('EOLSpace', '\s\+$', -1)
    let w:m3=matchadd('WideEisuu', '[Ａ-Ｚａ-ｚ０-９]', -1)
    " let w:m4=matchadd('SpaceAndComma', ' ,', -1)
    " let w:m5=matchadd('CommaAndNonSpace', ',[^(\\n| )]', -1)
    "let w:m6=matchadd('Tab', '\t', -1)
endf

call s:highlight_general_checkstyles()

" for macvim
" override macvim color scheme
let macvim_skip_colorscheme=1
" =========================================================================
