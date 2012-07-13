runtime bundle/vim-pathogen/autoload/pathogen.vim
" Bundle: tpope/vim-pathogen

scriptencoding utf-8
" ### Settings ###
let mapleader = ","
let maplocalleader = ","
" Pathogen load

filetype off
let pathogen_disabled=['NERD_Tree-and-ack']
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" Manually add NerdTree Ack, cause it has to be loaded after NerdTree
let &rtp = &rtp . ',' .$HOME . '/.vim/bundle/NERD_Tree-and-ack/'    

 "Some clear Vim settings
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
set cpoptions+=y                " We want the "." to repeat yanking of text

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


syntax on                       " Show me syntax highlighting
filetype on
filetype plugin on
filetype indent on
set colorcolumn=80

augroup filetypedetect
au BufNewFile,BufRead *.xt  setf xt
augroup END


" Commands, that open folds
set foldopen=block,insert,jump,hor,mark,percent,quickfix,search,tag,undo

"" Working with filetypes

" Tune fileTypes
" Treat rss files as xml
autocmd BufNewFile,BufRead *.rss setfiletype xml
" ruby and yaml files are indented by two
autocmd FileType ruby,rdoc,cucumber,yaml set softtabstop=2 tabstop=2 shiftwidth=2
autocmd FileType cpp set softtabstop=2 tabstop=2 shiftwidth=2

" Gemfile, Isolate, Vagrantfile and config.ru are ruby
autocmd BufNewFile,BufRead Gemfile     setfiletype ruby
autocmd BufNewFile,BufRead Isolate     setfiletype ruby
autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
autocmd BufNewFile,BufRead config.ru   setfiletype ruby

au FileType gitcommit set tw=68 spell

" Enable folding
set foldenable                  " enable folding
set foldmethod=syntax           " use the syntax definitions' folding
set foldlevel=99                " no folds by default
let g:xml_syntax_folding = 1

" Enable Home/End in command line
cnoremap <c-e> <end>
imap     <c-e> <c-o>$
cnoremap <c-a> <home>
imap     <c-a> <c-o>^

" ## Edit .vimrc ##
map ,vv :vsp $MYVIMRC<CR>
map ,gv :vsp $MYGVIMRC<CR>
map ,V :call ReloadRc()<CR>
map ,vh :vsp /Users/akudryashov/Documents/study/reviews/2010-02\ -\ Pragmatic\ Vim.txt<CR>

"autocmd BufWritePost .vimrc source $MYVIMRC

" ## Buffers ##
map ,bn :bnext<CR>
map ,bp :bprev<CR>
map ,bt :b#<CR>
map ,bd :bd<CR>
map ,fd <Plug>CloseBuffer

" ## Windows ##
map ,wl <C-W>l
map ,wh <C-W>h
map ,wj <C-W>j
map ,wk <C-W>k

map ,wL <C-W>L
map ,wH <C-W>H
map ,wJ <C-W>J
map ,wK <C-W>K

map ,ws :rightbelow new<CR>
map ,wo <C-W>o
map ,wv :rightbelow vnew<CR>
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
nmap <silent> ,wr  :set wrap! list!<CR>
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

"" ### Plugin configs ###
" ## TagList
let Tlist_Close_On_Select = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let tlist_php_settings='php;c:class;f:function'
map <silent> ,tl :TlistToggle<CR>
set tags=tags;./tags;

" ## NerdTree
map <silent> ,tt :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 1

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

" ## PHP HighLight
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1
let php_smart_members = 1
let php_highlight_quotes = 1

" ## Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checker = "jsl"
let g:syntastic_jsl_conf = $HOME . "/.dotfiles/jsl.conf"
let g:syntastic_python_checker = 'pyflakes'

" ## Command-T
map <silent> ,tf :CommandT<CR>
let g:CommandTMaxHeight=20

" ## Fugitive
map <silent> ,gs :Gstatus<CR>
map <silent> ,gc :Gcommit<CR>
map <silent> ,gw :Gwrite<CR>
map <silent> ,gb :Gblame<CR>
map <silent> ,gl :Glog<CR>
map <silent> ,ge :Gedit<CR>
" Delete buffer after leaving it when browsing through git history
autocmd BufReadPost fugitive://* set bufhidden=delete

" ## VCSCommand
let VCSCommandDisableMappings = 1
let VCSCommandDisableMenu = 1
map <silent> ,vca :VCSAdd<CR>
map <silent> ,vcn :VCSAnnotate<CR>
map <silent> ,vcc :VCSCommit<CR>
map <silent> ,vcd :VCSVimDiff<CR>
map <silent> ,vcg :VCSGotoOriginal!<CR>
map <silent> ,vcs :VCSStatus<CR>
map <silent> ,vcl :VCSLog -l10<CR>
map ,vcL :VCSLog 
map <silent> ,vci :VCSInfo<CR>

" ## DelimitMate
let delimitMate_expand_cr = 1
au FileType vim let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim let b:delimitMate_quotes = "'"
au FileType php let b:delimitMate_matchpairs = "(:),[:],{:}"

" ## YankRing
nnoremap <silent> ,rr :YRShow<CR>
let g:yankring_history_file = '.yr_hist'
let g:yankring_default_menu_mode = 0

" ## Tabular
map ,a= :Tabularize /=>\?<CR>
map ,a: :Tabularize /:\zs<CR>

" ## ZoomWindow
map zz :ZoomWin<CR>
map ,, :ZoomWin<CR>

" ## MiniBufExpl
let g:miniBufExplMapCTabSwitchBufs = 1

" ## GUndo
nnoremap ,gu :GundoToggle<CR>

" ## PHPDoc
inoremap ,pd <ESC>:call PhpDocSingle()<CR>i 
nnoremap ,pd :call PhpDocSingle()<CR> 
vnoremap ,pd :call PhpDocRange()<CR> 
let g:pdv_cfg_Author = "kevin olson <acidjazz@gmail.com>"
let g:pdv_cfg_php4always = 0

" ## CamelCaseMotion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" Set sudo write for w!! Very useful =)
comm! -bang Wsudo    exec 'w !sudo tee % > /dev/null' | e!
command! ST !icalBuddy uncompletedTasks

" Color scheme
set t_Co=256
colorscheme railscasts
" let g:solarized_termcolors=256
" set background=dark
" colorscheme solarized

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
function! StripTrailingWhitespaces()
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
map <silent> <Leader>sw <ESC>:call StripTrailingWhitespaces()<CR><CR>

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

function! GenerateTags()
    let l:dname = getcwd()
    let l:fname = l:dname . "/tags.sh"
    if filereadable(l:fname)
        :silent execute "! " . l:fname . " &"
        if exists(":TlistUpdate")
            TlistUpdate
        endif
    endif
endfunction
map <silent> <Leader>gt <ESC>:call GenerateTags()<CR><CR>

function! UpdateTuentiTags()
    :silent execute "! /Users/alexander/src/tuenti/current/tags.sh &"
endfunction

function! RsyncCurrentFile()
    !/Users/alexander/bin/rsync_tuenti_current.py  %:p
    call UpdateTuentiTags()
endfunction

function! RsyncAllFiles()
    !/Users/alexander/bin/rsync_tuenti_current.py
    call UpdateTuentiTags()
endfunction

let s:is_tuenti = 0
function! CheckTuenti()
    let l:fname = $HOME . "/src/tuenti/current/rsyncExclude.txt"
    if filereadable(l:fname)
        " echo "seems like tuenti"
        let s:is_tuenti = 1
    endif
endfunction

call CheckTuenti()
if s:is_tuenti == 1
    " echo "Definetely Tuenti"
    if !exists("tuenti_autocommands_loaded")
        let tuenti_autocommands_loaded = 1
        autocmd FileType php,javascript,html set noexpandtab
        " autocmd BufWritePost * !/Users/alexander/bin/rsync_tuenti_current.py %:p
    endif
    map <Leader>qq <ESC>:call RsyncCurrentFile()<CR><CR>
    map <Leader>qf <ESC>:call RsyncAllFiles()<CR><CR>
    map <Leader>trt <ESC>:NERDTree tt<CR>q
    map <Leader>trr <ESC>:NERDTree tr<CR>q
    set path=main;,tests;,./;
    let snips_author = 'Alexander Kudryashov <alexander@tuenti.com>'
    let g:pdv_cfg_Author = 'Alexander Kudryashov <alexander@tuenti.com>'
else
    " echo "Not Tuenti"
    if !exists("g:non_tuenti_autocommands_loaded")
        let g:non_tuenti_autocommands_loaded = 1
        " Clear whitespaces on write to php and js files
        autocmd BufWritePre *.php,*.js,*.htm*,*.py :call <SID>StripTrailingWhitespaces()
    endif
    let snips_author = 'Alex Kudryashov <alex.kudryashov@gmail.com>'
    let g:pdv_cfg_Author = 'Alex Kudryashov <alex.kudryashov@gmail.com>'
endif


" Analyze the code
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufRead *.inc,*.php set makeprg=/usr/local/bin/zca\ %
    autocmd BufRead *.inc,*.php set errorformat=%f(line\ %l):\ %m
    autocmd BufWritePre :silent lmake<cr>:lwindow <cr>:redraw!<cr>
endif

map ,pb :silent lmake<cr>:lwindow <cr>:redraw!<cr>


"" Spelling corrections and abbreviations ""
iabbr pirnt print


""" Bundle list for update-vim-bundles """
"" Generally Useful:
" Bundle: scrooloose/nerdtree
" Bundle: NERD_Tree-and-ack
" Bundle: mileszs/ack.vim
" Bundle: bronson/vim-closebuffer
" Bundle: minibufexpl.vim
" Bundle: godlygeek/csapprox
" Bundle: ZoomWin
" Bundle: YankRing.vim
" Bundle: godlygeek/tabular
" Bundle: sjl/gundo.vim
" Bundle: tpope/vim-unimpaired
" Bundle: bkad/CamelCaseMotion
" Bundle: argtextobj.vim
" Bundle: michaeljsmith/vim-indent-object

" BUNDLE: git://github.com/bthemad/Command-T.git
"   If rvm is installed, make sure we compile command-t with the system ruby
"   BUNDLE-COMMAND: cd ~/.vim/bundle/Command-T && rake make

"" Programming:
" Bundle: tpope/vim-fugitive
" Bundle: tpope/vim-git
" Bundle: tpope/vim-surround
" Bundle: tpope/vim-repeat
" Bundle: scrooloose/nerdcommenter
" Bundle: taglist.vim
" Bundle: bthemad/snipmate.vim
" Bundle: Raimondi/delimitMate
" Bundle: scrooloose/syntastic
" Bundle: matchit.zip

"" Syntax files
" Bundle: tpope/vim-markdown

" JavaScript programming
" Bundle: jQuery
" Bundle: kchmck/vim-coffee-script

" Color schemes
" Bundle: altercation/vim-colors-solarized
" # Bundle: tpope/vim-vividchalk

" PHP Programming
" BUNDLE: shawncplus/phpcomplete.vim
" # BUNDLE-COMMAND: if [ ! -d "autoload" ]; then mkdir autoload; fi && cp -f phpcomplete.vim ./autoload/
" Bundle: bthemad/php-doc.vim

" C/C++ Programming
" Bundle: a.vim

" Ruby/Rails Programming:
" # Bundle: vim-ruby/vim-ruby
" # Bundle: tpope/vim-rails
" # Bundle: tpope/vim-rake
" # Bundle: janx/vim-rubytest
" # Bundle: tsaleh/vim-shoulda
" # Bundle: tpope/vim-cucumber
" # Bundle: tpope/vim-haml
" # Bundle: astashov/vim-ruby-debugger
" # Bundle: rson/vim-conque
" # Bundle: pangloss/vim-simplefold

