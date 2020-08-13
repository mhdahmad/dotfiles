" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Fuzzy Search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Autocompletion, Linting & Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'SirVer/ultisnips'

" Theme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Syntax Highlighting And Indentation For 100+ Languages
Plug 'sheerun/vim-polyglot'

" Utilties
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascriptreact', 'blade'] }

Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'ryanoasis/vim-devicons'

call plug#end()

