call plug#begin()
Plug 'Shougo/neocomplete.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-bufferline'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'elixir-lang/vim-elixir'
call plug#end()

" Colorscheme
set t_Co=256
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" Vim-airline
let g:airline#extensions#branch#enabled = 0
let g:airline_theme="solarized"
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'

" Remap Ctrl-z to save and exit
map <C-z> :xa<CR>

" Visual mode deleting into black hole and pasting from register
vmap r "_dP

" Toggle relativenumber
set number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
set relativenumber
nnoremap <F2> :call NumberToggle()<CR>

" Leader settings
let mapleader = " " " <space> as leader
" Easier buffer navigation
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprevious<CR>
nmap <leader>s :wa<CR>
" CtrlP shortcuts
nnoremap <Leader>e :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" Split screens
nmap <leader>h :split<Space>
nmap <leader>v :vsplit<Space>
map + 10<C-w>+
map - 10<C-w>-
map <C-n> 20<C-w><
map <C-m> 20<C-w>>
" Easier window navigation
map <C-j> <C-w>w
map <C-k> <C-w>W

" Tab settings
set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype python,javascript,sh,zsh setlocal shiftwidth=4 softtabstop=4
autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab

" Use python3complete by default
autocmd FileType python setlocal omnifunc=python3complete#Complete

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pyflakes']

" Add template for elixir files
au BufNewFile *.{ex,exs} 0r ~/.vim/templates/elixir_skel.ex

" Autocomplete / omnicomplete shortcuts and settings
let g:neocomplete#enable_at_startup = 1
inoremap <tab> <C-n>
inoremap <s-tab> <C-p>
set completeopt=menu,noselect
set shortmess+=c

" Miscellaneous options
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>
set nobackup
set history=50
set hidden
set ruler
set showcmd
set incsearch
set scrolloff=6
set laststatus=2
