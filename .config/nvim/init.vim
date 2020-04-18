"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setup via vim-plug
"
" * Run :PlugInstall to install
" * Run :PlugUpdate to update
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! BuildYCM(info)  
  " info is a dictionary with 3 fields  
  " - name:   name of the plugin  
  " - status: 'installed', 'updated', or 'unchanged'  
  " - force:  set on PlugInstall! or PlugUpdate!  
  if a:info.status == 'installed' || a:info.force  
    !./install.py  
  endif  
endfunction  

silent! call plug#begin()
 
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/seoul256.vim'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" How many lines of history to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete

" Set to autoread when a file is changed from the outside
set autoread

" TODO: What does this do??
set nocompatible

" Remap the key for toggling command mode
inoremap jk <ESC>
               
" <leader> is our personal modifier key
let mapleader = " "                     

" # of lines shown above/below and left/right of cursor
set scrolloff=3                         
set sidescrolloff=5

set encoding=utf-8

" Read vim settings from the file itself
set modeline modelines=2

set noerrorbells
set visualbell t_vb=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display/window settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" line number gutter
set number                              

" Space for at least four digits (plus 1 for space)
if exists('+numberwidth')
    set numberwidth=5
endif

set title

" highlight full line that cursor is on
set cursorline                         

" Show matching brackets when text indicator is over them
set showmatch

" Add a bit of extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
let python_highlight_all=1
syntax on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, and indent-related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set tabstop=4 
set shiftwidth=4 
set softtabstop=4
set shiftround
set nosmarttab
set indentkeys=o,0

set nowrap
set linebreak
set showbreak=»\
set breakindent
set textwidth=0
set wrapmargin=0

set autoindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowb
set noswapfile

" Re-read a file if it changed behind vim's back.
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save/
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pandoc  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#biblio#sources = "gbcy"
let g:pandoc#biblio#bibs = ["/home/eddie/bibs/library.bib"]
let g:pandoc#filetypes#handled = ["pandoc", "markdown", "textile"]
let g:pandoc#filetypes#pandoc_markdown = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" seoul256
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colo seoul256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.vim$', '\~$', '__pycache__', '\.pyc$', '\.swp$'] 
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeSortOrder = ['^_.*', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeBookmarksSort = 0
let g:NERDTreeCascadeOpenSingleChildDir = 1

" Close bookmarks after using a bookmark
let g:NERDTreeQuitOnOpen = 2        

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='base16'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:synstastic_python_checkers = ['flake8']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"if !exists('g:ycm_semantic_triggers')
"    let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers.pandoc = ['@']
"
let g:ycm_filetype_blacklist = {}
let g:ycm_semantic_triggers = {'pandoc': ['@'], 'markdown': ['@']}
