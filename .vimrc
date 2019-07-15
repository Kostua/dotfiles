syntax on
set number
set hlsearch
filetype plugin indent on
set backspace=indent,eol,start
autocmd FileType yaml setlocal ai ts=2 sw=2 et
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'w0rp/ale'
call plug#end()
colorscheme gruvbox
map <C-n> :NERDTreeToggle<CR>
au BufRead,BufNewFile *.yml set filetype=yaml.ansible
" Map movement through errors without wrapping.
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
