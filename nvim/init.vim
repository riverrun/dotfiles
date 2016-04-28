call plug#begin()
Plug 'Shougo/deoplete.nvim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Colorscheme
set t_Co=256
set background=dark
colorscheme solarized
call togglebg#map("<C-t>")

" Vim-airline
let g:airline#extensions#branch#enabled = 0
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" Remap Ctrl-z to save and exit
map <C-z> :xa<CR>

" Remove s bindings, so that I don't hit it by mistake
map S <Nop>
map s <Nop>

" Visual mode deleting into black hole and pasting from register
vmap r "_dP

" Set space as leader
let mapleader = " "

" Neovim terminal
map <leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Easier buffer navigation
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprevious<CR>
nmap <leader>s :wa<CR>
nnoremap <NUL> :wa<CR>

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
nmap <C-j> <C-w>w
nmap <C-k> <C-w>W

" Tab / indentation settings
set expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.pl set filetype=prolog
autocmd Filetype python,javascript,prolog,sh,zsh setlocal shiftwidth=4 softtabstop=4
autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab

" Default omnifuncs
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Autocomplete / omnicomplete shortcuts and settings
let g:deoplete#enable_at_startup = 1
inoremap <tab> <C-n>
inoremap <S-tab> <C-p>
set completeopt=menu
set shortmess+=c

" Ultisnips trigger
let g:UltiSnipsExpandTrigger="<NUL>"

" Strip trailing whitespace when writing file
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Check syntax with neomake when writing file
autocmd! BufWritePost * Neomake

" Miscellaneous options
set relativenumber
set number
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
