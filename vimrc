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

" Basic Usability stuff
" =====================

" Detect filetype
filetype plugin on

" Turn syntax highlighting on
syntax on

" Show line numbers
:set number

" Word Wrapping
" =============

" Automatically hard wrap as you type and as you edit so you don't have to
" constantly gq 
set formatoptions+=a

" Turn hard wrapped text into soft wrapped.
" This command will join all lines within a range that are not separated
" by empty lines. Automatic word wrap must be off (set fo-=a).
" Useful if you need to copy and paste into a word processor.
"command! -range=% SoftWrap
"            \ <line2>put _ |
"            \ <line1>,<line2>g/.\+/ .;-/^$/ join |normal $x

" Spell checking
" ==============

" Note: requires ????? to be installed

" Turn spell check on
set spell

" Set language.  Note: This uses Canadian spellings, so words like color will
" be highlighted as regional variations rather than outright misspellings.
set spelllang=en_ca

" Taken from [Terminally Incoherent](http://www.terminally-incoherent.com/blog/2012/10/01/vim-the-hidden-power-of-customization/)
" The key combo [s takes you to the nearest misspelled word to the left of the
" cursor, and then z= gives you a list of words to choose from.  This rebinds
" C-l to do that when you're in insert mode, then C-i to go back to the last
" insert point.  
inoremap <C-l> <esc>[sz= 
nnoremap <C-i> gi

