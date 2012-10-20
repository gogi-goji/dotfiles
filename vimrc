" =============
" === vimrc ===
" =============

" Basic compatability stuff
" =========================

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionality, add 'runtime!
" vimrc_example.vim' Or better yet, read
" /usr/share/vim/vim72/vimrc_example.vim or the vim manual and configure vim
" to your own liking!

" Custom Keybindings
" ==================

" Paste mode toggle <F2>
" With auto indenting, Vim can seriously mess up copy/pasted code.  This turns
" <F2> into a paste mode toggle, turning off/on auto indentation.  The last
" line adds an indication that you're in paste mode.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Gundo - Visualize Vim undo tree
" Note: requires Gundo plugin (handled by Vundle, see below)
nnoremap <F5> :GundoToggle<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Start scrolling before the cursor hits the bottom/top of the page
set scrolloff=4

" Better way to move between windows (C-direction)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Spell checking
" When in insert mode, press C-l to see a menu for spell check fixes for the
" nearest misspelled word to the left of the cursor, then press C-i to go back
" to your last insert point.  
" Code is in spell checking section, just described here for reference. 

" Relative line numbers
"
" <C-n> to toggle relative vs absolute line numbers
"
" I'm using the plugin vim-numbertoggle for this functionality.  For more
" information see:
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

" NerdCommenter
" 
" [count]<leader>c<space> to toggle comments on and off.
" <leader>c$ Comments the current line from the cursor to the EOL
" <leader>cA Insert a comment and go into insert mode at the end of the line
"
" There's a bunch of other useful commands this plugin comes with, but that's
" the one I use the most.  For more information, see:
" https://github.com/scrooloose/nerdcommenter
" http://www.vim.org/scripts/script.php?script_id=1218


" Plugins
" =======

" Vundle
" https://github.com/gmarik/vundle
" Vundle takes care of all your plugin management for you so you don't need to
" mess around with all of that yourself.  See the Github repo for more
" specific information.  The following stuff is all Vundle configuration
" stuff.
set nocompatible               " be iMproved, don't worry about Vi compatibility 
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'Townk/vim-autoclose'
"Bundle 'vim-scripts/Obvious-Mode' 
Bundle 'scrooloose/nerdcommenter'
Bundle 'git://github.com/sjl/gundo.vim.git'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" Themes:
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" Miscellaneous usability stuff
" =============================

" Detect filetype
" filetype plugin on 
" Set at the end of Vundle section

" Show line numbers
set number

" Traverse line breaks with arrow keys
set whichwrap=b,s,<,>,[,]

" When searching, wrap around the beginning/end of the file
set wrapscan

" When searching, ignore case, but try to be smart about it
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Incremental search, so you start searching by each character you type rather
" than by strings
set incsearch

" Always show current position
set ruler

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Remember the cursor position in files
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Persistent undo (new in Vim 7.3, and makes Gundo much more useful)
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories  Note: Make sure this directory exists!
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Themes and colours
" ==================

" Solarized
" http://ethanschoonover.com/solarized/vim-colors-solarized
syntax enable
set background=dark
"set background=light
colorscheme solarized

" Note: If running out of a terminal, it's probably a good idea to use the
" Solarized Xdefaults/Xresources colours to make sure there's nothing stupid
" going on.  
" Grab the Xresources colours here:
" https://github.com/altercation/solarized/blob/master/xresources-colors-solarized/Xresources


" Word Wrapping 
" =============

" For information about formatting options, see :help fo-table

" Automatically hard wrap everything as you type and as you edit so you don't
" have to constantly gq 
"set formatoptions+=a

" Automatically wrap text, allowing formatting with "gq", automatically insert
" the comment leader after hitting <Enter> in Insert mode, recognize numbered
" lists, and don't break a line after a one-letter word.  
set formatoptions=qrn1

" Turn hard wrapped text into soft wrapped.
" This command will join all lines within a range that are not separated
" by empty lines. Automatic word wrap must be off (set fo-=a).
" Useful if you need to copy and paste into a word processor.
"command! -range=% SoftWrap
"            \ <line2>put _ |
"            \ <line1>,<line2>g/.\+/ .;-/^$/ join |normal $x


" Spell checking
" ==============

" Note: requires vim-spell-en to be installed

" Turn spell check on
set spell

" Set language.  Note: This uses Canadian spellings, so words like color will
" be highlighted as regional variations rather than outright misspellings.
set spelllang=en_ca,en

" Taken from [Terminally Incoherent](http://www.terminally-incoherent.com/blog/2012/10/01/vim-the-hidden-power-of-customization/)
" The key combo [s takes you to the nearest misspelled word to the left of the
" cursor, and then z= gives you a list of words to choose from.  This rebinds
" C-l to do that when you're in insert mode, then C-i to go back to the last
" insert point.  
inoremap <C-l> <esc>[sz= 
nnoremap <C-i> gi

" Status Line
" ===========


