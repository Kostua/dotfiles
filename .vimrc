syntax on
set number
set hlsearch
filetype plugin indent on
set backspace=indent,eol,start
autocmd FileType yaml setlocal ai ts=2 sw=2 et
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
call plug#end()
set runtimepath^=~/.vim/bundle/ctrlp.vim
colorscheme gruvbox
au BufRead,BufNewFile *.yml set filetype=yaml.ansible
" Map movement through errors without wrapping.
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
" move among buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <C-X> :bdelete<CR>
