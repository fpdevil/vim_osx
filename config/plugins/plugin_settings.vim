" ####################################################################################
" ################### VIM - Plugin Configuration and Customization ###################
" ####################################################################################

scriptencoding utf-8

" --- define a local variable for holding the plugins
" --- configuration files location
" --- now loaded as global variable from vimrc
let s:plugins_config = "~/.vim/config/layers/"

" --- custom function for sourcing each configuration file
function s:LoadConfig(cfg)
    let l:path = g:plugins_config
    exec "source " . l:path . a:cfg
endfunction

" load the required color scheme
call s:LoadConfig("colors_config.vim")

" load the ranbow parenthesis configuration
call s:LoadConfig("rainbow_config.vim")

" load the Airline statusline configuration
call s:LoadConfig("airline_config.vim")

" load vim-indent-guides
"call s:LoadConfig("vimindent_config.vim")

" laod vimshell
call s:LoadConfig("vimshell_config.vim")

" load vim motion controls
call s:LoadConfig("vimmotion_config.vim")

" load the ner commentor settings
call s:LoadConfig("nerdcommentor_config.vim")

" load supertab configuration
call s:LoadConfig("supertab_config.vim")

" load text/tab alignment
call s:LoadConfig("tabalign_config.vim")

" load easy text alignment configuration
call s:LoadConfig("easy_align_config.vim")

" load the neocomplete configuration for code completion
call s:LoadConfig("autocomplete_config.vim")

" load the complete parameter configuration
call s:LoadConfig("completeparam_config.vim")

" load the neocomplete nextgen autocomplete configuration
call s:LoadConfig("neocomplete_config.vim")

" load the configuration for asynchroonus code completion
call s:LoadConfig("async_code_completion.vim")

" load the snippet plugin related configuration
call s:LoadConfig("snippets_config.vim")

" load the syntastic plugin related configuration
call s:LoadConfig("syntax_config.vim")

" laod the syntax configuration for ALE if available
call s:LoadConfig("ale_config.vim")

" load the Haskell language configuration
call s:LoadConfig("haskell_config.vim")

" load the vim source completion configuration
call s:LoadConfig("vim_complete_config.vim")

" load the JavaScript language configuration
call s:LoadConfig("javascript_config.vim")

" load the clojure language configuration
call s:LoadConfig("clojure_config.vim")

" load the erlang language configuration
call s:LoadConfig("erlang_config.vim")

" load the YouCompleteMe configuration
call s:LoadConfig("ycm_config.vim")

" load the python language configuration
call s:LoadConfig("python_config.vim")

" load the GO language configuration
call s:LoadConfig("golang_config.vim")

" load the c/c++ language configuration
call s:LoadConfig("cpp_config.vim")

" load the scala language configuration
call s:LoadConfig("scala_config.vim")

" load the NerdTree configuration
call s:LoadConfig("nerdtree_config.vim")

" load the VimFiler file explorer configuration
call s:LoadConfig("vimfiler_config.vim")

" load the Control-P configuration
call s:LoadConfig("ctrlp_config.vim")

" load the Ctrl-Space configuration
call s:LoadConfig("ctrlspace_config.vim")

" load the VCS/GIT Repo configuration
call s:LoadConfig("vcs_config.vim")

" load the configuration for vim signify (diff)
call s:LoadConfig("vim_signify_config.vim")

" load the UNITE plugin(s) configuration
call s:LoadConfig("unite_config.vim")

" load the pandoc configuration
call s:LoadConfig("pandoc_config.vim")

" load slime related configuration
call s:LoadConfig("slime_config.vim")

" load the TagBar configuration
call s:LoadConfig("tagbar_config.vim")

" load the TMUX configuration
call s:LoadConfig("tmux_config.vim")

" load the Multiple Cursors configuration
call s:LoadConfig("multiple_cursors_config.vim")

" load the matching tags configuration
call s:LoadConfig("match_tag_config.vim")

" load the vim startify configuration
call s:LoadConfig("startify_config.vim")

" highlight and underline matching lines
call s:LoadConfig("highlight_config.vim")

" load generic utilities configuration
call s:LoadConfig("utils_config.vim")

" load configuration for follow my leader plugin
call s:LoadConfig("fml_config.vim")

" load the configuration for vim notes
call s:LoadConfig("notes_config.vim")

" load the configuration for moving text
call s:LoadConfig("vim_move_config.vim")

" laod the configuration for html helper emmett
call s:LoadConfig("emmet_config.vim")

" load the configuration for vim leader guide
call s:LoadConfig("leader_guide_config.vim")

" load the configuration for indent line plugin
call s:LoadConfig("indentline_config.vim")

" vim undo tree visualizer configuration
call s:LoadConfig("undo_tree_config.vim")

" vim writing tools configuration
call s:LoadConfig("goyo_config.vim")

" vim calendar configuration
call s:LoadConfig("calendar_config.vim")

" quickly highlight the selected words
call s:LoadConfig("qhl_config.vim")

" load the fuzzy finder configuration
call s:LoadConfig("fzf_config.vim")

" load vim bookmarks configuration
call s:LoadConfig("bookmarks_config.vim")

" load the configuration settings for promptline
call s:LoadConfig("promptline_config.vim")

" load configuration settings for vim-lookup
call s:LoadConfig("vim_lookup_config.vim")

" load configuration settings for vim-operator-highlight
call s:LoadConfig("operator_highlight_config.vim")

" load configuration settings for vim-ref
call s:LoadConfig("vimref_config.vim")

" load vim hier configuration for highlighting errors
" disabled had some problems with erlang
"call s:LoadConfig("hier_config.vim")

" ####################################################################################
" ############################## END OF PLUGIN SETTINGS ##############################
" ####################################################################################
