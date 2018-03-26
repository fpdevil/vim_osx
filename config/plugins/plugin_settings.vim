" ####################################################################################
" ################### VIM - Plugin Configuration and Customization ###################
" ####################################################################################

scriptencoding utf-8
filetype plugin indent on

" --- define a local variable for holding the plugins
" --- configuration files location
" --- now loaded as global variable from vimrc
let s:plugins_config = "~/.vim/config/layers/"

" --- custom function for sourcing each configuration file
function s:LoadConfig(cfg)
    let l:path = g:plugins_config
    execute 'source ' . l:path . a:cfg
endfunction


call s:LoadConfig("leader_guide_config.vim")       " configuration for vim leader guide
call s:LoadConfig("colors_config.vim")             " required color scheme
call s:LoadConfig("rainbow_config.vim")            " rainbow parenthesis configuration
call s:LoadConfig("airline_config.vim")            " Airline statusline configuration
call s:LoadConfig("vimindent_config.vim")          " vim-indent-guides settings
call s:LoadConfig("vimshell_config.vim")           " settings for vim-shell
call s:LoadConfig("vimmotion_config.vim")          " vim motion controls
call s:LoadConfig("nerdcommentor_config.vim")      " nerd commentor settings
call s:LoadConfig("supertab_config.vim")           " supertab configuration
call s:LoadConfig("tabalign_config.vim")           " text/tab alignment
call s:LoadConfig("easy_align_config.vim")         " easy text alignment configuration
call s:LoadConfig("autocomplete_config.vim")       " neocomplete configuration for code completion
call s:LoadConfig("neocomplete_config.vim")        " neocomplete nextgen autocomplete configuration
"call s:LoadConfig("deoplete_config.vim")           " asynchronous code completion with deoplete
call s:LoadConfig("completion_sources.vim")        " syntax and completion sources
call s:LoadConfig("completeparam_config.vim")      " complete parameter configuration
call s:LoadConfig("async_code_completion.vim")     " configuration for asynchroonus code completion
call s:LoadConfig('vimplugins_config.vim')         " vim-plugins assortment of c-support,vim,py etc
call s:LoadConfig("snippets_config.vim")           " snippet plugin related configuration
call s:LoadConfig("syntax_config.vim")             " syntastic plugin related configuration
call s:LoadConfig("ale_config.vim")                " syntax configuration for ALE if available
call s:LoadConfig("haskell_config.vim")            " Haskell language configuration
call s:LoadConfig("vim_complete_config.vim")       " vim source completion configuration
call s:LoadConfig("javascript_config.vim")         " JavaScript language configuration
call s:LoadConfig("clojure_config.vim")            " clojure language configuration
call s:LoadConfig("erlang_config.vim")             " erlang language configuration
call s:LoadConfig("ycm_config.vim")                " YouCompleteMe configuration
call s:LoadConfig("python_config.vim")             " python language configuration
call s:LoadConfig("golang_config.vim")             " GO language configuration
call s:LoadConfig("cpp_config.vim")                " c/c++ language configuration
call s:LoadConfig("scala_config.vim")              " scala language configuration
call s:LoadConfig("nerdtree_config.vim")           " NerdTree configuration
call s:LoadConfig("vimfiler_config.vim")           " VimFiler file explorer configuration
call s:LoadConfig("ctrlp_config.vim")              " Control-P configuration
call s:LoadConfig("ctrlspace_config.vim")          " Ctrl-Space configuration
call s:LoadConfig("vcs_config.vim")                " VCS/GIT Repo configuration
call s:LoadConfig("vim_signify_config.vim")        " configuration for vim signify (diff)
call s:LoadConfig("unite_config.vim")              " UNITE plugin(s) configuration
call s:LoadConfig("neomru_config.vim")             " neomru settings
call s:LoadConfig("pandoc_config.vim")             " pandoc configuration
call s:LoadConfig("slime_config.vim")              " slime related configuration
call s:LoadConfig("tagbar_config.vim")             " TagBar configuration
call s:LoadConfig("tmux_config.vim")               " TMUX configuration
call s:LoadConfig("multiple_cursors_config.vim")   " Multiple Cursors configuration
call s:LoadConfig("match_tag_config.vim")          " matching tags configuration
call s:LoadConfig("startify_config.vim")           " vim startify configuration
call s:LoadConfig("highlight_config.vim")          " settings for highlight and underline matching lines
call s:LoadConfig("utils_config.vim")              " generic utilities configuration
call s:LoadConfig("fml_config.vim")                " configuration for follow my leader plugin
call s:LoadConfig("notes_config.vim")              " configuration for vim notes
call s:LoadConfig("vim_move_config.vim")           " configuration for moving text
call s:LoadConfig("emmet_config.vim")              " configuration for html helper emmett
call s:LoadConfig("indentline_config.vim")         " configuration for indent line plugin
call s:LoadConfig("undo_tree_config.vim")          " vim undo tree visualizer configuration
call s:LoadConfig("goyo_config.vim")               " vim writing tools configuration
call s:LoadConfig("calendar_config.vim")           " vim calendar configuration
call s:LoadConfig("qhl_config.vim")                " settings for quickly highlighting selected words
call s:LoadConfig("fzf_config.vim")                " fuzzy finder configuration
call s:LoadConfig("bookmarks_config.vim")          " vim bookmarks configuration
call s:LoadConfig("promptline_config.vim")         " configuration settings for promptline
call s:LoadConfig("vim_lookup_config.vim")         " configuration settings for vim-lookup
call s:LoadConfig("operator_highlight_config.vim") " configuration settings for vim-operator-highlight
call s:LoadConfig("vimref_config.vim")             " configuration settings for vim-ref
call s:LoadConfig('xml_config.vim')                " configuration settings for xml
call s:LoadConfig('autoformat_config.vim')         " configuration settings for vim-autoformat
" disabled had some problems with erlang
"call s:LoadConfig("hier_config.vim")              " vim hier configuration for highlighting errors

" ####################################################################################
" ############################## END OF PLUGIN SETTINGS ##############################
" ####################################################################################
