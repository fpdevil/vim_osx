" ####################################################################################
" ################        Custom functions required for vim         ##################
" ####################################################################################


" -----------------------------------------------------------------------------
" define a function for customizing the vim-startify based on the current
" vim working directory
" -----------------------------------------------------------------------------
function! StartifyConfig()
    if getcwd() == $HOME
        let g:startify_list_order = [
                    \ ['   Most Recently Used Files:'], 'files',
                    \ ['   Sessions:'], 'sessions',
                    \ ['   Bookmarks:'], 'bookmarks'
                    \ ]
    else
        let l:dir = substitute(getcwd(), '^' . $HOME, '~', '')
        let g:startify_list_order = [
                    \ ['   Most Recently Used Files:'], 'files',
                    \ ['   MRU Files in ' . l:dir . ':'], 'dir',
                    \ ['   Sessions:'], 'sessions',
                    \ ['   Bookmarks:'], 'bookmarks'
                    \ ]
    endif
endfunction

" ------------------------------------------------------------------------------------
" ------------------------------------------------------------------------------------
"Function: ListJsLinterConfig
"Desc: returns an associative list of mappings containing the js linters with
"      its corresponding configuration file
"
"Arguments: void
"
function! ListJsLinterConfig()
    return {
                \ 'eslint' : ['.eslintrc', '.eslintrc.json', '.eslintrc.js', '.eslint.yml'],
                \ 'jshint' : ['.jshintrc']
                \ }
endfunction

"Function: CheckJsLintConfig
"Desc: check if the associated configuration file for the linter exists
"
"Arguments: path, list of linters
"
function! CheckJsLintConfig(path, linters)
    let l:dir = fnamemodify(a:path, ':p:h')

    if (l:dir == '/')
        return ['']
    endif

    for l:linter in keys(a:linters)
        for l:linterConfig in a:linters[l:linter]
            if filereadable(l:dir . '/' . l:linterConfig)
                let l:localLinter = l:dir . '/node_modules/.bin/' . l:linter
                if executable(l:localLinter)
                    return [l:linter, l:localLinter]
                endif
                return [l:linter, l:linter]
            endif
        endfor
    endfor

    return CheckJsLintConfig(fnamemodify(l:dir, ':h'), a:linters)
endfunction

" ------------------------------------------------------------------------------------
" define function for switching between the source and header files using the
" ctags. this only supports '.cpp' and '.h' files
" ------------------------------------------------------------------------------------
function! SwitchHeader()
    if(expand("%:e") == "c" || expand("%:e") == "cpp")
        execute ":edit " . expand("%:r") . ".h"
    elseif(expand("%:e") == "h")
        execute ":edit " . expand("%:r") . ".c*"
    else
        echoerr "ERROR: Unknown filetype"
    endif
endfunction
nmap <silent> <Leader>fs :call SwitchHeader()<CR>

" ------------------------------------------------------------------------------------
" define a function for highlighting the duplicate lines
" copied from StackOverflow at the below link ->
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
" ------------------------------------------------------------------------------------
function! HighlightRepeats() range
    let lineCounts={}
    let lineNum=a:firstline
    while lineNum <= a:lastline
        let lineText=getline(lineNum)
        if lineText != ""
            let lineCounts[lineText]=(has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
        endif
        let lineNum=lineNum + 1
    endwhile
    exe 'syn clear Repeat'
    for lineText in keys(lineCounts)
        if lineCounts[lineText] >= 2
            exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
        endif
    endfor
endfunction
command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" ------------------------------------------------------------------------------------
" define function for handling the exuberant c tags
" ------------------------------------------------------------------------------------
function! UpdateTags()
    execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
    echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction

"Function: CTags
"Desc: generate ctags
"
"Arguments: none
"
function! CTags()
    let c_cmd = globpath(&runtimepath,'plugged/vimproc.vim') != '' ? 'VimProcBang' : '!'
    execute c_cmd 'ctags -R'
    NeoCompleteTagMakeCache
endfunction

" ------------------------------------------------------------------------------------
" define a function to find an appropriate .jshintrc file for javascript
" ------------------------------------------------------------------------------------
function! s:locate_jshintrc(dir)
    let l:found = globpath(a:dir, '.jshintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:locate_jshintrc(l:parent)
    endif

    return "~/.jshintrc"
endfunction

function! UpdJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:locate_jshintrc(l:dir)
    "deprecated option
    "let g:syntastic_javascript_jshint_conf = l:jshintrc
    let g:syntastic_javascript_jshint_args = l:jshintrc
endfunction

au BufEnter * call UpdJsHintConf()

" ------------------------------------------------------------------------------------
" a function for renaming the current file
" ------------------------------------------------------------------------------------
function! RenameFile()
    let current_file_name = expand('%')
    let new_file_name = input('New File Name: ', expand('%'), 'file')
    if new_file_name != '' && new_file_name != current_file_name
        exec ':saveas ' . new_file_name
        exec ':silent !rm ' . current_file_name
        redraw!
    endif
endfunction

" map <leader>rn :call RenameFile()<CR>

" -----------------------------------------------------------------------------
" a function to toggle the background
" -----------------------------------------------------------------------------
function! ToggleBG()
    let s:togglebg = &background
    if s:togglebg == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

"noremap <Leader>bg :call ToggleBG()<CR>

" -----------------------------------------------------------------------------
" a function to toggle line numbers
" -----------------------------------------------------------------------------
function! ToggleNumber()
    let s:numberPresent = &nu
    let s:relativeNumberPresent = &relativenumber
    if s:numberPresent && s:relativeNumberPresent
        set paste!
        set nonumber
        set norelativenumber
    else
        set paste!
        set number
        set relativenumber
    endif
endfunction

" -----------------------------------------------------------------------------
" show current color scheme name - usage  - call ShowColorTheme()
" -----------------------------------------------------------------------------
function! ShowColorTheme()
    let current_scheme = get(g:, 'colors_name', 'default')
    echo current_scheme
    " try
        " echo g:colors_name
    " catch /^Vim:E121/
        " echo "default
    " endtry
endfunction

"noremap <Leader>st :call ShowColorTheme()<CR>

" function to check for existence of colorscheme
function! HasColorScheme(name)
    let pattern = 'colors/' . a:name . '.vim'
    return !empty(globpath(&rtp, pattern))
endfunction

" -----------------------------------------------------------------------------
"  rotate through the color schemes with <F8>
" -----------------------------------------------------------------------------
"Function: s:current_colors
"Desc: filter and get all the installed color schemes from plugin
"Arguments: nil
"
function! s:current_colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

"Function: s:change_colors
"Desc: rotate through the available color schemes with F8
"      got from some vim forum
"Arguments: nil
"
function! s:change_colors()
    if !exists('s:current_colors')
        let s:current_colors = s:current_colors()
    endif
    let cname = remove(s:current_colors, 0)
    call add(s:current_colors, cname)
    execute 'colorscheme' cname
    redraw
    echo cname
endfunction
nnoremap <silent> <F8> :call <SID>change_colors()<cr>

" -----------------------------------------------------------------------------
" a custom functions for handling the Module name of Haskell
" The initial letter should be in upper case
" -----------------------------------------------------------------------------
function! Split(path)
    if has("win32")
        return split(a:path, '[\/]\+')
    else
        return split(a:path, '/\+')
    endif
endfunction

function! CapitalizedSuffix(ps)
    let result=[]
    for p in reverse(a:ps)
        if p =~# '^[[:upper:]]'
            let result=[p]+result
        else
            break
        endif
    endfor
    return result
endfunction

function! g:ModuleName()
    let ps=CapitalizedSuffix(Split(expand('%:p')))
    let n=len(ps)
    if n==0
        return ''
    else
        " strip the extension of the last component
        "
        let ps[n-1]=fnamemodify(ps[n-1], ":r:t")
        return join(ps,'.')
    endif
endfunction


" -----------------------------------------------------------------------------
" a function for compiling the src code...
" -----------------------------------------------------------------------------
function! CompileNRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "exec "!go build %<"
        exec "!time go run %"
endfunc

" for unite menu
let s:leaderKey = exists("&mapleader") ? &mapleader : ','

function! custom_functions#unite_menu_gen(unite_menu, empty_list)
    let l:empty_list = a:empty_list

    if empty(a:unite_menu)
        return l:empty_list
    endif

    for entry in a:unite_menu
        if type(entry) == 1
            let entry = substitute(entry, '\V<Leader>\c', '\1'.s:leaderKey, 'g')
        elseif type(entry) == 3
            let entry = custom_functions#unite_menu_gen(entry, [])
        endif

        call add(l:empty_list, entry)
    endfor

    return l:empty_list
endfunction


" ------------------------------------------------------------------------------------
" count number of lines of code (requiremenet: brew -v install cloc)
" ------------------------------------------------------------------------------------
function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

" ------------------------------------------------------------------------------------
"  function to get help on new tabs
" ------------------------------------------------------------------------------------
function! s:GetHelpOnTab()
    if &buftype == 'help'
        wincmd T
        nnoremap <buffer> q :q<cr>
    endif
endfunction
autocmd vimrc BufEnter *.txt call s:GetHelpOnTab()


" ------------------------------------------------------------------------------------
" define function for querying and getting the list of available vim plugins
" for https://vimawesome.com - courtesy @junegunn
" ------------------------------------------------------------------------------------
"Function: VimAwesomeComplete
"Desc: Provide an auto-completion for the plugin search by using the
"      keyboard shortcut c-x c-v
"
"Arguments: void
"
function! VimAwesomeComplete() abort
    let prefix = matchstr(strpart(getline('.'), 0, col('.') - 1), '[.a-zA-Z0-9_/-]*$')
    echohl WarningMsg
    echo 'Downloading plugin list from VimAwesome'
    echohl None
    ruby << EOF
    require 'json'
    require 'open-uri'

    query = VIM::evaluate('prefix').gsub('/', '%20')
    items = 1.upto(max_pages = 3).map do |page|
    Thread.new do
    url  = "https://vimawesome.com/api/plugins?page=#{page}&query=#{query}"
    data = open(url).read
    json = JSON.parse(data, symbolize_names: true)
    json[:plugins].map do |info|
    pair = info.values_at :github_owner, :github_repo_name
    next if pair.any? { |e| e.nil? || e.empty? }
    {word: pair.join('/'),
    menu: info[:category].to_s,
    info: info.values_at(:short_desc, :author).compact.join($/)}
end.compact
    end
end.each(&:join).map(&:value).inject(:+)
VIM::command("let cands = #{JSON.dump items}")
EOF
if !empty(cands)
    inoremap <buffer> <c-v> <c-n>
    augroup _VimAwesomeComplete
        autocmd!
        autocmd CursorMovedI,InsertLeave * iunmap <buffer> <c-v>
                    \| autocmd! _VimAwesomeComplete
    augroup END

    call complete(col('.') - strchars(prefix), cands)
endif
return ''
endfunction

augroup VimAwesomeComplete
    autocmd!
    autocmd FileType vim inoremap <c-x><c-v> <c-r>=VimAwesomeComplete()<cr>
augroup END

" vim:set et sw=4
