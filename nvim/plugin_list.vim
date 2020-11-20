" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive' " A Git wrapper
Plug 'airblade/vim-gitgutter' " Shows git diff markers in the sign column
Plug 'rhysd/git-messenger.vim' " Reveal the commit messages under the cursor

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Make Vim/Neovim as smart as VSCode
Plug 'mattn/emmet-vim' " Emmet for vim
Plug 'honza/vim-snippets' " Vim snipmate default snippets

Plug 'romainl/vim-qf' " Working with the location/quickfix list smoother
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'wellle/targets.vim' " Provides additional text objects
Plug 'ludovicchabant/vim-gutentags' " Manages your tag files automatically
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion' " Vim motions on speed
Plug 'liuchengxu/vim-which-key' " Display available keybindings in popup
Plug 'skywind3000/asynctasks.vim' " Modern Task System for Project Building, Testing and Deploying
Plug 'skywind3000/asyncrun.vim' " Run Async Shell Commands
Plug 'moll/vim-bbye' " Delete buffers and close files in Vim without closing your windows 
Plug 'psliwka/vim-smoothie' " Smooth scrolling for vim
" Plug 'airblade/vim-rooter'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim' " A light and configurable statusline
Plug 'sheerun/vim-polyglot' " Syntax Highlighting And Indentation
Plug 'voldikss/vim-floaterm' " Use terminal in the floating window
Plug 'mhinz/vim-startify' " The fancy start screen
Plug 'miyakogi/conoline.vim' " Highlights the line of the cursor
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'ryanoasis/vim-devicons' " Adds file type icons

call plug#end()

