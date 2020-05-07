" BASIC SETUP

" Enter the current millenium
set nocompatible

" DISPLAY

" Color Scheme
colorscheme monokai

" Numbers
set number
set relativenumber
set numberwidth=5

" Break indent
set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=>>

" KEYS

" Tabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Escape clears highlighting
nnoremap <esc> :noh<return><esc>

" FINDING FILES

" Search down into subfolders
set path+=**
 
