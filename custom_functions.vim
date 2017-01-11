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