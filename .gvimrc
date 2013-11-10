set guioptions-=T                   " Hide toolbar
set guioptions-=R                   " Something with right toolbar
set guioptions-=L                   " Something with left toolbar
set guioptions-=c                   " Use console dialogs

if has("gui_macvim")
    set guifont=Monaco:h12

    set fuoptions=maxhorz,maxvert   " Fullscreen takes up entire screen

    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

    " Command-Shift-F for Ack
    map <D-F> :Ack<space>

    " Command-/ to toggle comments
    map <D-/> <plug>NERDCommenterToggle

    " Command-][ to increase/decrease indentation
    vmap <D-]> >gv
    vmap <D-[> <gv

    nmap <D-[> <<
    nmap <D-]> >>


    map ,md <ESC>:w!<CR>:!markdown '%' \| smartypants > /tmp/mdp.html && open /tmp/mdp.html<CR><CR>a

    set guicursor+=a:blinkon0

    " Pluggin remaps
    macmenu &File.Print key=<nop>
    map <D-p> :CtrlP<CR>
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :NERDTreeToggle<CR>
    macmenu &Tools.Make key=<nop>
    map <D-b> :CtrlPBuffer<CR>

endif

