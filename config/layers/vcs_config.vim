" ------------------------------------------------------------------------------------
" ---------------------- custom settings for the vim git gutter ----------------------
" ------------------------------------------------------------------------------------

" Turn on spell checking for commit messages and automatic wrapping
" at the recommended 72 characters
augroup filetype_gitcommit
    autocmd!
    autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

" highlighting sign column
highlight clear SignColumn
highlight SignColumn ctermbg=0

let g:gitgutter_realtime        = 0
let g:gitgutter_map_keys        = 0            " too disable all key mappings
let g:gitgutter_highlight_lines = 1     "  turn on line highlighting
" to always have the sign column
if exists('&signcolumn')  " Vim 7.4.2201
    set signcolumn=yes
else
    let g:gitgutter_sign_column_always = 1
endif

"if has_key(g:plugs,'vim-fugitive')
if !empty(glob('~/.vim/plugged/vim-fugitive'))
    let g:lmap   = get(g:, 'lmap', {})
    let g:lmap.g = {
                \ 'name' : '+Git Tools',
                \ 's'    : ['Gstatus',              'Git status '],
                \ 'b'    : ['Gblame',               'Git blame '],
                \ 'd'    : ['Gdiff',                'Git diff '],
                \ 'e'    : ['Gedit',                'Git edit '],
                \ 'i'    : ['Git add -p %',         'Git Interactive Add '],
                \ 'p'    : ['Gpull',                'Git pull '],
                \ 'q'    : ['Gpush',                'Git push '],
                \ 'c'    : ['Gcommit',              'Git commit '],
                \ 'w'    : ['Gwrite',               'Git write '],
                \ 'l'    : ['Glog',                 'Git log '],
                \ 'g'    : [':SignifyToggle',       'Toggle Signify '],
                \ 'n'    : ['GitGutterNextHunk',    'Jump to Next Hunk '],
                \ 'N'    : ['GitGutterPrevHunk',    'Jump to Previous Hunk '],
                \ 'A'    : ['GitGutterStageHunk',   'Hunk Add '],
                \ 'a'    : ['GitGutterUndoHunk',    'Hunk Undo '],
                \ 'v'    : ['GitGutterPreviewHunk', 'Preview Hunk ']
                \ }
endif

"== == == == == == == == == == == == == == == == == == == == == == == == == ==
" Unite Menu integration for GIT
"== == == == == == == == == == == == == == == == == == == == == == == == == ==
let g:unite_source_menu_menus.git = {
        \ 'description' : '            admin git repositories
        \                                ⌘ [space]g',
        \ }
let g:unite_source_menu_menus.git.command_candidates = [
        \ ['▷ tig                                                        ⌘ <Leader>gt', 'normal <Leader>gt'],
        \ ['▷ git viewer             (gitv)                              ⌘ <Leader>gv', 'normal <Leader>gv'],
        \ ['▷ git viewer - buffer    (gitv)                              ⌘ <Leader>gV', 'normal <Leader>gV'],
        \ ['▷ git status             (fugitive)                          ⌘ <Leader>gs', 'Gstatus'],
        \ ['▷ git diff               (fugitive)                          ⌘ <Leader>gd', 'Gdiff'],
        \ ['▷ git commit             (fugitive)                          ⌘ <Leader>gc', 'Gcommit'],
        \ ['▷ git log                (fugitive)                          ⌘ <Leader>gl', 'exe "silent Glog | Unite -no-quit quickfix"'],
        \ ['▷ git log - all          (fugitive)                          ⌘ <Leader>gL', 'exe "silent Glog -all | Unite -no-quit quickfix"'],
        \ ['▷ git blame              (fugitive)                          ⌘ <Leader>gb', 'Gblame'],
        \ ['▷ git add/stage          (fugitive)                          ⌘ <Leader>gw', 'Gwrite'],
        \ ['▷ git checkout           (fugitive)                          ⌘ <Leader>go', 'Gread'],
        \ ['▷ git rm                 (fugitive)                          ⌘ <Leader>gR', 'Gremove'],
        \ ['▷ git mv                 (fugitive)                          ⌘ <Leader>gm', 'exe "Gmove " input("destino: ")'],
        \ ['▷ git push               (fugitive, buffer output)           ⌘ <Leader>gp', 'Git! push'],
        \ ['▷ git pull               (fugitive, buffer output)           ⌘ <Leader>gP', 'Git! pull'],
        \ ['▷ git command            (fugitive, buffer output)           ⌘ <Leader>gi', 'exe "Git! " input("comando git: ")'],
        \ ['▷ git edit               (fugitive)                          ⌘ <Leader>gE', 'exe "command Gedit " input(":Gedit ")'],
        \ ['▷ git grep               (fugitive)                          ⌘ <Leader>gg', 'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
        \ ['▷ git grep - messages    (fugitive)                          ⌘ <Leader>ggm', 'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
        \ ['▷ git grep - text        (fugitive)                          ⌘ <Leader>ggt', 'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
        \ ['▷ git init                                                   ⌘ <Leader>gn', 'Unite output:echo\ system("git\ init")'],
        \ ['▷ git cd                 (fugitive)', 'Gcd'],
        \ ['▷ git lcd                (fugitive)', 'Glcd'],
        \ ['▷ git browse             (fugitive)                          ⌘ <Leader>gB', 'Gbrowse'],
        \ ['▷ github dashboard       (github-dashboard)                  ⌘ <Leader>gD', 'exe "GHD! " input("Username: ")'],
        \ ['▷ github activity        (github-dashboard)                  ⌘ <Leader>gA', 'exe "GHA! " input("Username or repository: ")'],
        \ ['▷ github issues & PR                                         ⌘ <Leader>gS', 'der>gSnormal <Leader>gS'],
        \ ]

let g:unite_source_menu_menus.git.command_candidates = custom_functions#unite_menu_gen(g:unite_source_menu_menus.git.command_candidates, [])

nnoremap <silent>[menu]g :Unite -silent -winheight=29 -start-insert menu:git<CR>
" vim:set et sw=4 cc=79: