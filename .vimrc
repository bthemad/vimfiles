scriptencoding utf-8
" ### Settings ###
let mapleader = ","
let maplocalleader = ","
" Pathogen load
filetype off

let pathogen_disabled=['NERD_Tree-and-ack']
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" source /Users/akudryashov/.vim/bundle/NERD_Tree-and-ack/plugin/NERD_tree_ACK.vim
let &rtp = &rtp . ',' .$HOME . '/.vim/bundle/NERD_Tree-and-ack/'

" source /Users/akudryashov/.vim/bundle/NERD_Tree-and-ack/plugin/NERD_tree_ACK.vim

" Some clear Vim settings
set nocompatible                " For more sugar
set relativenumber              " Show relative line numbers
set ttyfast                     " Like fast=true in Oracle =)
set lazyredraw                  " Don't redraw while doing macros
set noerrorbells                " Don't beep please
set visualbell                  " Show me something
set t_vb=                       " No, don't show
" set autochdir                   " Automatically change dir to the fileDir
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

" Set tabs to spaces
set tabstop=4                   " Number of spaces in tab
set softtabstop=4               " Number of spaces to indent
set shiftwidth=4                " Number of spaces to delete by backspace
set expandtab                   " Tabs as spaces
set smarttab                    " Let's see, how smart are they
set autoindent                  " Indent by text please, make it on the same level as prv one
set smartindent                 " Try to make smart indents
set list                        " Show invisible symbols

set listchars=tab:▸\ ,eol:¬     " Show invisible symbols in TextMate way

" Command line and status line
set showcmd                     " I wanna see, what I'm typing
set statusline=%<%y%f%h%m%r%{fugitive#statusline()}%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
set laststatus=2                " Previous nightmare was copy pasted. It all shows the status

" Search params
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search
set ignorecase                  " Ignore case while searching
set smartcase                   " Turn ignore case off if any capital letters are presented
set showmatch                   " Some magic on parenthesis and braces, I might disable it later
set mat=5                       " Blink on matching brackets
set gdefault                    " Global substitution by default

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
" enable persistent undo
if has("persistent_undo")
    set undofile
    set undodir=~/.vim/undofiles,/var/tmp,/tmp,.
endif


syntax on                       " Show me syntax highlighting
filetype on
filetype plugin on
filetype indent on
set colorcolumn=80

" Commands, that open folds
set foldopen=block,insert,jump,hor,mark,percent,quickfix,search,tag,undo

"" Working with filetypes

" Tune fileTypes
" Treat rss files as xml
autocmd BufNewFile,BufRead *.rss setfiletype xml
" Clear whitespaces on write to php and js files
autocmd BufWritePre *.php,*.js,*.htm*,*.py :call <SID>StripTrailingWhitespaces()
" Example of customizing tabs for exact filetype
" ruby and yaml files are indented by two
autocmd FileType ruby,rdoc,cucumber,yaml set softtabstop=2 tabstop=2 shiftwidth=2
" Gemfile, Isolate, Vagrantfile and config.ru are ruby
autocmd BufNewFile,BufRead Gemfile     setfiletype ruby
autocmd BufNewFile,BufRead Isolate     setfiletype ruby
autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
autocmd BufNewFile,BufRead config.ru   setfiletype ruby

" Enable folding
set foldenable                  " enable folding
set foldmethod=syntax           " use the syntax definitions' folding
let g:xml_syntax_folding = 1

" ## Edit .vimrc ##
map ,vv :vsp $MYVIMRC<CR>
map ,gv :vsp $MYGVIMRC<CR>
map ,vc :vsp ~/.vim/config/plugins.yml<CR>
map ,V :call ReloadRc()<CR>
map ,vh :vsp /Users/akudryashov/Documents/study/reviews/2010-02\ -\ Pragmatic\ Vim.txt<CR>

"autocmd BufWritePost .vimrc source $MYVIMRC

" ## Buffers ##
map ,bn :bnext<CR>
map ,bp :bprev<CR>
map ,bt :b#<CR>
" map ,bd :bd<CR>

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
map ,wx <C-W>x

" Let's try to move in insert mode just like in emacs
imap <C-L> <right>
imap <C-H> <left>
imap <C-J> <down>
imap <C-K> <up>

" ## Misc ##
" Toggle paste mode
set pastetoggle=,p
" Toggle wrap mode
nmap <silent> ,wr  :set wrap!<CR>
" Toggle spelling
nmap <silent> ,sp :set spell!<CR>
" Insert first dictionary occurrence
nmap <silent> ,sr 1z=
" Change directory to current file's directory
map <silent> ,cd :lcd %:h<CR>
" Strip trailing spaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
" Swap ` and ' for navigation
nnoremap ' `
nnoremap ` '

" Clear search highlight results
nnoremap <leader><space> :noh<cr>

" I want travel up and down faster
nmap <C-J> 5j
nmap <C-K> 5k

" Let's try once again with jj
inoremap jj <ESC>
cnoremap jj <C-C>

" I want to navigate wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Run current file as python script
map ,rp :!python %

inoremap <D-Enter> <C-O>o
inoremap <C-Enter> <C-O>o
inoremap <S-Enter> <C-O>o
inoremap <M-Enter> <C-O>o

"" ### Plugin configs ###

" ## TagList
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
map <silent> ,tl :TlistToggle<CR>
set tags+=`pwd`/tags

" ## NerdTree
map <silent> ,tt :NERDTreeToggle<CR>

" ## NerdCommenter
let NERDCreateDefaultMappings=0 " disable default mappings
let NERDSpaceDelims = 1
let NERDMenuMode=0              " disable menu
let NERDDefaultNesting=0        " don't recomment commented lines
map <leader>cc <plug>NERDCommenterToggle
map <leader>cu <plug>NERDCommenterUncomment
map <leader>cC <plug>NERDCommenterSexy

" ## PHP Indent
let PHP_BracesAtCodeLevel = 1
" We got our own PHPFolding stuff
let php_folding = 0

" ## PHP HighLight
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
let php_smart_members = 1
let php_highlight_quotes = 1

" ## SnipMate
let snips_author = 'Alex Kudryashov'

" ## Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_jsl_conf = $HOME . "/.dotfiles/jsl.conf"

" ## Command-T
map <silent> ,tf :CommandT<CR>
let g:CommandTMaxHeight=20

" ## Fugitive
map <silent> ,gs :Gstatus<CR>
map <silent> ,gc :Gcommit<CR>
map <silent> ,gw :Gwrite<CR>
map <silent> ,gb :Gblame<CR>

" ## SuperTab
let g:SuperTabDefaultCompletionType = "context"

" ## DelimitMate
let delimitMate_expand_cr = 1
au FileType vim let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim let b:delimitMate_quotes = "'"

" ## YankRing
nnoremap <silent> ,rr :YRShow<CR>
let g:yankring_history_file = '.yr_hist'

" ## Tabular
let mapleader=','
if exists(":Tabularize")
  map <Leader>a= :Tabularize /=>\?<CR>
  map <Leader>a: :Tabularize /:\zs<CR>
endif

" ## Conque Terminal
" let g:ConqueTerm_Color = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 0

" ## ZoomWindow
map <Leader><Leader> :ZoomWin<CR>

" Set sudo write for w!! Very useful =)
comm! -bang Wsudo    exec 'w !sudo tee % > /dev/null' | e!
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

function! ReloadRc()
    source $MYVIMRC
    source $MYGVIMRC
endfunction

"" Spelling corrections and abbreviations ""
iabbr pirnt print


""" Bundle list for update-vim-bundles """
"" Generally Useful:
" Bundle: git://github.com/scrooloose/nerdtree.git
" Bundle: git://github.com/vim-scripts/NERD_Tree-and-ack.git
" Bundle: git://github.com/mileszs/ack.vim.git
" Bundle: git://github.com/sjbach/lusty.git
" Bundle: git://github.com/bronson/vim-closebuffer.git
" Bundle: git://github.com/godlygeek/csapprox.git
" Bundle: git://github.com/vim-scripts/ZoomWin.git
" Bundle: git://github.com/vim-scripts/YankRing.vim.git
" Bundle: git://github.com/godlygeek/tabular.git
" Bundle: git://github.com/rson/vim-conque.git
" Bundle: git://github.com/vim-scripts/kwbdi.vim.git

" BUNDLE: git://git.wincent.com/command-t.git
"   If rvm is installed, make sure we compile command-t with the system ruby
"   BUNDLE-COMMAND: if which rvm >/dev/null 2>&1; then rvm system exec rake make; else rake make; fi

"" Programming:
" Bundle: git://github.com/tpope/vim-fugitive.git
" Bundle: git://github.com/tpope/vim-git.git
" Bundle: git://github.com/scrooloose/nerdcommenter.git
" Bundle: git://github.com/tpope/vim-surround.git
" Bundle: git://github.com/tpope/vim-repeat.git
" Bundle: git://github.com/vim-scripts/taglist.vim.git
" Bundle: git://github.com/ervandew/supertab.git
" Bundle: git://github.com/msanders/snipmate.vim.git
" Bundle: git://github.com/Raimondi/delimitMate.git
" Bundle: git://github.com/scrooloose/syntastic.git
" Bundle: git://github.com/vim-scripts/matchit.zip.git
" Bundle: git://github.com/pangloss/vim-simplefold.git
" Bundle: git://github.com/vim-scripts/AutoTag.git

"" Syntax files
" Bundle: git://github.com/tpope/vim-markdown.git
" Bundle: git://github.com/kchmck/vim-coffee-script.git

" JavaScript programming
" Bundle: git://github.com/vim-scripts/jQuery.git

" PHP Programming
" Bundle: git://github.com/2072/PHP-Indenting-for-VIm.git
" BUNDLE: git://github.com/shawncplus/phpcomplete.vim.git
"   BUNDLE-COMMAND: if [ ! -d "autoload" ]; then mkdir autoload; fi && cp -f phpcomplete.vim ./autoload/

" Ruby/Rails Programming:
" # Bundle: git://github.com/vim-ruby/vim-ruby.git
" # Bundle: git://github.com/tpope/vim-rails.git
" # Bundle: git://github.com/tpope/vim-rake.git
" # Bundle: git://github.com/janx/vim-rubytest.git
" # Bundle: git://github.com/tsaleh/vim-shoulda.git
" # Bundle: git://github.com/tpope/vim-cucumber.git
" # Bundle: git://github.com/tpope/vim-haml.git
" # Bundle: git://github.com/astashov/vim-ruby-debugger.git

