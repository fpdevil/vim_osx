" ------------------------------------------------------------------------------------
" -----------                    CtrlP customized bindings                 -----------
" ------------------------------------------------------------------------------------
set wildmode=list:longest,list:full

let g:ctrlp_clear_cache_on_exit = 0                             " speed up by not removing clearing cache evertime
let g:ctrlp_max_files           = 0                             " no limit on files
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_mruf_relative       = 1
let g:ctrlp_show_hidden         = 1
let g:ctrlp_map                 = '<c-p>'
let g:ctrlp_cmd                 = 'CtrlP'
let g:ctrlp_working_path_mode   = 'ra'
let g:ctrp_use_caching          = 500                           " enable caching
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir           = $HOME . '/.cache/ctrlp'       " for speeding up ctrl
let g:ctrlp_custom_ignore       = 'node_modules\|bower_components\|docs\|DS_Store\|^.git$\|_site'
let g:ctrlp_buftags             = {
            \ 'go' : '--language-force=go --golang-types=ftv',
            \ 'erlang'     : '--language-force=erlang --erlang-types=drmf'
            \ }

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = {
              \ 'types': {
              \ 1: ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
              \ 2: ['.hg', 'hg --cwd %s locate -I .'],
              \ },
              \ 'fallback': 'ag %s -l --nocolor -g ""'
              \ }
endif

if has_key(g:plugs,'ctrlp-py-matcher')
    if !exists('g:ctrlp_match_func') && (has('python') || has('python3'))
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
    endif
endif

if has_key(g:plugs,'ctrlp-funky')
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    let g:ctrlp_funky_syntax_highlight = 1
endif

if has_key(g:plugs,'ctrlp-nerdtree.vim')
    let g:ctrlp_nerdtree_show_hidden = 1
endif

if has_key(g:plugs, 'ctrlp-sessions')
    let g:ctrlp_extensions = ['funky', 'sessions' , 'k' , 'tag', 'mixed', 'quickfix', 'undo', 'line', 'changes', 'cmdline', 'menu']
endif

if has_key(g:plugs,'k.vim')
    nnoremap <silent> <leader>qe :CtrlPK<CR>
endif

if has_key(g:plugs,'ctrlp-launcher')
    nnoremap <Leader>pl :<c-u>CtrlPLauncher<cr>
endif

if has_key(g:plugs,'ctrlp-py-matcher')
    if !exists('g:ctrlp_match_func') && (has('python') || has('python3'))
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
    endif
endif

augroup Fix_command_in_help_buffer
  au!
  autocmd FileType help exec 'nnoremap <buffer><silent><c-p> :<c-u>CtrlP ' . getcwd() .'<cr>'
  au FileType help exec "nnoremap <silent><buffer> q :q<CR>"
augroup END
