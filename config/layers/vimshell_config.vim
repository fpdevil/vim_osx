" ------------------------------------------------------------------------------------
" --- vimshell customizations
" ------------------------------------------------------------------------------------
"{{{ vimshell prompt setup
"if has_key(g:plugs, 'vimshell.vim')
if !empty(glob('~/.vim/plugged/vimshell.vim'))
    let g:vimshell_right_prompt                 = ''
    let g:vimshell_user_prompt                  = 'fnamemodify(getcwd(), ":~")'
    let g:vimshell_prompt                       = '% '
    let g:vimshell_split_command                = ''
    let g:vimshell_editor_command               = 'vim'
    let g:vimshell_prompt_expr                  = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
    let g:vimshell_prompt_pattern               = '^\%(\f\|\\.\)\+> '
    let g:vimshell_vimshrc_path                 = '~/.vim/config/misc/vimshrc'
    let g:vimshell_enable_transient_user_prompt = 1
    let g:vimshell_force_overwrite_statusline   = 1
    let g:vimshell_external_history_path        = expand('~/.zsh-history')
endif
"}}}
