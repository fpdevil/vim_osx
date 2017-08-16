" ####################################################################################
" ################### VIM - Plugin Configuration and Customization ###################
" ####################################################################################

scriptencoding utf-8

" --- define a global variable for holding the plugins
" --- configuration files location
let g:plugins_config = "~/.vim/plugins_config/"

" --- custom function for sourcing each configuration file
function LoadConfig(cfg)
    let l:path = g:plugins_config
    exec "source " . l:path . a:cfg
endfunction

" load the required color scheme
" source ~/.vim/plugins_config/colors_config.vim
call LoadConfig("colors_config.vim")

" load the ranbow parenthesis configuration
call LoadConfig("rainbow_config.vim")

" load the Airline statusline configuration
call LoadConfig("airline_config.vim")

" load vim-indent-guides
call LoadConfig("vimindent_config.vim")

" laod vimshell
call LoadConfig("vimshell_config.vim")

" load vim motion controls
call LoadConfig("vimmotion_config.vim")

" load the ner commentor settings
call LoadConfig("nerdcommentor_config.vim")

" load supertab configuration
call LoadConfig("supertab_config.vim")

" load text/tab alignment
call LoadConfig("tabalign_config.vim")

" load easy text alignment configuration
call LoadConfig("easy_align_config.vim")

" load the neocomplete configuration for code completion
call LoadConfig("autocomplete_config.vim")

" load the configuration for asynchroonus code completion
call LoadConfig("async_code_completion.vim")

" load the snippet plugin related configuration
call LoadConfig("snippets_config.vim")

" load the syntastic plugin related configuration
call LoadConfig("syntax_config.vim")

" laod the syntax configuration for ALE if available
call LoadConfig("ale_config.vim")

" load the Haskell language configuration
call LoadConfig("haskell_config.vim")

" load the vim source completion configuration
call LoadConfig("vim_complete_config.vim")

" load the JavaScript language configuration
call LoadConfig("javascript_config.vim")

" load the clojure language configuration
call LoadConfig("clojure_config.vim")

" load the erlang language configuration
call LoadConfig("erlang_config.vim")

" load the YouCompleteMe configuration
call LoadConfig("ycm_config.vim")

" load the python language configuration
call LoadConfig("python_config.vim")

" load the GO language configuration
call LoadConfig("golang_config.vim")

" load the c/c++ language configuration
call LoadConfig("cpp_config.vim")

" load the NerdTree configuration
call LoadConfig("nerdtree_config.vim")

" load the VimFiler file explorer configuration
call LoadConfig("vimfiler_config.vim")

" load the Control-P configuration
call LoadConfig("ctrlp_config.vim")

" load the Ctrl-Space configuration
call LoadConfig("ctrlspace_config.vim")

" load the VCS/GIT Repo configuration
call LoadConfig("vcs_config.vim")

" load the configuration for vim signify (diff)
call LoadConfig("vim_signify_config.vim")

" load the UNITE plugin(s) configuration
call LoadConfig("unite_config.vim")

" load the pandoc configuration
call LoadConfig("pandoc_config.vim")

" load slime related configuration
call LoadConfig("slime_config.vim")

" load the TagBar configuration
call LoadConfig("tagbar_config.vim")

" load the TMUX configuration
call LoadConfig("tmux_config.vim")

" load the Multiple Cursors configuration
call LoadConfig("multiple_cursors_config.vim")

" load the matching tags configuration
call LoadConfig("match_tag_config.vim")

" load the vim startify configuration
call LoadConfig("startify_config.vim")

" highlight and underline matching lines
call LoadConfig("highlight_config.vim")

" load generic utilities configuration
call LoadConfig("utils_config.vim")

" load vim hier configuration for highlighting errors
call LoadConfig("hier_config.vim")

" load configuration for follow my leader plugin
call LoadConfig("fml_config.vim")

" load the configuration for vim notes
call LoadConfig("notes_config.vim")

" load the configuration for moving text
call LoadConfig("vim_move_config.vim")

" laod the configuration for html helper emmett
call LoadConfig("emmet_config.vim")

" load the configuration for vim leader guide
call LoadConfig("leader_guide_config.vim")

" load the configuration for indent line plugin
call LoadConfig("indentline_config.vim")

" vim undo tree visualizer configuration
call LoadConfig("undo_tree_config.vim")

" vim writing tools configuration
call LoadConfig("goyo_config.vim")

" vim calendar configuration
call LoadConfig("calendar_config.vim")

" quickly highlight the selected words
call LoadConfig("qhl_config.vim")

" load the fuzzy finder configuration
call LoadConfig("fzf_config.vim")

" load vim bookmarks configuration
call LoadConfig("bookmarks_config.vim")

" load the configuration settings for promptline
call LoadConfig("promptline_config.vim")

" ####################################################################################
" ############################## Personal Configuration ##############################
" ####################################################################################



" END OF THE PLUGIN SETTINGS
" =====================================================================================
