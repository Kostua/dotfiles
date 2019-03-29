syntax on
set number
set hlsearch
set tabstop=4
set smartindent 
filetype indent on
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'https://github.com/scrooloose/nerdtree'
call plug#end()
colorscheme gruvbox
map <C-n> :NERDTreeToggle<CR>
