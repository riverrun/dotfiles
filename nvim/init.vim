call plug#begin()
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'wlangstroth/vim-racket'
Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
Plug 'tmhedberg/SimpylFold'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
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
let g:airline#extensions#branch#enabled=1
let g:airline_theme='zenburn'
let g:airline_powerline_fonts=1

" Folding
set foldmethod=syntax
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction
autocmd BufNewFile,BufRead *.md setlocal foldexpr=MarkdownLevel()
autocmd BufNewFile,BufRead *.md setlocal foldmethod=expr foldlevel=1
autocmd Filetype python setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd Filetype elixir setlocal foldlevel=1

" Remap Ctrl-z to save and exit
map <C-z> :xa<CR>

" Remove s bindings, so that I don't hit them by mistake
nnoremap S <Nop>
nnoremap s <Nop>

" Visual mode deleting into black hole and pasting from register
vnoremap r "_dP

" Remap Y to be more like C and D
nnoremap Y y$

" Set space as leader
let mapleader=" "

" Neovim terminal
noremap <leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Easier buffer navigation
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprevious<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>w :wa<CR>
nnoremap <NUL> :wa<CR>

" Open files
set path+=**
nnoremap <leader>e :edit<Space>
nnoremap <leader>f :find<Space>
nnoremap <leader>s :split<Space>
nnoremap <leader>v :vsplit<Space>
set splitbelow
set splitright

" Manage split screens
nnoremap + 10<C-w>+
nnoremap - 10<C-w>-
nnoremap <C-n> 20<C-w><
nnoremap <C-m> 20<C-w>>

" Easier window navigation
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W

" Tab / indentation settings
set expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.pl set filetype=prolog
autocmd Filetype html,css,elixir setlocal shiftwidth=2 softtabstop=2
autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab

" Default omnifuncs
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=python3complete#Complete

" Autocomplete / omnicomplete shortcuts and settings
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <S-tab> <C-p>
set completeopt=menu
set shortmess+=c

" Neosnippet trigger
inoremap <C-j> <Plug>(neosnippet_expand_or_jump)
snoremap <C-j> <Plug>(neosnippet_expand_or_jump)
xnoremap <C-j> <Plug>(neosnippet_expand_target)

" Fugitive
nnoremap gs :Gstatus<CR>

" NERDTree shortcuts
nnoremap <C-p> :NERDTreeToggle<CR>

" Alchemist settings
let g:alchemist_iex_term_size=10

" Strip trailing whitespace when writing file
function! <SID>StripTrailingWhitespaces()
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
nnoremap <silent> ,/ :nohlsearch<CR>
set nobackup
set history=50
set hidden
set ruler
set showcmd
set incsearch
set scrolloff=6
set laststatus=2
