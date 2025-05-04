" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Enable auto-indentation
set autoindent

" Highlight cursor line
set cursorline

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch
set backspace=indent,eol,start " Intuitive backspace behavior
set ruler 
set wildmenu 




" Use case-insensitive search
set ignorecase
set smartcase

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'frazrepo/vim-rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
" Plug 'davidhalter/jedi-vim'
call plug#end()

" Set theme
let g:airline_theme='dark'
set background=dark
autocmd vimenter * colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

let g:rainbow_active = 1
let g:rainbow_guifgs = ['#FFB3BA', '#FFDFBA', '#FFFFBA', '#BAFFC9', '#BAE1FF', '#FFABAB']
let g:rainbow_ctermfgs = ['204', '223', '229', '157', '159', '217']

" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>


