" -----------------------------------------------------------------------------
"  vim plantuml diagram support
" -----------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.pu,*.uml,*.plantuml setfiletype plantuml | set filetype=plantuml

if has_key(g:plugs, 'plantuml-syntax')
    let g:plantuml_executable_script = '$HOME/.vim/private/plantuml/uml.sh'
endif

" :w -> save and generate diagram above the @startuml
" :make -> will generate a .png with same name as file

if has_key(g:plugs, 'plantuml-previewer.vim')
    au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
        \  matchlist(system('grep plantuml.jar /usr/local/bin/plantuml'), '\v.* (\S+plantuml\.jar).*'),
        \  1,
        \  0
        \)
endif

" Usage
" Start editing plantuml file in Vim
" Run :PlantumlOpen to open previewer webpage in browser
" Saving plantuml file in Vim, then previewer webpage will refresh
"
" Examples
" :e diagram.puml
"
" :PlantumlSave
" :PlantumlSave diagram.png
" :PlantumlSave diagram.svg
