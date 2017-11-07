call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'benekastah/neomake'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'davidhalter/jedi', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
call plug#end()

" Colorscheme
set t_Co=256
set background=dark
colorscheme solarized
call togglebg#map("F5")

" Set space as leader
let mapleader=" "

" Remove Ctrl-z and s bindings, so that I don't hit them by mistake
map <C-z> <Nop>
nnoremap s <Nop>

" Miscellaneous options
set mouse=a
set guicursor=
set relativenumber
set number
set hlsearch
nnoremap <silent> ,/ :nohlsearch<CR>
set nobackup
set history=50
set hidden
set cursorline
set ruler
set showcmd
set scrolloff=6
set laststatus=2

" Add another escape
imap <C-l> <Esc>

" Visual mode deleting into black hole and pasting from register
vnoremap <leader>r "_dP

" Remap Y to be more like C and D
nnoremap Y y$

" Opening and saving files
nnoremap <leader>e :edit<Space>
nnoremap <leader>q :bd<CR>
nnoremap S :wa<CR>

" Neovim terminal
nnoremap <leader>tt :terminal<CR>
nnoremap <leader>ts :split term://zsh<CR>
nnoremap <leader>tv :vsplit term://zsh<CR>
tnoremap <Esc> <C-\><C-n>

" Split screens
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nnoremap + 5<C-w>+
nnoremap - 5<C-w>-
nnoremap <M-,> 10<C-w><
nnoremap <M-.> 10<C-w>>
set splitbelow
set splitright

" Location window
nmap <leader>lo :lopen<CR>
nmap <leader>lc :lclose<CR>
nmap <leader>ll :ll<CR>
nmap <leader>ln :lnext<CR>
nmap <leader>lp :lprev<CR>

" Navigation within file
nnoremap <CR> G
nnoremap <BS> gg

" Easier buffer navigation
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprevious<CR>

" Filetype settings
set expandtab shiftwidth=2 softtabstop=2
augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.pl set filetype=prolog
    autocmd Filetype python,sh,erlang,prolog setlocal shiftwidth=4 softtabstop=4
    autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab
augroup END

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.pyc

" Folding
set foldmethod=syntax
augroup filetypes_folding
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal foldexpr=MarkdownLevel()
    autocmd BufNewFile,BufRead *.md setlocal foldmethod=expr foldlevel=1
    autocmd Filetype elixir setlocal foldlevel=2
augroup END

" Function for markdown folding
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction

" Function to strip trailing whitespace when writing file
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Jobs to do when saving a file
augroup save_jobs
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    autocmd! BufWritePost * Neomake
augroup END

" Vim-airline
let g:airline#extensions#branch#enabled=1
let g:airline_theme='zenburn'
let g:airline_powerline_fonts=1

" Neomake
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_list_height = 10
let g:airline#extensions#neomake#enabled = 1
let g:jsx_ext_required = 0

" Autocomplete (deoplete) shortcuts and settings
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = ['jsx', 'javascript.jsx']
set completeopt=menu
set shortmess+=c
inoremap <C-j> <C-n>

" Neosnippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump)
xmap <C-Space> <Plug>(neosnippet_expand_target)

" Ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Fugitive
nnoremap gs :Gstatus<CR>

" Alchemist settings
let g:alchemist_iex_term_size=10
nnoremap <leader>ms :IEx<Space>
nnoremap <leader>mt :Mix test<CR>
nnoremap <leader>mc :Mix compile<CR>
