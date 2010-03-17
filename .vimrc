" ### Settings ###
" Some clear vim settings
set nocompatible                " For more sugar
set number                      " Show line numbers
set ttyfast                     " Like fast=true in Oracle =)
set lazyredraw                  " Don't redraw while doing macros
set noerrorbells                " Don't beep please
set visualbell                  " Show me something
set t_vb=                       " No, don't show
set autochdir                   " Automatically change dir to the fileDir
set backspace=indent,eol,start  " I want to delete more with backSpace
set whichwrap=l,h,<,>,[,]       " Let me travel left and right out of string
set fileencodings=utf-8,cp1251  " List of encoding to parse through
set hidden                      " Make hidden buffers possible
set nowrap                      " Don't wrap lines by default
set spellsuggest=10             " Show only 10 options for spelling check

" Set tabs to spaces
set tabstop=4                   " Number of spaces in tab yes
set shiftwidth=4                " Number of spaces to indent
set expandtab                   " Tabs as spaces
set smarttab                    " Let's see, how smart are they
set autoindent                  " Indent by text please, make it on the same level as prv one
set smartindent                 " Try to make smart indents

" Command line and status line
set showcmd                     " I wanna see, what I'm typing
set scrolloff=3                 " Keep 3 lines when scrolling
set statusline=%<%y%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
set laststatus=2                " Previous nightmare was copypasted. It all shows the status

" Searhc params
set incsearch                   " Incremental search
set ignorecase                  " Ignore case while searching
set nohlsearch                  " Don't highlight my search results
set showmatch                   " Some magic on parenthesis and braces, I might disable it later

" Backup and tmp folders
set backup                      " Don't keep a backup file
set backupdir=~/.vim/backup     " Set backup dir
set directory=~/.vim/tmp        " Set tmp directory

syntax on                       " Show me syntax highlighting
filetype on
filetype plugin on
filetype indent on

" Autocomplition options
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" ### Mappings ###
" I want travel up and down faster
nmap <C-J> 5j
nmap <C-K> 5k
map tl :tabnext<CR>
map th :tabprev<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>

" ### Plugins ###
" ## Taglist
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Ctags_Cmd = '/home/pepyaka/.vim/bin/mctags'
map <silent> ,tl :TlistToggle<CR>

" ## NerdTree
map <silent> ,tt :NERDTreeToggle<CR>

" ## PHP Indent
let PHP_BracesAtCodeLevel = 1

" ## PHP HighLight
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
let php_smart_members = 1
let php_highlight_quotes = 1

" ## PHPDoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" ## SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" ## BufExplorer
" CTRL+b opens the buffer list
"map <C-b> <esc>:BufExplorer<cr>
map <silent> ,tb :BufExplorer<CR>
map gz :bdelete<cr>
map gb :bnext<cr>
map gB :bprev<cr>

" ## MarksBrowser
map <silent> ,tm :MarksBrowser<CR>

" ## Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Let's read some pdf, doc and odt documents
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"

" Set sudo write for w!! Very useful =)
command Wsudo set buftype=nowrite | silent execute ':%w !sudo tee %' | set buftype= | e! %

" Color scheme
set t_Co=256
colorscheme railscasts2 
