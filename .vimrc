"colors elflord
"--------------
colorscheme elflord
"Encoding
"--------------
set encoding=utf-8
set fileencoding=utf-8

"Display numbers
"---------------
set number

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
