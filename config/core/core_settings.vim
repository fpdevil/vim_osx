" ####################################################################################
" ###############       VIM Core Editor Configurations and Settings    ###############
" ####################################################################################

" ************************************************************************************
" *******    For UNICODE support of symbols like ⚠                             *******
" *******    note: set encoding BEFORE script encoding                         *******
" ************************************************************************************
scriptencoding utf-8

" below 2 options to be loaded first
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
endif
filetype off

set encoding=utf-8                              " utf-8 encoding
set fileencoding=utf-8                          " file utf-8 encode
set fileencodings=utf-8                         " file utf-8 encode
scriptencoding utf-8                            " utf-8 encoding for scripts
set binary                                      " enable binary support
set showcmd                                     " show current command in status bar
set showmode                                    " show mode in status bar
set showmatch                                   " show matching brackets

" complete options
" set completeopt=menu,menuone,longest,preview
set completeopt+=menuone	                      " always show the completion menu
set completeopt+=preview	                      " sometimes annoying window on the top
set completeopt+=longest	                      " do not select the first variant by default

set backspace=indent,eol,start                  " fix backspace indent

set hidden

"set list
"set listchars=tab:\|\ ,                        " sets a | char at tab
set grepformat=%f:%l:%c:%m,%f:%l:%m

" highlight the current line and active column (shows crosshairs as +)
"set cursorline
"set cuc cul"

" show wildmenu
set wildmenu

" allow plugins by file type (required for plugins!)
" filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

" dont fold by default
set nofoldenable

" ignore case while completing file names
set wildignorecase

" enable mouse in normal, insert and visual modes
set mouse=niv

" do not redraw screen while executing macros; much faster
set lazyredraw

" let vim set the text of the window icon
set icon

" generate documentation tags automatically
silent! helptags ALL

" get the system os running
let os = substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
    let s:sysos = 'osx'
endif

" ------------------------------------------------------------------------------------
" ----- set some options for the gui so that it can show toolbar, left and right -----
" ----- scrollbars (for gvim amd macvim)                                         -----
" ----- set the default fontset for vim in gui mode                              -----
" ------------------------------------------------------------------------------------
if has('gui_running')
    set guioptions-=m " Hide menu bar.
    set guioptions-=T " Hide toolbar
    set guioptions-=L " Hide left-hand scrollbar
    set guioptions-=r " Hide right-hand scrollbar
    set guioptions-=b " Hide bottom scrollbar
    set showtabline=0 " Hide tabline
    set guioptions-=e " Hide tab
    if s:sysos == 'osx'
        set guifont=Monaco\ for\ Powerline:h12
    elseif s:sysos == 'linux'
        set guifont=DejaVu\ Sans\ Mono\ 11
    endif
endif

" show number and relative number
set relativenumber
set number

" set fillchar
hi VertSplit ctermbg=NONE guibg=NONE
"set fillchars+=vert:│

" Tab and indentation management (May be overriten by autocmd rules)
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " tabs are spaces
set shiftwidth=4

set autoindent                  " copy indent from current line
set autoread                    " read open files again if changed outside vim
set smartindent
set cindent
set cinoptions=(0,u0,U0

" Text auto formatting options
set formatoptions=c,q,r,t
" | | | |
" | | | +------- Auto-wrap text using textwidth.
" | | +--------- Auto insert the current comment leader after
" | |            hitting <Enter> in Insert mode.
" | +----------- Allow formatting of comments with 'gq'.
" +------------- Auto-wrap comments using textwidth, inserting
"                the current comment leader automatically.

" ************************************************************************************
" ************                vim  Leader key mapping                     ************
" ************      use the option '-' + <keymap> for all shortcuts       ************
" ************************************************************************************
if ! exists("mapleader")
    let mapleader = "-"
    "let mapleader = "\<Space>"
endif

if ! exists("g:mapleader")
    let g:mapleader = "-"
endif
" leader key timeout
set tm=2000


" ------------------------------------------------------------------------------------
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" ------------------------------------------------------------------------------------
set bs=2                                    " allow backspacing over everything in insert mode
set viminfo='20,\"50                        " read/write a .viminfo file, don't store more
                                            " than 50 lines of registers
set history=10000                           " keep 100000 lines of command line history
set ruler                                   " show the cursor position all the time
syntax on                                   " syntax highlighting

set hlsearch                                " highlight searches
set incsearch                               " incremental search highlights as you type

set ignorecase                              " case insensitive search
set smartcase                               " unless search contains uppercase letter
set laststatus=2                            " always show the status line
set novisualbell                            " no beep

if has('syntax')
    syntax enable
endif

" for 256 color terminal support
if &term =~ '256color'
   " disable Background Color Erase (BCE) so that color schemes
   " render properly when inside 256-color tmux and GNU screen.
   " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

"if has("termguicolors")
"    set termguicolors
"endif


" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search


" Undo changes persistence for sequential changes in a session
"if has('persistent_undo')
"    " create directory if it does not exist
"    if isdirectory($HOME . '/.vim/undo') == 0
"        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
"    endif
"    set undodir=~/.vim/undo                     " Location to store undo history
"    set undofile                                " Persistent undo
"    set undolevels=1000                         " Max number of changes
"    set undoreload=10000                        " Max lines to save for undo on a buffer reload
"endif

" backup and undo for tracking sequential changes in a session
set backup
set undofile
set undolevels=1000
let g:data_dir = $HOME . '/.vim/.data/'
let g:backup_dir = g:data_dir . 'backup'
let g:swap_dir = g:data_dir . 'swap'
let g:undo_dir = g:data_dir . 'undofile'
if finddir(g:data_dir) ==# ''
  silent call mkdir(g:data_dir)
endif
if finddir(g:backup_dir) ==# ''
  silent call mkdir(g:backup_dir)
endif
if finddir(g:swap_dir) ==# ''
  silent call mkdir(g:swap_dir)
endif
if finddir(g:undo_dir) ==# ''
  silent call mkdir(g:undo_dir)
endif
unlet g:backup_dir
unlet g:swap_dir
unlet g:data_dir
unlet g:undo_dir
set undodir=$HOME/.vim/.data/undofile
set backupdir=$HOME/.vim/.data/backup
set directory=$HOME/.vim/.data/swap

" set current directory of file in current window
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
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
" while editing a file, always jump to the last known cursor position. Don't
" do that when the position is invalid or when inside an event handler.
" ------------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" ------------------------------------------------------------------------------------
" ***           custom color highlighting and alerts in common editing             ***
" ------------------------------------------------------------------------------------
highlight Cursor guibg=black guifg=pink             " gui cursor color
highlight Search guibg=peru guifg=wheat             " gui search highlight

highlight CommaAndNonSpace      ctermbg=brown guifg=white guibg=brown
highlight EOLSpace              ctermbg=brown guifg=white guibg=brown
highlight HashRocketAndNonSpace ctermbg=brown guifg=white guibg=brown
highlight NonSpaceAndHashRocket ctermbg=brown guifg=white guibg=brown
highlight SpaceAndComma         ctermbg=brown guifg=white guibg=brown
highlight Tab                   ctermbg=brown guifg=white guibg=brown
highlight WideEisuu             ctermbg=brown guifg=white guibg=brown
highlight WideSpace             ctermbg=brown guifg=white guibg=brown
highlight BadWhitespace         ctermbg=brown guifg=white guibg=brown

" Setting Italics for comments
"highlight Comment cterm=italic
"highlight Comment gui=italic
highlight htmlArg cterm=italic

" Searing red very visible cursor red back ground
hi Cursor guibg=red
" Use same color behind the concealed unicode characters
hi clear Conceal


" VIM Spellchecking
if has("spell") " if vim support spell checking
    " Download the dictionaries automatically
    if !filewritable($HOME . "/.vim/spell")
        call mkdir($HOME . "/.vim/spell","p")
    endif
    set spellsuggest=10  " z= will show suggestions (10 at most)
    " spell checking for text, HTML, LaTeX, markdown and literate Haskell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spell
    autocmd BufEnter *.txt,*.tex,*.html,*.md,*.ymd,*.lhs setlocal spelllang=fr,en
    " better error highlighting with solarized
    if exists('g:colors_name') && g:colors_name == 'solarized'
        highlight clear SpellBad
        highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
        highlight clear SpellCap
        highlight SpellCap term=underline cterm=underline
        highlight clear SpellRare
        highlight SpellRare term=underline cterm=underline
        highlight clear SpellLocal
        highlight SpellLocal term=underline cterm=underline
    endif
endif

" Easier anti-quote
imap éé `

" show the column number at 81
if (exists('+colorcolumn'))
    "set colorcolumn=80
    "highlight ColorColumn ctermbg=0
    set colorcolumn=110
    highlight ColorColumn ctermbg=lightgray
endif

" if no .swp file for vim is needed
" set noswapfile

" for MacVim specific settings
" override macvim color scheme
let macvim_skip_colorscheme=1

if has('gui_running')
  let do_syntax_sel_menu=1
endif

" #############################################################################
" #########################  end of core vim settings #########################
" #############################################################################
