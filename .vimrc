set nocompatible               " Be iMproved

scriptencoding utf-8
" ### Settings ###
let mapleader = ","
let maplocalleader = ","

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


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
set diffopt+=iwhite             " Ignore whitespaces on diff
set scrolloff=3                 " Keep 3 lines when scrolling
set cursorline                  " Highlight cursor line
set mouse=a                     " Let's use a mouse, just for split moving
set cpoptions+=y                " We want the "." to repeat yanking of text
set splitright                  " Open splits on the right
set history=10000               " Save more command history

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
set statusline=%<%y%f%h%m%r\ %{fugitive#statusline()}%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
set laststatus=2                " Previous nightmare was copy pasted. It all shows the status

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
filetype plugin indent on     	" Required!
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
autocmd FileType gitcommit set tw=68 spell

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

" Edit snippets. Because you can't expand variable easy way.
let s:python_snippets = $HOME . '/.vim/bundle/snipmate-snippets/snippets/python.snippets'
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
nmap <silent> ,sr 1z=
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
map ,rp :!python %
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

" ### NerdCommenter
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDSpaceDelims = 1
let NERDMenuMode=0              " disable menu
let NERDDefaultNesting=0        " don't recomment commented lines
map <leader>cc <plug>NERDCommenterToggle
map <leader>cu <plug>NERDCommenterUncomment
map <leader>cC <plug>NERDCommenterSexy

" ### CtrlP
let g:ctrlp_map = '<leader>tf'
let g:ctrlp_open_multiple_files = '1vjvr'
let g:ctrlp_by_filename = 1
let g:ctrlp_cache_dir = $HOME . '/.vim/ctrlp_cache'
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40
set wildignore+=*.o,*.obj,.git,*.d


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
let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"
let g:SuperTabCrMapping = 0

" ### Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ### Vimux
let g:VimuxPromptString = "> "
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vr :VimuxPromptCommand<CR>

" ### pdv
let g:pdv_cfg_Author = "Alexander Kudryashov <alex.kudryashov@gmail.com>"
inoremap <Leader>pp <ESC>:call PhpDocSingle()<CR>i
nnoremap <Leader>pp :call PhpDocSingle()<CR>
vnoremap <Leader>pp :call PhpDocRange()<CR>

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

" Required for NeoBundle
NeoBundle 'Shougo/vimproc'

" My Bundles here:
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'NERD_Tree-and-ack'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'argtextobj.vim'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'ervandew/supertab'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bronson/vim-closebuffer'
NeoBundle 'git@github.com:bthemad/ZoomWin'
NeoBundle 'benmills/vimux'
NeoBundle 'mhinz/vim-signify'

" Syntax
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'rodjek/vim-puppet'

" Snipmate
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'git@github.com:bthemad/snipmate-snippets'
NeoBundle 'garbas/vim-snipmate'

" Programming
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'matchit.zip'
NeoBundle 'git@github.com:bthemad/a.vim'
NeoBundle 'alfredodeza/pytest.vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'lambacck/python_matchit'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'git@github.com:bthemad/php-doc.vim'

" C/C++/Objective-C completion with clang
" NeoBundle 'Valloric/YouCompleteMe'
" NeoBundle 'git@github.com:bthemad/c.vim.git'

" Installation check.
NeoBundleCheck
