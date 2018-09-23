" Vim Config - optimized for minimal loading
" load with vim -u minimal_config.vim

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vimrc
endif

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'Shougo/neocomplete.vim'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'Shougo/vimproc.vim'

    Plug 'davidhalter/jedi-vim'

    Plug 'w0rp/ale'
call plug#end()

let s:default_path = escape(&path, '\ ')
autocmd BufRead *
            \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
            \ exec "set path-=".s:tempPath |
            \ exec "set path-=".s:default_path |
            \ exec "set path^=".s:tempPath |
            \ exec "set path^=".s:default_path

let g:neocomplete#enable_at_startup                 = 1
let g:neocomplete#enable_smart_case                 = 1
let g:neocomplete#enable_camel_case                 = 1
let g:neocomplete#enable_fuzzy_completion           = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3        " set minimum syntax keyword length
let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*' " regex for buffer name
let g:neocomplete#force_overwrite_completefunc      = 1        " makes sure we use neocomplete completefunc

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#omni#functions.python   = 'jedi#complete'

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python       = '\h\w*\|[^.\t]\.\w*'
"let g:neocomplete#force_omni_input_patterns.python       = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns = {}
endif

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._       = ['_']

" jedi
let g:jedi#force_py_version = 3
let g:jedi#auto_vim_configuration = 1

autocmd FileType python setlocal omnifunc=jedi#completions
