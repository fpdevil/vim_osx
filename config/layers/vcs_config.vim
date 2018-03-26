" ------------------------------------------------------------------------------------
" ---------------------- custom settings for the vim git gutter ----------------------
" ------------------------------------------------------------------------------------
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

if has_key(g:plugs,'vim-fugitive')
    let g:lmap   = get(g:, 'lmap', {})
    let g:lmap.g = {
                \ 'name' : 'Git Tools',
	        \ 's'    : ['Gstatus',              'Git status'],
                \ 'b'    : ['Gblame',               'Git blame'],
                \ 'd'    : ['Gdiff',                'Git diff'],
                \ 'e'    : ['Gedit',                'Git edit'],
                \ 'i'    : ['Git add -p %',         'Git Interactive Add'],
                \ 'p'    : ['Gpull',                'Git pull'],
                \ 'q'    : ['Gpush',                'Git push'],
                \ 'c'    : ['Gcommit',              'Git commit'],
                \ 'w'    : ['Gwrite',               'Git write'],
                \ 'l'    : ['Glog',                 'Git log'],
                \ 'g'    : [':SignifyToggle',       'Toggle Signify'],
                \ 'n'    : ['GitGutterNextHunk',    'Jump to Next Hunk'],
                \ 'N'    : ['GitGutterPrevHunk',    'Jump to Previous Hunk'],
                \ 'A'    : ['GitGutterStageHunk',   'Hunk Add'],
                \ 'a'    : ['GitGutterUndoHunk',    'Hunk Undo'],
                \ 'v'    : ['GitGutterPreviewHunk', 'Preview Hunk']
                \ }
endif
