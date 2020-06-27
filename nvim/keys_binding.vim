" Change leader key from \ to ,
" let mapleader = ","

" Disable F1 bringing up the help doc every time
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" MOVING LINES
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" turn off search highlights
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Reload Vim config
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

" A saner way to save files.<F2> is easy to press
nnoremap <F2> :w<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" Switch Tabs
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <leader>w     :tabclose<CR>


