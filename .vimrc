scriptencoding utf-8

" ### Settings ###
let mapleader = ","
let maplocalleader = ","

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('bling/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('maxbrunsfeld/vim-yankstack')
  call dein#add('mileszs/ack.vim')
  call dein#add('godlygeek/csapprox')
  call dein#add('sjl/gundo.vim')
  call dein#add('bkad/CamelCaseMotion')
  call dein#add('vim-scripts/argtextobj.vim')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('ervandew/supertab')
  call dein#add('kien/ctrlp.vim')
  call dein#add('bronson/vim-closebuffer')
  call dein#add('git@github.com:bthemad/ZoomWin')

  " Syntax
  call dein#add('chase/vim-ansible-yaml')

  " Snipmate
  call dein#add('MarcWeber/vim-addon-mw-utils')
  call dein#add('tomtom/tlib_vim')
  call dein#add('git@github.com:bthemad/snipmate-snippets')
  call dein#add('garbas/vim-snipmate')

  " Programming general
  call dein#add('mhinz/vim-signify')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('majutsushi/tagbar')
  call dein#add('Raimondi/delimitMate')
  call dein#add('scrooloose/syntastic')
  call dein#add('vim-scripts/matchit.zip')
  " call dein#add('tpope/vim-fugitive'

  " Python
  " call dein#add('alfredodeza/pytest.vim')
  " call dein#add('hynek/vim-python-pep8-indent')
  " call dein#add('lambacck/python_matchit')
  " call dein#add('davidhalter/jedi-vim')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Some clear Vim settings
set nocompatible                " For more sugar
set relativenumber              " Show relative line numbers
set ttyfast                     " Like fast=true in Oracle =)
set lazyredraw                  " Don't redraw while doing macros
set noerrorbells                " Don't beep please
set visualbell                  " Show me something
set t_vb=                       " No, don't show
set backspace=indent,eol,start  " I want to delete more with backSpace
set whichwrap=l,h,<,>,[,]       " Let me travel left and right out of string
set encoding=utf-8              " Force encoding to utf-8
set fileencodings=utf-8,cp1251  " List of encoding to parse through
set hidden                      " Make unsaved hidden buffers possible
set nowrap                      " Don't wrap lines by default
set linebreak                   " If wrap is on, it will be word-wrap
set spellsuggest=10             " Show only 10 options for spelling check
set synmaxcol=2048              " Syntax color max line width
set wildmenu                    " Enhanced command-line completion
set fillchars=""                " Get rid of | in window separators
set scrolloff=3                 " Keep 3 lines when scrolling
set cursorline                  " Highlight cursor line
set mouse=a                     " Let's use a mouse, just for split moving
set cpoptions+=y                " We want the "." to repeat yanking of text
set splitright                  " Open splits on the right
set history=10000               " Save more command history
" set clipboard=unnamed           " Copy/pasted with system buffer by default

" Set tabs to spaces
set tabstop=4                   " Number of spaces in tab
set softtabstop=4               " Number of spaces to indent
set shiftwidth=4                " Number of spaces to delete by backspace
set expandtab                   " Tabs as spaces
set smarttab                    " Let's see, how smart are they
set autoindent                  " Indent by text please, make it on the same level as prv one
" set smartindent                 " Try to make smart indents
set list                        " Show invisible symbols

set listchars=tab:▸\ ,eol:¬     " Show invisible symbols in TextMate way
set tags=tags;

" Command line and status line
set showcmd                     " I wanna see, what I'm typing
set laststatus=2                " Show statusline all the time

" Search params
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search
set ignorecase                  " Ignore case while searching
set smartcase                   " Turn ignore case off if any capital letters are presented
set showmatch                   " Some magic on parenthesis and braces, I might disable it later
set mat=5                       " Blink on matching brackets
set gdefault                    " Global substitution by default

set noshowmode                  " With AirLine I don't need it

" Backup and tmp folders
set noswapfile                  " For watchdog to work
set backup                      " Don't keep a backup file
set backupdir=~/.vim/backup     " Set backup dir
set directory=~/.vim/tmp        " Set tmp directory
set backupskip=/tmp/*,/private/tmp/*
" enable persistent undo
if has("persistent_undo")
    set undofile
    set undodir=~/.vim/undofiles,/var/tmp,/tmp,.
endif

" Color scheme
" set t_Co=256
" solarized options
" set background=dark
" let g:solarized_termcolors = 256
" let g:solarized_termtrans = 1
" colorscheme solarized
colorscheme railscasts

" ## Syntax and Filetypes
syntax on                       " Show me syntax highlighting
filetype plugin indent on       " Required!
set colorcolumn=80

" Enable folding
set foldenable                  " enable folding
set foldmethod=syntax           " use the syntax definitions' folding
set foldlevel=99                " no folds by default
let g:xml_syntax_folding = 1
" Commands, that open folds
set foldopen=block,insert,jump,hor,mark,percent,quickfix,search,tag,undo

" ruby and yaml files are indented by two
autocmd FileType ruby,rdoc,cucumber,yaml set softtabstop=2 tabstop=2 shiftwidth=2
autocmd FileType scala set softtabstop=2 tabstop=2 shiftwidth=2
autocmd FileType gitcommit set tw=72 spell

" ## Hotkeys
" Enable Home/End in command line
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-d> <delete>

imap     <c-e> <c-o>$
imap     <c-a> <c-o>^

" Edit .vimrc
map ,vv :vsp $MYVIMRC<CR>
map ,gv :vsp $MYGVIMRC<CR>
map ,V :call ReloadRc()<CR>

" Use the new parser
let g:snipMate = { 'snippet_version' : 1 }
" Edit snippets. Because you can't expand variable easy way.
let s:python_snippets = $HOME . '~/.vim/dein/repos/github.com/bthemad/snipmate-snippets/snippets/python.snippets'
execute "map ,vp :vsp " . s:python_snippets . "<CR>"
let snips_author = 'Alex Kudryashov <alex.kudryashov@gmail.com>'

" Buffers
map ,bn :bnext<CR>
map ,bp :bprev<CR>
map ,bt :b#<CR>
map ,bd :bd<CR>
map ,fd <Plug>CloseBuffer
nmap \\ :b #<CR>
nmap \1 :b 1<CR>
nmap \2 :b 2<CR>
nmap \3 :b 3<CR>
nmap \4 :b 4<CR>
nmap \5 :b 5<CR>
nmap \6 :b 6<CR>
nmap \7 :b 7<CR>
nmap \8 :b 8<CR>
nmap \9 :b 9<CR>
nmap \0 :b 10<CR>

" Windows
map ,wl <C-W>l
map ,wh <C-W>h
map ,wj <C-W>j
map ,wk <C-W>k

map ,wL <C-W>L
map ,wH <C-W>H
map ,wJ <C-W>J
map ,wK <C-W>K

map ,ws :split<CR>
map ,wo <C-W>o
map ,wv :vsplit<CR>
map ,wc <C-W>c
map ,wp <C-W>p
map ,wx <C-W>x
map ,wn <C-W>n

" Let's try to move in insert mode just like in emacs
imap <C-F> <right>
imap <C-B> <left>
imap <C-J> <down>
imap <C-K> <up>

" Settings toggles
nmap \p :set paste!<CR>
nmap \n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
nmap \w :set wrap! list!<CR>
nmap \s :set spell!<CR>

" Insert first dictionary occurrence
nmap <silent> ,sp 1z=
" Change directory to current file's directory
map <silent> ,cd :lcd %:h<CR>
" Strip trailing spaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" Swap ` and ' for navigation
nnoremap ' `
nnoremap ` '

" When searching with * just highlight the current word first
nnoremap * *N

" Clear search highlight results
nnoremap <leader><space> :noh<cr>

" I want travel up and down faster
nmap <C-J> 5j
nmap <C-K> 5k

" I want to navigate wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Run current file as python script
map ,rp :!clear;python %<CR>
let python_highlight_all = 1

inoremap <D-Enter> <C-O>o
inoremap <C-Enter> <C-O>o
inoremap <S-Enter> <C-O>o
inoremap <M-Enter> <C-O>o

" Autoclose omnicompletion window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" ## Plugin configs
" ### Tagbar
map <silent> ,tl :TagbarOpen fjc<CR>
map <silent> ,tc :TagbarCurrentTag<CR>
let g:tagbar_width = 50
let g:tagbar_compact = 1

" ### NerdTree
map <silent> ,tt :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 1
let g:NERDTreeIgnore = ['\.pyc$']

" ### NerdCommenter
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDSpaceDelims = 1
let NERDMenuMode=0              " disable menu
let NERDDefaultNesting=0        " don't recomment commented lines
map <leader>cc <plug>NERDCommenterToggle
map <leader>cu <plug>NERDCommenterUncomment
map <leader>cC <plug>NERDCommenterSexy

" ### CtrlP
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_open_multiple_files = '1vjvr'
let g:ctrlp_by_filename = 1
let g:ctrlp_cache_dir = $HOME . '/.vim/ctrlp_cache'
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40
let g:ctrlp_working_path_mode = 0
set wildignore+=*.o,*.obj,.git,*.d,*.pyc


" ### Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ["jsl"]
let g:syntastic_jsl_conf = $HOME . "/.dotfiles/jsl.conf"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['java'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ### DelimitMate
let delimitMate_expand_cr = 1
au FileType vim let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim let b:delimitMate_quotes = "'"
au FileType php let b:delimitMate_matchpairs = "(:),[:],{:}"

" ### ZoomWindow
map z; :ZoomWin<CR>

" ### GUndo
nnoremap ,gu :GundoToggle<CR>

" ### CamelCaseMotion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" ### Yankstack
let g:yankstack_map_keys = 0
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap <C-N> <Plug>yankstack_substitute_newer_paste

" ### Jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0

let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>pr"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#goto_definitions_command = "<leader>pf"
let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#documentation_command = "<leader>pd"
" Don't show me the doc window
autocmd FileType python setlocal completeopt-=preview

" ### SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCrMapping = 0

" ### Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" # Help Functions
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

" Reload vim config files
function! ReloadRc()
    source $MYVIMRC
    source $MYGVIMRC
endfunction
