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
"End Plugins

call vundle#end()            " required
filetype plugin indent on    " required
"***********************************************************
"Prevent preview window to open for Ctrl-x Ctrl-o
set completeopt-=preview

"Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"Leader key
let mapleader=","
"Moving on tabs with 
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

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

"AutoIndent
"--------------
set autoindent
set smartindent

"Indent multiple times without loosing selection
vnoremap < <gv
vnoremap > >gv
"Disable wrapping, and set horizontal scroll
"--------------------------------------------
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

"I need <C-z> for stopping jobs not for undo, find other mapping for undo
"------------------------------------------------------------------------
"autocmd FileType php noremap! <C-z> <Esc> :u <CR> 
"autocmd FileType php nnoremap <C-z> <Esc> :u <CR>
