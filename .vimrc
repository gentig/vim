"colors elflord
colorscheme elflord

set encoding=utf-8
set fileencoding=utf-8

"Display numbers
set number

" Disable wrapping, and set horizontal scroll
set nowrap

"Set tab spaces:
"set tabstop=2
set shiftwidth=4
set softtabstop=4
set expandtab

"Set java help complete 
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif

"Avoid adding the newline at the end of the file
"================================================
"---------------------------------------------------------------------------------------------------
"Setting ffs,ff and or noeol does not prevent vim from messing with dos file formats
"In order to preserve dos format we use BufWritePre here and when saving the file we do :w ++ff=dos
"---------------------------------------------------------------------------------------------------
"set ffs=dos,unix
"set noeol
autocmd BufWritePre *.php set binary
set background=dark
