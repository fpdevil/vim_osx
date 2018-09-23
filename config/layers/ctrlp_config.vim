" vim: tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" ------------------------------------------------------------------------------------
" -----------                    CtrlP customized bindings                 -----------
" ------------------------------------------------------------------------------------

let g:ctrlp_clear_cache_on_exit = 0                             " speed up by not clearing cache evertime
let g:ctrp_use_caching          = 500                           " enable caching
let g:ctrlp_max_files           = 2000                          " if 0 then no limit on files
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_mruf_relative       = 1
let g:ctrlp_show_hidden         = 1
let g:ctrlp_map                 = '<c-p>'
let g:ctrlp_cmd                 = 'CtrlP'
let g:ctrlp_working_path_mode   = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir           = GetCacheDir('ctrlp')         " for speeding up ctrl
let g:ctrlp_custom_ignore       = 'node_modules\|bower_components\|docs\|DS_Store\|^.git$\|_site'
let g:ctrlp_buftags             = {
            \ 'go' : '--language-force=go --golang-types=ftv',
            \ 'erlang' : '--language-force=erlang --erlang-types=drmf'
            \ }

" ------------------------------------------------------------------------------------
"  initialize the leader key map for misc section
" ------------------------------------------------------------------------------------
let g:lmap = get(g:, 'lmap', {})
" for CtrlP Family of tools
let g:lmap.p = {
            \ 'name': "+CtrlP Family ",
            \ }

let g:lmap.p.c = {
      \ 'name': '+Core CtrlP ',
      \ 'c': ['CtrlP', 'Invoke CtrlP in find file mode '],
      \ 'b': ['CtrlPBuffer', 'Open CtrlP in find buffer mode '],
      \ 'm': ['CtrlPMRUFiles', 'Recently opened files '],
      \ 'M': ['CtrlPMixed', 'Recent buffers + files + mru '],
      \ 'e': ['CtrlPClearCache', 'Flush cache for the CWD '],
      \ }

" ------------------------------------------------------------------------------------
"  silver searcher settings If ag is available use it as filename list generator
"  instead of 'find'
" ------------------------------------------------------------------------------------
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': 'ag %s --nocolor -l -g ""'
                \ }
endif

" ------------------------------------------------------------------------------------
"  ctrlp function navigator for python
" ------------------------------------------------------------------------------------
if &runtimepath =~# 'ctrlp-py-matcher'
    if !exists('g:ctrlp_match_func') && (has('python') || has('python3'))
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
    endif
endif

" ------------------------------------------------------------------------------------
"  CtrlP funky
" ------------------------------------------------------------------------------------
if &runtimepath =~# 'ctrlp-funky'
    let g:ctrlp_funky_syntax_highlight = 1
    let g:ctrlp_funky_matchtype = 'path'
    " nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    " nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    let g:lmap.p.f = {
                \ 'name' : 'CtrlP Funky Tools' ,
                \ 'u'    : [ 'CtrlPFunky'   , 'Get matching words' ],
                \ 'U'    : [ 'execute ''CtrlPFunky '' . expand(''<cword>'')' , 'Narrow list down with word under cursor'],
                \ }
endif


" ------------------------------------------------------------------------------------
"  CtrlP NerdTree integration
" ------------------------------------------------------------------------------------
if exists(':CtrlPNerdTree')
    let g:ctrlp_nerdtree_show_hidden = 1
    let g:lmap.p.n = ['CtrlPNerdTree', 'CtrlP open NERDTree in specified dir']
endif

" ------------------------------------------------------------------------------------
"  CtrlPSessions - manage your sessions
" ------------------------------------------------------------------------------------
if exists(':CtrlPSessions')
    let g:ctrlp_extensions = [
          \ 'funky', 'sessions', 'k',
          \ 'tag', 'mixed', 'quickfix',
          \ 'undo', 'line', 'changes',
          \ 'cmdline', 'menu',
          \ ]
    let g:lmap.p.s = ['CtrlPSessions', 'Get list of files in Session directory']
endif

" ------------------------------------------------------------------------------------
"  call external commands and show results in scratch window
" ------------------------------------------------------------------------------------
if &runtimepath =~# 'k.vim'
    "nnoremap <silent> <leader>qe :CtrlPK<CR>
    let g:lmap.p.q = ['CtrlPK', 'Open CtrlP k.vim quick launch']
endif

" ------------------------------------------------------------------------------------
"  CtrlP extension to launch something like external commands
" ------------------------------------------------------------------------------------
if exists(':CtrlPLauncher')
    "nnoremap <Leader>pl :<c-u>CtrlPLauncher<cr>
    let g:lmap.p.l = ['CtrlPLauncher', 'Launch CtrlP Menu']
endif

" ------------------------------------------------------------------------------------
" Fast vim CtrlP matcher based on python
" ------------------------------------------------------------------------------------
if &runtimepath =~# 'ctrlp-py-matcher'
    if !has('python')
        echo 'In order to use pymatcher plugin, you need +python compiled vim'
    else
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    endif
    let g:ctrlp_lazy_update = 350               " Set delay to prevent extra search
endif

" ------------------------------------------------------------------------------------
" Easily open locally modified files in your git-versioned projects
" ------------------------------------------------------------------------------------
if &runtimepath =~# 'ctrlp-modified.vim'
    let g:lmap.p.m = {
                \ 'name' : 'CtrlP Modified' ,
                \ 'm'    : [ 'CtrlPModified', 'Shows all files modified since your last commit' ],
                \ 'b'    : [ 'CtrlPBranch', 'Shows all files modified on your current branch'],
                \ 'B'    : [ 'CtrlPBranchModified', 'Combines m and b' ]
                \ }
endif

" ------------------------------------------------------------------------------------
" CtrlP Extension that allows adding custom menus of commands
" ------------------------------------------------------------------------------------
"if &rtp =~ 'vim-ctrlp-menu'
if exists('g:plugs["vim-ctrlp-menu"]')

    " the  plugin  creates  comman  line  abbreviations  for  CtrlpMenu  and
    " CtrlpMenuMenus as  follows, remove them  as menu and menus  are useful
    " elsewhere
    " cabbrev menu CtrlpMenu
    " cabbrev menus CtrlpMenuMenus
    let g:ctrlpmenu_skip_abbrev = 0

    let g:ctrlp_use_default_menu = 0

    " unmapping CtrlpMenuMenus which is bound to <leader>m by default
    autocmd VimEnter * nunmap <leader>m

    let g:ctrlp_menus={}
    let g:ctrlp_menus.colorschemes = {
                \ '* colorscheme solarized'  : 'colorscheme solarized8',
                \ '* colorscheme quantum'    : 'colorscheme quantum',
                \ '* colorscheme gruvbox'    : 'colorscheme gruvbox',
                \ '* colorscheme badwolf'    : 'colorscheme badwolf',
                \ '* colorscheme papercolor' : 'colorscheme PaperColor',
                \ }

    " now use leader key combination -pum to see CtrlpMenu
    let g:lmap.p.u = {
                \ 'name' : 'CtrlpMenu',
                \ 'm'    : ['CtrlpMenu', 'Show all Ctrlp Menus '],
                \ 'M'    : ['CtrlpMenuMenus', 'Show main Menus ']
                \ }
endif

augroup Fix_command_in_help_buffer
  au!
  autocmd FileType help exec 'nnoremap <buffer><silent><c-p> :<c-u>CtrlP ' . getcwd() .'<cr>'
  au FileType help exec "nnoremap <silent><buffer> q :q<CR>"
augroup END
