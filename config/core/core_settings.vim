" ####################################################################################
" ###############       VIM Core Editor Configurations and Settings    ###############
" ####################################################################################
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" below 2 options to be loaded first
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
endif
filetype off

" ************************************************************************************
" vim  Leader key mapping with g:vimosx_leader_key
" use the option <leader key> + <keymap> for all shortcuts
" ************************************************************************************
"   let g:vimosx_leader_key='\' - this is default
if !exists('g:vimosx_leader_key')
   let g:mapleader = '-'
   "let mapleader = "\<Space>"
else
   let g:mapleader=g:vimosx_leader_key
endif
if !exists('g:vimosx_localleader_key')
   let g:maplocalleader = '_'
else
   let g:maplocalleader=g:vimosx_localleader_key
endif

augroup vimrc
  autocmd!
augroup END

" set file encodings
if &encoding !=? 'utf-8'
    let &termencoding = &encoding
    set encoding=utf-8
endif

" For UNICODE support of symbols like ⚠
" note: set encoding BEFORE script encoding
scriptencoding utf-8

"set fileencoding=utf-8                          " file utf-8 encode
"set fileencodings=utf-8                         " file utf-8 encode

" allow plugins by file type (required for plugins!)
filetype plugin indent on
filetype indent on

" To prevent automatic switching to current file directory whenever a new
" buffer is opened, set the below:
"   let g:vimosx_no_autochdir = 1
if !exists('g:vimosx_no_autochdir')
   " to always switch to the current file directory
    augroup vimrc
        autocmd!
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    augroup end
endif

"syntax on                                   " syntax highlighting
if has('syntax')
   syntax enable
endif

" ------------------------------------------------------------------------------------
" complete options { set completeopt=menu,menuone,longest,preview }
" ------------------------------------------------------------------------------------
set completeopt+=menuone                            " always show the completion menu
set completeopt+=preview                            " sometimes annoying window on the top
set completeopt+=longest                            " do not select the first variant by default

set complete=.,w,b,t,i,u,k                          " completion buffers
"            | | | | | | |
"            | | | | | | `-dict
"            | | | | | `-unloaded buffers
"            | | | | `-include files
"            | | | `-tags
"            | | `-other loaded buffers
"            | `-windows buffers
"            `-the current buffer

set backspace=indent,eol,start                      " fix backspace indent
"set backspace=2                                    " allow backspacing over everything in insert mode

set hidden
"set list
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
" set fillchars
set fillchars=vert:│,fold:·

set grepformat=%f:%l:%c:%m,%f:%l:%m

" toggle the cursor crosshairs (shows crosshairs as +)
map <silent> # :set cursorcolumn! cursorline!<CR>

" show wildmenu to visual autocomplete for command menu
set wildmenu

"set wildmode=list:longest,list:full

" ------------------------------------------------------------------------------------
"  fold settings
" ------------------------------------------------------------------------------------
set nofoldenable                         " do not fold by default
set foldmethod=indent                    " use indentation for folds
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

" fold vimrc itself by categories
augroup vimrcFold
    autocmd!
    autocmd FileType vim set foldmethod=marker
    autocmd FileType vim set foldlevel=0
augroup END

set wildignorecase                       " ignore case while completing file names

"set mouse=niv                           " enable mouse in normal, insert and visual modes
set mouse=a                              " enable mouse in all modes
set mousefocus                           " automatically activate window with mouse pointer

set ttyfast                              " improves smoothness of redrawing
set lazyredraw                           " do not redraw screen while executing macros; much faster

set binary                               " enable binary support
set icon                                 " let vim set the text of the window icon

silent! helptags ALL                     " generate documentation tags automatically

" ------------------------------------------------------------------------------------
" set the cursor based on modes
" ------------------------------------------------------------------------------------
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175


" ------------------------------------------------------------------------------------
" get the system os running
" ------------------------------------------------------------------------------------
let g:os = substitute(system('uname'), '\n', '', '')
if g:os ==# 'Darwin' || g:os ==# 'Mac'
    let s:sysos = 'osx'
endif

" ------------------------------------------------------------------------------------
" ----- set some options for the gui so that it can show toolbar, left and right -----
" ----- scrollbars (for gvim amd macvim)                                         -----
" ----- set the default fontset for vim in gui mode                              -----
" ------------------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=m                   " Hide menu bar.
    set guioptions-=T                   " Hide toolbar
    set guioptions-=L                   " Hide left-hand scrollbar
    set guioptions-=r                   " Hide right-hand scrollbar
    set guioptions-=b                   " Hide bottom scrollbar
    set showtabline=0                   " Hide tabline
    set guioptions-=e                   " Hide tab
    if s:sysos ==# 'osx'
        if exists('g:vimosx_gui_font')
            exe 'set guifont=' . g:vimosx_gui_font
        else
            "set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h12
            set guifont=Monaco\ for\ Powerline:h12
        endif
    elseif s:sysos ==# 'linux'
        set guifont=DejaVu\ Sans\ Mono\ 11
    endif
endif

" show number and relative number
set relativenumber
set number

" ------------------------------------------------------------------------------------
" Formatting options
" ------------------------------------------------------------------------------------
" Tab and indentation management (May be overriten by autocmd rules)
set expandtab                               " tabs are spaces
set tabstop=4                               " number of visual spaces per TAB
set softtabstop=4                           " number of spaces in tab when editing
set shiftwidth=4

set autoread                                " read open files again if changed outside vim

" indentation related
set autoindent                              " copy indent from current line
set smartindent
set cindent
set cinoptions=(0,u0,U0


" Text auto formatting options
set formatprg=par               " external program used to format with gq operator
set formatoptions=c,q,r,t
"                 | | | |
"                 | | | +------- Auto-wrap text using textwidth.
"                 | | +--------- Auto insert the current comment leader after
"                 | |            hitting <Enter> in Insert mode.
"                 | +----------- Allow formatting of comments with 'gq'.
"                 +------------- Auto-wrap comments using textwidth, inserting
"                                the current comment leader automatically.



" ------------------------------------------------------------------------------------
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" ------------------------------------------------------------------------------------
set viminfo='20,\"50                        " read/write a .viminfo file, don't store more
                                            " than 50 lines of registers
set history=10000                           " keep 100000 lines of command line history

if has('cmdline_info')
    set ruler                               " show the cursor position all the time
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd                             " show current command in status bar
    set showmode                            " display current mode in status bar
endif

if has('statusline')
   set laststatus=2                            " always show the status line
   set statusline=%<%f\                        " Filename
   set statusline+=%w%h%m%r                    " Options
   if !exists('g:override_spf13_bundles')
      set statusline+=%{fugitive#statusline()}  " Git Hotness
   endif
   set statusline+=\ [%{&ff}/%Y]                " Filetype
   set statusline+=\ [%{getcwd()}]              " Current dir
   set statusline+=%=%-14.(%l,%c%V%)\ %p%%      " Right aligned file nav info
endif

" highlighting, search and matching options
set showmatch                               " highlight matching brackets
set hlsearch                                " highlight searches
set incsearch                               " incremental search highlights as you type
set ignorecase                              " case insensitive search
set smartcase                               " unless search contains uppercase letter
set infercase                               " case based completion
set novisualbell                            " no beep



" To clear the search highlighting, set the below option
if exists('g:vim_clear_search_highlight')
    nmap <silent> <leader>/ :nohlsearch<CR>
else
    nmap <silent> <leader>/ :set invhlsearch<CR>
endif

"function! core_settings#SearchHlClear()
"    let @/ = ''
"endfunction
"
"augroup searchhighlighting
"    autocmd!
"    autocmd CursorHold,CursorHoldI * call core_settings#SearchHlClear()
"augroup END

"{{{ cursor line changes

highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240

" Default Colors for CursorLine
"highlight  CursorLine ctermbg=Yellow ctermfg=None

" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue

" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue

"}}}


" for 256 color terminal support
if &term =~# '256color'
   " disable Background Color Erase (BCE) so that color schemes
   " render properly when inside 256-color tmux and GNU screen.
   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


" Use pleasant but very visible search hilighting
hi Search term=reverse ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search


" -----------------------------------------------------------------------------
"  function to ensure that a directory exists
" -----------------------------------------------------------------------------
function! EnsureDirExists(dirpath)
    if !isdirectory(expand(a:dirpath))
        silent call mkdir(expand(a:dirpath))
    endif
endfunction

" -----------------------------------------------------------------------------
"  cache settings - define settings for the cache directory
" -----------------------------------------------------------------------------
"let s:cache_dir = $HOME . '/.vim/.cache/'
let s:cache_dir = $HOME . '/.cache/'
call EnsureDirExists(s:cache_dir)

" -----------------------------------------------------------------------------
" a function for getting the under directory from cache dir
" -----------------------------------------------------------------------------
function! g:GetCacheDir(suffix)
    return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction

" -----------------------------------------------------------------------------
" data settings - set location values for the data
" -----------------------------------------------------------------------------
let s:data_dir   = $HOME . '/.data/'

" -----------------------------------------------------------------------------
" function for getting the under directory from data dir
" -----------------------------------------------------------------------------
function! g:GetDataDir(suffix)
    return resolve(expand(s:data_dir . '/' . a:suffix))
endfunction


" -----------------------------------------------------------------------------
"  File and Directory management settings
" -----------------------------------------------------------------------------
" variable setup
let s:backup_dir = g:GetDataDir('backup')
let s:swap_dir   = g:GetDataDir('swap')
let s:undo_dir   = g:GetDataDir('undo')

" now unlet the values and assign to actual vaiables
"
"unlet s:backup_dir
"unlet s:swap_dir
"unlet s:undo_dir
"unlet s:data_dir
"set undodir=$HOME/.data/undo
"set backupdir=$HOME/.data/backup
"set directory=$HOME/.data/swap

" for persistent undo management (track sequential changes in a session)
if exists('+undofile')
    set undofile
    set undolevels=1000
    let &undodir = g:GetDataDir('undo')
endif

" for backup file setting
set backup
let &backupdir = g:GetDataDir('backup')

" for swap file settings (*.swp)
let &directory = g:GetDataDir('swap')
"set noswapfile                                " if no .swp file for vim is needed

" incase if the directories are not available create them
call EnsureDirExists(s:data_dir)
call EnsureDirExists(&undodir)
call EnsureDirExists(&backupdir)
call EnsureDirExists(&directory)

" set current directory of file in current window
if has('autocmd')
    augroup vimrc
        autocmd!
        autocmd BufEnter * :lchdir %:p:h
    augroup end
endif

" keymapping to move between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" sudo - save file with superuser privileges
cmap w!! w !sudo tee >/dev/null %

" do not break the words.
set linebreak

" allow for mappings including Esc, while preserving zero timeout after pressing it manually
set ttimeout
set ttimeoutlen=50


" ------------------------------------------------------------------------------------
"  while editing a file, always jump to the last known cursor position. Don't
"  do that when the position is invalid or when inside an event handler.
" ------------------------------------------------------------------------------------
if has('autocmd')
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif


" ------------------------------------------------------------------------------------
" VIM Spellchecking
" ------------------------------------------------------------------------------------
if has('spell') " if vim support spell checking
    " Download the dictionaries automatically
    if !filewritable($HOME . '/.vim/private/spell')
        call mkdir($HOME . '/.vim/private/spell', 'p')
    endif

    " :set spell will do checks and jump using [s or s]
    " at the word z= will show suggestions (10 at most)
    set spellsuggest=10
    " spell checking for text, HTML, LaTeX, markdown and literate Haskell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spelllang=en_us

    " better error highlighting with solarized
    if exists('g:colors_name') && (g:colors_name ==# 'solarized' || g:colors_name ==# 'solarized8')
        highlight clear SpellBad
        highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline gui=undercurl guisp=red
        highlight clear SpellCap
        highlight SpellCap term=underline ctermfg=1 cterm=underline gui=undercurl guisp=blue
        highlight clear SpellRare
        highlight SpellRare term=underline ctermfg=1 cterm=underline gui=undercurl guisp=magenta
        highlight clear SpellLocal
        highlight SpellLocal term=underline ctermfg=1 cterm=underline
    endif
endif

" set dictionary
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

imap éé `                               " Easier anti-quote

" ------------------------------------------------------------------------------------
" show the column number at 81
" ------------------------------------------------------------------------------------
if (exists('+colorcolumn'))
    set colorcolumn=110
    highlight ColorColumn ctermbg=237
endif

hi VertSplit ctermbg=NONE guibg=NONE

" fix EOL
if exists('&fixendofline')
    set nofixendofline
endif

" ------------------------------------------------------------------------------------
" for MacVim specific settings - override macvim color scheme
" ------------------------------------------------------------------------------------
let g:macvim_skip_colorscheme=1

if has('gui_running')
    let g:do_syntax_sel_menu=1
endif

" #############################################################################
" #########################  end of core vim settings #########################
" #############################################################################
