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
"
" Customized .vim configuration file
" It supports some of the major languages which I use
" Haskell
" Erlang
" JavaScript ... flavours
" Python
" Scala
" Clojure (I don't use, but interested in learning)
"
" Original template used from Yann Esposito
" http://yannesposito.com
" THANKS TO @yogsototh
"
" ---------- VERY IMPORTANT -----------
" To install plugin the first time:
" > vim +BundleInstall +qall
" cd ~/.vim/bundle/vimproc.vim && make
" cabal install ghc-mod
" -------------------------------------
"
" #### unicode support ####
"For UNICODE Support "⚠"
set encoding=utf-8
scriptencoding utf-8
" note: set encoding BEFORE scriptencoding
" #########################


call plug#begin('~/.vim/plugged')
"
" #### set rtp+=~/.vim/vundle/Vundle.vim/
" set rtp+=~/.vim/bundle/vundle/
" ### call vundle#rc()
" the vundle plugin to install vim plugin
" Bundle 'gmarik/vundle'
" completion during typing
" Pligins section {{{
Plug 'neocomplcache'
" Plug 'altercation/vim-colors-solarized'     "solarized colorscheme
Plug 'flazz/vim-colorschemes'               "Color Schemes
Plug 'morhetz/gruvbox'                      "Retro groove color scheme
" Right way to handle trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'
" NERDTree
" Plug 'scrooloose/nerdtree'
" Unite
"   depend on vimproc
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
" ### writing pandoc documents      ###
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" ### GIT Plugins                   ###
Plug 'tpope/vim-fugitive'
" show which line changed using git
Plug 'airblade/vim-gitgutter'
" ### Align code                    ###
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/syntastic'                                   " syntax checker
" ###  Haskell                      ###
Plug 'yogsototh/haskell-vim', { 'for': 'haskell' }            " syntax indentation / highlight
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }    " unicode for concealing haskell operators
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }              " Hoogle haskell search
Plug 'pbrisbin/html-template-syntax', { 'for': 'haskell' }    " Yesod templates
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }               " HDevTools for Haskell
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }     " Stylish Haskell
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }    " Hlint refactor
"Plug 'dag/vim2hs'
" ###  Bars panels                  ###
"Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'                                " Airline statusbar
Plug 'vim-airline/vim-airline-themes'                         " Airline themes
Plug 'majutsushi/tagbar'
" ###  XML                          ###
Plug 'othree/xml.vim'
" ### Clojure                       ###
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
" Loaded when clojure file is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Multiple file types (loaded when clj or scheme are opened)
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
" vim-fireplace dependencies
" Plug 'tpope/vim-classpath'
" Plug 'jpalardy/vim-slime'
" ### ag                            ###
Plug 'rking/ag.vim'
" ### elm-lang                      ###
Plug 'lambdatoast/elm.vim'
" ### Idris                         ###
Plug 'idris-hackers/idris-vim'
" -- reload browser on change
" Plug 'Bogdanp/browser-connect.vim'
" ### for JavaScript                ###
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'
" Yet Another JavaScript Syntax for Vim
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'einars/js-beautify'
" ### extends syntax for with jQuery,backbone,etc.
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
" ### Syntax file for JavaScript libraries.
Plug 'othree/javascript-libraries-syntax.vim'
" ### for erlang                    ###
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'
" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'
" ###  scala                        ###
Plug 'derekwyatt/vim-scala'
"Plug 'ensime/ensime-vim'
" ###  get current function name
Plug 'tyru/current-func-info.vim'
" ### Autopair                      ###
Plug 'jiangmiao/auto-pairs'
" ### Language: HTML, XML ...       ###
Plug 'othree/html5.vim'
" ### python                        ###
Plug 'davidhalter/jedi-vim'
"Plug 'lambdalisue/vim-pyenv'
" ### for C/C++                     ###
" Plug 'Rip-Rip/clang_complete'
" Code to execute when the plugin is loaded on demand
" On-demand loading
" Plug 'Valloric/YouCompleteMe', { 'for': ['cpp','python'] }
" ### vim icons                     ###
" Plug 'ryanoasis/vim-devicons'
" }}}
" autocmd! User YouCompleteMe call youcompleteme#Enable()

call plug#end()

set nocompatible

" ###################
" ### Plugin conf ###
" ###################

" -------------------
"       Haskell
" -------------------
let mapleader="-"
let g:mapleader="-"
set tm=2000
nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>he :GhcModTypeClear<CR>
nmap <silent> <leader>hi :GhcModTypeInsert<CR>
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>:lopen<CR>
let g:syntastic_mode_map={'mode': 'active', 'passive_filetypes': ['haskell']}
let g:syntastic_always_populate_loc_list = 1
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>:lopen<CR>

" Auto-checking on writing
autocmd BufWritePost *.hs,*.lhs GhcModCheckAndLintAsync

" For hdevtools type info
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

"  neocomplcache (advanced completion)
let g:acp_enableAtStartup = 0
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

" -- neco-ghc
let $PATH=$PATH.':'.expand("~/.cabal/bin")
autocmd BufEnter *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc
" below prvodes detailed info, but if boot time is more disable it
let g:necoghc_enable_detailed_browse = 1

" -- Frege
autocmd BufEnter *.fr :filetype haskell

" ----------------
"       GIT
" ----------------
" -- vim-gitgutter
highlight clear SignColumn
highlight SignColumn ctermbg=0
nmap gn <Plug>GitGutterNextHunk
nmap gN <Plug>GitGutterPrevHunk

" -----------------
"      THEMES
" -----------------

" -- solarized theme
"set background=dark
"try
"    colorscheme solarized
"catch
"endtry

" ----------------------------
"       File Management
" ----------------------------
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

" Clojure {{{
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesActivate
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadRound
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadSquare
autocmd BufEnter *.cljs,*.clj,*.cljs.hl RainbowParenthesesLoadBraces
" Fix I don't know why
autocmd BufEnter *.cljs,*.clj,*.cljs.hl setlocal iskeyword+=?,-,*,!,+,/,=,<,>,.,:
" }}}

" -- Rainbow parenthesis options
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

" #####################
" ### Personal conf ###
" #####################

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
set bs=2		            " allow backspacing over everything in insert mode
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

" -- sudo save
cmap w!! w !sudo tee >/dev/null %

" Tabulation management
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

" ====================================
" Personal Configurations
" ====================================
" Searing red very visible cursor
hi Cursor guibg=red

" Use same color behind concealed unicode characters
hi clear Conceal

" Easier anti-quote
imap éé `

" -- show the column 81
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

" --- Slime ---
" {{{
vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars
" }}}

" --- TMUX ---
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
" --- FANCY abcdefgh in status bar ---
function! AccentDemo()
  let keys = ['a','b','c','d','e','f','g','h','i']
  for k in keys
    call airline#parts#define_text(k, k)
endfor
  call airline#parts#define_accent('a', 'red')
  call airline#parts#define_accent('b', 'green')
  call airline#parts#define_accent('c', 'blue')
  call airline#parts#define_accent('d', 'violet')
  call airline#parts#define_accent('e', 'orange')
  call airline#parts#define_accent('f', 'purple')
  call airline#parts#define_accent('g', 'pink')
  call airline#parts#define_accent('h', 'bold')
  call airline#parts#define_accent('i', 'italic')
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
let python_highlight_all=1

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


"--------------------------------------
" personal settings for Syntastic
" By default, Syntastic uses arrow symbols to indicate line with error.
" To spice things up, you can specify any Unicode symbol as the symbol.

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
let g:syntastic_python_checkers            = ['pylint']

" syntastic for cpp
let g:syntastic_cpp_compiler = "g++"

" JavaScript {{{
" -- js beautifer ---
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
" }}}
"--------------------------------------
