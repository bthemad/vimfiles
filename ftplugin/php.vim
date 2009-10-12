" Map ; to "add ; to the end of the line, when missing"
noremap <buffer> ; :s/\([^;]\)$/\1;/<cr>

" Map <CTRL>-a to alignment function
vnoremap <buffer> <C-a> :call PhpAlign()<CR>

" Maybe this way in other coding standards
inoremap  { {<CR>}<C-O>O

" Let's set it for :make to work
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" inoremap <buffer> [ []<LEFT>
" inoremap <buffer> ( ()<LEFT>
" inoremap <buffer> " ""<LEFT>
" inoremap <buffer> ' ''<LEFT>

" {{{ Alignment
func! PhpAlign() range
    let l:paste = &g:paste
    let &g:paste = 0

    let l:line        = a:firstline
    let l:endline     = a:lastline
    let l:maxlength = 0
    while l:line <= l:endline
        " Skip comment lines
        if getline (l:line) =~ '^\s*\/\/.*$'
            let l:line = l:line + 1
            continue
        endif
        " \{-\} matches ungreed *
        let l:index = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\S\{0,1}=\S\{0,1\}\s.*$', '\1', "") 
        let l:indexlength = strlen (l:index)
        let l:maxlength = l:indexlength > l:maxlength ? l:indexlength : l:maxlength
        let l:line = l:line + 1
    endwhile
    
    let l:line = a:firstline
    let l:format = "%s%-" . l:maxlength . "s %s %s"
    
    while l:line <= l:endline
        if getline (l:line) =~ '^\s*\/\/.*$'
            let l:line = l:line + 1
            continue
        endif
        let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
        let l:linekey   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\1', "")
        let l:linesep   = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\2', "")
        let l:linevalue = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\3', "")

        let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep, l:linevalue)
        call setline (l:line, l:newline)
        let l:line = l:line + 1
    endwhile
    let &g:paste = l:paste
endfunc

" }}}
