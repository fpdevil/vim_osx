" ####################################################################################
" ################        Custom functions required for vim         ##################
" ####################################################################################

" define a function for customizing the vim-startify based on the working directory
function StartifyConfig()
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
" --- define function for switching between the source and header files using the  ---
" --- ctags. this only supports .cpp and .h files                                  ---
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

" define a function for highlighting the duplicate lines
" shamelessly copied from StackOverflow at the below link
" http://stackoverflow.com/questions/1268032/marking-duplicate-lines
"
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
" --- define function for getting the Plug lists for vimawesome.com                ---
" --- courtesy: junegunn                                                           ---
" ------------------------------------------------------------------------------------
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
      url  = "http://vimawesome.com/api/plugins?page=#{page}&query=#{query}"
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


" ------------------------------------------------------------------------------------
" ---  get the username in the form of space delimited first name and last name    ---
" ------------------------------------------------------------------------------------
if has('mac')
    let s:usrname = split(system("finger `whoami`|awk -F: '{print $3}'|head -n1|sed 's/^ //'"), '\n')[0]
elseif has('unix')
    let s:usrname = split(system('whoami | head -n1'), '\n')[0]
endif

" define the line width as under 80
let s:width = 77

" ------------------------------------------------------------------------------------
" --- define function for inserting header information in erlang code file        ---
" ------------------------------------------------------------------------------------
function! s:ErlHeader()
    let s:comment = "%%%"
    let s:line = "%%%" . repeat('-', s:width)
    let s:filename = bufname("%")
    let s:todo = "TODO <explanation>"
    if s:usrname != ''
        let s:author = s:comment . " @author " . s:usrname . " <>"
        let s:cpr = s:comment . " @copyright (C) " . strftime('%Y') . ", " . s:usrname
        let s:doc = s:comment . " @doc"
        let s:end = s:comment . " @end"
        let s:created = s:comment . " Created : " . strftime('%d %b %Y') . " by " . s:usrname . " <>"
        call append(0, s:line)
        call append(1, s:author)
        call append(2, s:cpr)
        call append(3, s:doc)
        call append(4, s:comment)
        call append(5, s:end)
        call append(6, s:created)
        call append(7, s:line)
    endif
    unlet s:comment
    unlet s:line
    unlet s:filename
    unlet s:todo
    unlet s:author
    unlet s:cpr
    unlet s:doc
    unlet s:end
    unlet s:created
endfunction

augroup ErlHeader
    autocmd BufNewFile *.erl call s:ErlHeader()
augroup END

" ------------------------------------------------------------------------------------
" --- define function for finding an appropriate .jshintrc file for javascript     ---
" ------------------------------------------------------------------------------------
function s:locate_jshintrc(dir)
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

function UpdJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:locate_jshintrc(l:dir)
    " deprecated option
    " let g:syntastic_javascript_jshint_conf = l:jshintrc
    let g:syntastic_javascript_jshint_args = l:jshintrc
endfunction

au BufEnter * call UpdJsHintConf()
