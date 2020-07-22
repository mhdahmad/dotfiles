" Change leader key from \ to ,
let mapleader = ","

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

" Shortcut to open init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Reload Vim config
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>

" Save state of open Windows and Buffers
nnoremap <leader>s :mksession<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" A saner way to save files.<F2> is easy to press
nnoremap <F2> :w<CR>

" Create file under cursor
:map <leader>gf :e <cfile><cr>

" Switching tabs quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Switch Tabs
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <leader>w     :tabclose<CR>

