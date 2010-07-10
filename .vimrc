" ### Settings ###
" Pathogen load
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Some clear Vim settings
set nocompatible                " For more sugar
set number                      " Show line numbers
set ttyfast                     " Like fast=true in Oracle =)
set lazyredraw                  " Don't redraw while doing macros
set noerrorbells                " Don't beep please
set visualbell                  " Show me something
set t_vb=                       " No, don't show
" set autochdir                   " Automatically change dir to the fileDir
set backspace=indent,eol,start  " I want to delete more with backSpace
set whichwrap=l,h,<,>,[,]       " Let me travel left and right out of string
set fileencodings=utf-8,cp1251  " List of encoding to parse through
set hidden                      " Make unsaved hidden buffers possible
set nowrap                      " Don't wrap lines by default
set linebreak                   " If wrap is on, it will be word-wrap
set spellsuggest=10             " Show only 10 options for spelling check
set synmaxcol=2048              " Syntax color max line width
set wildmenu                    " Enhanced command-line completion
set fillchars=""                " Get rid of | in window separators
set diffopt+=iwhite             " Ignore whitespaces on diff

" Set tabs to spaces
set tabstop=4                   " Number of spaces in tab
set expandtab                   " Tabs as spaces
set softtabstop=4               " Number of spaces to indent
set shiftwidth=4                " Number of spaces to delete by backspace
set smarttab                    " Let's see, how smart are they
set autoindent                  " Indent by text please, make it on the same level as prv one
set smartindent                 " Try to make smart indents
set listchars=tab:▸\ ,eol:¬     " Show invisible symbols in TextMate way

" Command line and status line
set showcmd                     " I wanna see, what I'm typing
set scrolloff=3                 " Keep 3 lines when scrolling
set statusline=%<%y%f%h%m%r%{fugitive#statusline()}%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
set laststatus=2                " Previous nightmare was copypasted. It all shows the status

" Search params
set incsearch                   " Incremental search
set ignorecase                  " Ignore case while searching
set smartcase                   " Turn ignore case off if any capital letters are presented
set nohlsearch                  " Don't highlight my search results
set showmatch                   " Some magic on parenthesis and braces, I might disable it later

" Make it russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Backup and tmp folders
set backup                      " Don't keep a backup file
set backupdir=~/.vim/backup     " Set backup dir
set directory=~/.vim/tmp        " Set tmp directory
set backupskip=/tmp/*,/private/tmp/*

syntax on                       " Show me syntax highlighting
filetype on
filetype plugin on
filetype indent on

" Commands, that open folds
set foldopen=block,insert,jump,hor,mark,percent,quickfix,search,tag,undo

"" Working with filetypes
" Tune autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Tune fileTypes
" Treat rss files as xml
autocmd BufNewFile,BufRead *.rss setfiletype xml
" Clear whitespaces on write to php and js files
autocmd BufWritePre *.php,*.js,*.htm*,*.py :call <SID>StripTrailingWhitespaces()
" Example of customizing tabs for exact filetype
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ### Mappings ###
" ## Edit .vimrc ##
map ,vv :vsp $MYVIMRC<CR>
map ,vc :vsp ~/.vim/config/plugins.yml<CR>
map ,V :source $MYVIMRC<CR>

" ## Buffers ##
map ,bn :bnext<CR>
map ,bp :bprev<CR>
map ,bt :b#<CR>
map ,bd :bd<CR>

" ## Windows ##
map ,wl <C-W>l
map ,wh <C-W>h
map ,wj <C-W>j
map ,wk <C-W>k

map ,wL <C-W>L
map ,wH <C-W>H
map ,wJ <C-W>J
map ,wK <C-W>K

map ,ws <C-W>s
map ,wo <C-W>o
map ,wv <C-W>v
map ,wc <C-W>c
map ,wp <C-W>p

" Indentation like in TextMate (works only under MacVim)
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" ## Misc ##
" Toggle paste mode
set pastetoggle=,p
" Toggle wrap mode
nmap <silent> ,wr  :set wrap!<CR>
" Toggle spelling
nmap <silent> ,sp :set spell!<CR>
" Change directory to current file's directory
map <silent> ,cd :lcd %:h<CR>
" Strip trailing spaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" Swap ` and ' for navigation
nnoremap ' `
nnoremap ` '
" A bit more convinient way to start and end of line
map H ^
map L $

" I want travel up and down faster
nmap <C-J> 5j
nmap <C-K> 5k


" ### Plugins ###
" ## Taglist
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
map <silent> ,tl :TlistToggle<CR>
set tags+=`pwd`/tags

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

" ## SnipMate
let snips_author = 'Alex Kudryashov'

" ## BufExplorer
" CTRL+b opens the buffer list
"map <C-b> <esc>:BufExplorer<cr>
map <silent> ,tb :BufExplorer<CR>
map <silent> ,be :BufExplorer<CR>

" ## MarksBrowser
map <silent> ,tm :MarksBrowser<CR>
map <silent> ,me :MarksBrowser<CR>

" ## Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ## Command-T
map <silent> ,tf :CommandT<CR>

" ## Fugitive
map <silent> ,gs :Gstatus<CR>
map <silent> ,gc :Gcommit<CR>
map <silent> ,gw :Gwrite<CR>
map <silent> ,gb :Gblame<CR>

" ## Conque
map <silent> ,trm :ConqueTermSplit bash<CR>

" ## FuzzyFinder
nnoremap <silent> ,ff :FufFile<CR>
nnoremap <silent> ,fb :FufBuffer<CR>
nnoremap <silent> ,fd :FufDir<CR>
nnoremap <silent> ,ft :FufTag<CR>

" ## SuperTab
let g:SuperTabDefaultCompletionType = "context"


" Set sudo write for w!! Very useful =)
command! Wsudo set buftype=nowrite | silent execute ':%w !sudo tee %' | set buftype= | e! %
command! ST !icalBuddy uncompletedTasks

" Color scheme
set t_Co=256
colorscheme railscasts

" Set an orange cursor in insert mode, and a red cursor otherwise.
" Works at least for xterm and rxvt terminals.
" Does not work for gnome terminal, konsole, xfce4-terminal.
if &term =~ "xterm\\|rxvt"
    :silent !echo -ne "\033]12;red\007"
    let &t_SI = "\033]12;orange\007"
    let &t_EI = "\033]12;red\007"
    autocmd VimLeave * :!echo -ne "\033]12;red\007"
endif

"" Help Functions ""
" Strip trailing spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Preserve state of cursor after executing a command
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
