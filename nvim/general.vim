" Disallow detection of filetypes
filetype off

filetype plugin indent on    " required

syntax on

if (has("termguicolors"))
 set termguicolors
endif

set encoding=UTF-8

" Show line numbers
set number

set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" Stop concealing quotes in JSON
let g:vim_json_syntax_conceal = 0

" Enable JSX syntax highlighting in .js files
let g:jsx_ext_required = 0

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" More natural split opening.
set splitbelow
set splitright

" Show leader key
set showcmd

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" TABS AND SPACES
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width

" Some servers have issues with backup files,
set noswapfile " No swap file
set nobackup
set nowritebackup

set textwidth=80
set formatoptions+=t
set colorcolumn=+1
set showmatch
set lazyredraw

" #FINDING FILES
" Use the `:find` command to fuzzy search files in the working directory
" The `:b` command can also be used to do the same for open buffers

" Search all subfolders
set path+=**

" Display matching files on tab complete
set wildmenu

" Ignore node_modules and images from search results
set wildignore+=**/node_modules/**,**/dist/**,**_site/**,*.swp,*.png,*.jpg,*.gif,*.webp,*.jpeg,*.map

" Use the system register for all cut yank and paste operations
set clipboard=unnamedplus

" Toggle Hybrid Numbers in insert and normal mode
:set number relativenumber

" Show Invisibles
set list
set listchars=tab:→→,eol:¬,space:.

" Automatically hide buffer with unsaved changes without showing warning
set hidden

" Treat all numbers as decimal regardless of whether they are padded with zeros
set nrformats=

" Highlight matches when using :substitute
set hlsearch

" Predicts case sensitivity intentions
set smartcase

" Jump to match when searching
set incsearch

" Enable word completion
set complete+=kspell

hi NonText guifg=#4a4a59
hi SpecialKey guifg=white guibg=#cc0000

" Strip trailing whitespace from all files
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e

" Automatically remove the preview window after autocompletion
autocmd CompleteDone * pclose

au BufRead,BufNewFile,BufReadPost *.json set syntax=json

" RIPGREP
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

