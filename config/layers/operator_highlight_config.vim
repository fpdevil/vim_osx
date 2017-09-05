" plugin settings for vim-operator-highlight

if has_key(g:plugs,'vim-operator-highlight')
    let g:ophigh_highlight_link_group = 'Keyword'
    let g:ophigh_filetypes_to_ignore  = {
                \ 'qf': 1, 'help': 1, 'unite': 1, 'tagbar': 1, 'gundo': 1, 'vimshell': 1,
                \ 'vimfiler': 1, 'quickrun': 1, 'vim-plug': 1, 'codi': 1,
                \ 'zsh': 1, 'gitcommit': 1, 'text': 1, 'html': 1, 'javascript': 1, 'json': 1,
                \ 'css': 1, 'scss': 1, 'latex': 1, 'pandoc': 1,
                \ 'haskell': 1, 'purescript': 1, 'elm': 1, 'ocaml': 1,
                \ 'yaml': 1
                \ }
endif
