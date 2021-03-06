"***********************************************************
"Using Vundle plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin '2072/PHP-Indenting-for-VIm'
"The two plugins below work with each other for clipboard interaction,
"but if vim was not compiled with clipboard support they don't work. 
"Plugin 'svermeulen/vim-easyclip'
"Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/javacomplete'

Plugin 'itchyny/lightline.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

"End Plugins

call vundle#end()            " required
filetype plugin indent on    " required
"***********************************************************
"Prevent preview window to open for Ctrl-x Ctrl-o
set completeopt-=preview

"Automatic reloading of .vimrc
"Original sourcing of vimrc before lightline plugin
"autocmd! bufwritepost .vimrc source %

"After the lightline plugin
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }


"Leader key
let mapleader=","

"Moving on tabs 1 
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
"Moving on tabs 2
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"colors elflord
"--------------
colorscheme elflord

"Encoding
"--------------
set encoding=utf-8
set fileencoding=utf-8

"Show normal mode commands
"-------------------------
set showcmd

"Display numbers
"---------------
set number
syntax enable
"filetypes
"filetype on	    " Enable filetype detection
"filetype indent on  " Enable filetype-specific indenting
"filetype plugin on  " Enable filetype-specific plugins

"Copy & paste settings
set clipboard=unnamed

"Set backspace to function normally (It works here as it should without this)
"set bs=2

"Highlight searches
"------------------
set hlsearch

"Spell Checking
"--------------
"-Set and unset spell with set spell or set nospell
"-using the command mode to avoid having highlights all
"-over the file all the time
"set spell spelllang=en_us

"OmniComplete
"C-o, C-p ets
set omnifunc=syntaxcomplete#Complete

"Avoid searching all included files. It is slow
"for autocomplete
set complete-=i

"AutoIndent
"--------------
set autoindent
set smartindent

"Mode display

"Lightline plugin shows mode in a nice format
"so we do not the default from vim to be displayed
"-------------------------------------------------
set noshowmode

"Statusline manual
"-----------------
"set laststatus=2
"set statusline=
"set statusline+=\[%{mode()}\]
"set statusline+=
"set statusline+=%F
"
"Note: I am using lightline to do this

"Indent multiple times without loosing selection
"-----------------------------------------------
vnoremap < <gv
vnoremap > >gv
"Disable wrapping, and set horizontal scroll
"--------------------------------------------

"No wrap
"-------
set nowrap

"Set tab spaces
"--------------
"set tabstop=2
set shiftwidth=4
set softtabstop=4
set expandtab


"Set java help complete 
"----------------------
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif


"Avoid adding the newline at the end of the file
"-----------------------------------------------
"---------------------------------------------------------------------------------------------------
"Setting ffs,ff and or noeol does not prevent vim from messing with dos file formats
"In order to preserve dos format we use BufWritePre here and when saving the file we do :w ++ff=dos
"---------------------------------------------------------------------------------------------------
"set ffs=dos,unix
"set noeol
autocmd BufWritePre *.php set binary
set background=dark

set autoread        " Auto reload changed files
set wildmenu        " Tab autocomplete in command mode
set path+=**

"Set cursorline for quickfix file/windows
"Not the best way to do it but it works
"----------------------------------------
autocmd FileType qf set cursorline

"Open quickfix window after doing grep.It shows the 
"result of grep for seraching src code
"--------------------------------------------------
command! -nargs=+ Silent execute 'silent <args>' | copen | redraw!

"PHP dev configuration
"----------------------
"Save php files in fileformat DOS. Not recomended all the
"time but sometimes we need to conform to the working rules, such as 
"the end of the line in my case. We need CRLF for the files to avoid unnecesary SVN conflicts.
"------------------------------------------------------------
"Remember: ww = window write
"To save for linux use the normal :w for now
"-----------------------------------------------------------
autocmd FileType php noremap! ww <Esc> :w ++ff=dos <CR>
autocmd FileType php nnoremap ww <Esc> :w ++ff=dos <CR>

"-----------------------------------------------------------
"Annoyances
"==========
"Don't need a reminder all the time the cursor is stuck
set visualbell t_vb=
"-----------------------------------------------------------

"set shel for no entries error
set shell=/bin/bash


"I need <C-z> for stopping jobs not for undo, find other mapping for undo
"------------------------------------------------------------------------
"autocmd FileType php noremap! <C-z> <Esc> :u <CR> 
"autocmd FileType php nnoremap <C-z> <Esc> :u <CR>

"This is the directory that .swp files will be stored
"This way I avoid having .swp files all over the place.
">>>>!!!!!!!!! IMPORTANT !!!!!!!!!!<<<<
"This backup path is for subversion. The path depends which vim I am using
"so when you import this file somewhere else make sure to change the path or
"comment this code.
">>>>!!!!!!!!! IMPORTANT !!!!!!!!!!<<<<

" Backup directory for files
" --------------------------
set backupdir=/path/to/dir
set directory=/path/to/dir
