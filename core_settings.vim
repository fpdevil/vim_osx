" ####################################################################################
" ###############       VIM Core Editor Configurations and Settings    ###############
" ####################################################################################

" ************************************************************************************
" *******    For UNICODE support of symbols like ⚠                             *******
" *******    note: set encoding BEFORE script encoding                         *******
" ************************************************************************************
set encoding=utf-8                              " utf-8 encoding
set fileencoding=utf-8                          " file utf-8 encode
set fileencodings=utf-8                         " file utf-8 encode
scriptencoding utf-8                            " utf-8 encoding for scripts
set binary                                      " enable binary support
set showcmd                                     " show current command in status bar
set showmode                                    " show mode in status bar
set showmatch                                   " show matching brackets

set backspace=indent,eol,start                  " fix backspace indent

set nocompatible
set hidden

filetype plugin on
filetype indent on

" set default font for vim
set guifont=Monaco\ for\ Powerline:h12

" ************************************************************************************
" ************                vim  Leader key mapping                     ************
" ************      use the option '-' + <keymap> for all shortcuts       ************
" ************************************************************************************
if ! exists("mapleader")
    let mapleader = "-"
endif

if ! exists("g:mapleader")
    let g:mapleader = "-"
endif
" leader key timeout
set tm=2000


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set bs=2                                    " allow backspacing over everything in insert mode
set viminfo='20,\"50                        " read/write a .viminfo file, don't store more
                                            " than 50 lines of registers
set history=10000                           " keep 100000 lines of command line history
set ruler                                   " show the cursor position all the time
syntax on                                   " syntax highlighting
set hlsearch                                " highlight searches
set incsearch                               " incremental search
set ignorecase                              " case insensitive search
set smartcase                               " unless search contains uppercase letter
set laststatus=2                            " always show the status line
set visualbell                              " no beep
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


" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search


" Undo changes persistence for sequential changes in a session
if has('persistent_undo')
    " create directory if it does not exist
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=~/.vim/undo                     " Location to store undo history
    set undofile                                " Persistent undo
    set undolevels=1000                         " Max number of changes
    set undoreload=10000                        " Max lines to save for undo on a buffer reload
endif


" keymapping to move between splits
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

" ************************************************************************************
" ***           custom color highlighting and alerts in common editing             ***
" ************************************************************************************
highlight Cursor guibg=black guifg=pink             " gui cursor color
highlight Search guibg=peru guifg=wheat             " gui search highlight

highlight CommaAndNonSpace      ctermbg=red guifg=white guibg=red
highlight EOLSpace              ctermbg=red guifg=white guibg=red
highlight HashRocketAndNonSpace ctermbg=red guifg=white guibg=red
highlight NonSpaceAndHashRocket ctermbg=red guifg=white guibg=red
highlight SpaceAndComma         ctermbg=red guifg=white guibg=red
highlight Tab                   ctermbg=red guifg=white guibg=red
highlight WideEisuu             ctermbg=red guifg=white guibg=red
highlight WideSpace             ctermbg=red guifg=white guibg=red

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
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=2 term=underline cterm=underline
    highlight clear SpellCap
    highlight SpellCap term=underline cterm=underline
    highlight clear SpellRare
    highlight SpellRare term=underline cterm=underline
    highlight clear SpellLocal
    highlight SpellLocal term=underline cterm=underline
endif

" ------------------------------------------------------------------------------------
" ----- set some options for the gui so that it can show toolbar, left and right -----
" ----- scrollbars (for gvim amd macvim)                                         -----
" ------------------------------------------------------------------------------------
if has("gui_running")
   set guioptions-=T
   set guioptions-=l
   set guioptions-=L
   set guioptions-=r
   set guioptions-=R
   set guioptions-=m
   set guioptions-=M
endif

" Easier anti-quote
imap éé `

" show the column number at 81
if (exists('+colorcolumn'))
    "set colorcolumn=80
    "highlight ColorColumn ctermbg=0
    set colorcolumn=110
    highlight ColorColumn ctermbg=darkgray
endif

" if no .swp file for vim is needed
" set noswapfile

" *************************************************************************************
" **********  ctags generated using exuverant ctags at /usr/local/bin/ctags  **********
" **** /usr/local/bin/ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q  ****
" **** --language-force=C++ -f opencv                                              ****
" ****  /usr/local/Cellar/opencv3/HEAD-6328076_4/include/                          ****
" *************************************************************************************
set tags+=~/.vim/tags/opencv

" for MacVim specific settings
" override macvim color scheme
let macvim_skip_colorscheme=1

if has('gui_running')
  let do_syntax_sel_menu=1
endif

" =====================================================================================
