" ####################################################################################
" ################### VIM - Plugin Configuration and Customization ###################
" ####################################################################################

scriptencoding utf-8

" --- define a global variable for holding the plugins
" --- configuration files location
let g:plugins_config = "~/.vim/layers/"

" --- custom function for sourcing each configuration file
function LoadConfig(cfg)
    let l:path = g:plugins_config
    exec "source " . l:path . a:cfg
endfunction

call LoadConfig("colors_config.vim")
call LoadConfig("rainbow_config.vim")
call LoadConfig("airline_config.vim")
call LoadConfig("vimindent_config.vim")
call LoadConfig("vimshell_config.vim")
call LoadConfig("vimmotion_config.vim")
call LoadConfig("nerdcommentor_config.vim")
call LoadConfig("supertab_config.vim")
call LoadConfig("tabalign_config.vim")
call LoadConfig("easy_align_config.vim")
call LoadConfig("autocomplete_config.vim")
call LoadConfig("async_code_completion.vim")
call LoadConfig("snippets_config.vim")
call LoadConfig("syntax_config.vim")
call LoadConfig("ale_config.vim")
call LoadConfig("haskell_config.vim")
call LoadConfig("vim_complete_config.vim")
call LoadConfig("javascript_config.vim")
call LoadConfig("clojure_config.vim")
call LoadConfig("erlang_config.vim")
call LoadConfig("ycm_config.vim")
call LoadConfig("python_config.vim")
call LoadConfig("golang_config.vim")
call LoadConfig("cpp_config.vim")
call LoadConfig("nerdtree_config.vim")
call LoadConfig("vimfiler_config.vim")
call LoadConfig("ctrlp_config.vim")
call LoadConfig("ctrlspace_config.vim")
call LoadConfig("vcs_config.vim")
call LoadConfig("vim_signify_config.vim")
call LoadConfig("unite_config.vim")
call LoadConfig("pandoc_config.vim")
call LoadConfig("slime_config.vim")
call LoadConfig("tagbar_config.vim")
call LoadConfig("tmux_config.vim")
call LoadConfig("multiple_cursors_config.vim")
call LoadConfig("match_tag_config.vim")
call LoadConfig("startify_config.vim")
call LoadConfig("highlight_config.vim")
call LoadConfig("utils_config.vim")
"call LoadConfig("hier_config.vim")
call LoadConfig("fml_config.vim")
call LoadConfig("notes_config.vim")
call LoadConfig("vim_move_config.vim")
call LoadConfig("emmet_config.vim")
call LoadConfig("leader_guide_config.vim")
call LoadConfig("indentline_config.vim")
call LoadConfig("undo_tree_config.vim")
call LoadConfig("goyo_config.vim")
call LoadConfig("calendar_config.vim")
call LoadConfig("qhl_config.vim")
call LoadConfig("fzf_config.vim")
call LoadConfig("bookmarks_config.vim")
call LoadConfig("promptline_config.vim")
