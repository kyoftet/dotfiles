set number
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set showcmd
set cursorline
set cursorcolumn
set showmatch
set laststatus=2
set expandtab
set tabstop=2
set shiftwidth=2
set incsearch
set hlsearch
set ignorecase
set smartcase
set clipboard=unnamedplus,autoselect

inoremap <silent> jk <ESC>
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nmap <C-j> 5j
nmap <C-k> 5k

syntax on
set t_Co=256

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

