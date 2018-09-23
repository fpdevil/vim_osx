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

    Plug 'youthy/vimerl-complete'                                   " erlang auto complete
    Plug 'vim-erlang/vim-erlang-runtime'        " erlang indentation and syntax
    Plug 'vim-erlang/vim-erlang-compiler'       " erlang syntax checker and compiler
    Plug 'vim-erlang/vim-erlang-skeletons'      " erlang templates
    Plug 'vim-erlang/erlang-motions.vim'        " erlang motions and text objects
    Plug 'vim-erlang/vim-erlang-tags'           " erlang tag generate for vim
    Plug 'ehamberg/vim-cute-erlang'             " conceal for erlang
    Plug 'melekes/vim-erlang-spec'              " erlang generate specifications
    "Plug 'vim-erlang/vim-erlang-omnicomplete'  " erlang code auto completion
    "Plug 'oscarh/vimerl'                       " erlang plugins
    "Plug 'ppikula/vim-wrangler'                                    " vim wrangler plugin

    Plug 'w0rp/ale'
call plug#end()


let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_fuzzy_completion = 1

let g:vimerl_complete_auto = 1
