set guioptions-=T                   " Hide toolbar
set guioptions-=R                   " Something with right toolbar
set guioptions-=L                   " Something with left toolbar
set guioptions-=c                   " Use console dialogs

if has("gui_macvim")
    set guifont=Monaco:h12          " I really love this font

    set fuoptions=maxhorz,maxvert   " Fullscreen takes up entire screen

    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

    " Command-Shift-F for Ack
    map <D-F> :Ack<space>

    " Command-e for ConqueTerm
    map <D-e> :call StartTerm()<CR>

    " Command-/ to toggle comments
    map <D-/> <plug>NERDCommenterToggle

    " Command-][ to increase/decrease indentation
    vmap <D-]> >gv
    vmap <D-[> <gv

    nmap <D-[> <<
    nmap <D-]> >>

	" Comand - }{ to brows buffers
	nmap <D-}> :bn<CR>
    nmap <D-{> :bp<CR>

    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>

    map ,md <ESC>:w!<CR>:!markdown '%' \| smartypants > /tmp/mdp.html && open /tmp/mdp.html<CR><CR>a
endif

" ConqueTerm wrapper
function! StartTerm()
  " map <silent> ,trm :ConqueTermSplit bash<CR>
  execute 'ConqueTermSplit ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction
