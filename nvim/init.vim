call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'iCyMind/NeoSolarized'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'davidhalter/jedi', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
call plug#end()

" Colorscheme
set termguicolors
set background=dark
colorscheme NeoSolarized

" Function for toggling the background color
function! s:ToggleBG()
    let &background = ( &background == "dark" ? "light" : "dark" )
endfunction
nnoremap <F5> :call <SID>ToggleBG()<CR>

" Set comma as leader
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
nnoremap <leader>c :nohlsearch<CR>
set nobackup
set history=50
set hidden
"set cursorline
set scrolloff=6
set laststatus=2

" Help in new tab
nnoremap <leader>h :tab help<Space>

" Visual mode deleting into black hole and pasting from register
vnoremap <leader>r "_dP

" Remap Y to be more like C and D
nnoremap Y y$

" Opening and saving files
nnoremap <leader>e :edit<Space>
nnoremap S :wa<CR>

" Easier buffer navigation
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Split screens
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
nnoremap + 5<C-w>+
nnoremap - 5<C-w>-
nnoremap <M-,> 10<C-w><
nnoremap <M-.> 10<C-w>>
set splitbelow
set splitright

" Filetype settings
set expandtab shiftwidth=2 softtabstop=2
augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.pl set filetype=prolog
    autocmd Filetype python,sh,zsh,erlang,prolog setlocal shiftwidth=4 softtabstop=4
    autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab
augroup END

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,*.pyc
set wildignore+=.hg,.git,.svn

" Neovim terminal
nnoremap <leader>tt :terminal<CR>
nnoremap <leader>ts :10split term://zsh<CR>
nnoremap <leader>tv :40vsplit term://zsh<CR>
tnoremap <Esc> <C-\><C-n>

" Use ag for vimgrep
if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c%m
    " replace (after search)
    ":cdo %s//$1/gc | update

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" Folding
set foldmethod=syntax
set foldlevel=10
augroup filetypes_folding
    autocmd!
    "autocmd Filetype elixir setlocal foldlevel=2
    autocmd Filetype python setlocal foldmethod=indent
augroup END

" CtrlP - include buffers (not needed if <leader>b works
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_cmd = 'CtrlPBuffer'

" Neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:neomake_list_height = 10
let g:neomake_javascript_enabled_makers = ['eslint']
let g:airline#extensions#neomake#enabled = 1

" Autocomplete shortcuts and settings
let g:deoplete#enable_at_startup = 1
set completeopt=menu
set shortmess+=c
inoremap <C-j> <C-n>

" Neosnippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Fugitive
nnoremap gs :Gstatus<CR>

" Vim-airline
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1

" Alchemist settings
let g:alchemist_iex_term_size=10
nnoremap <leader>ms :IEx<Space>
nnoremap <leader>mt :Mix test<CR>
nnoremap <leader>mc :Mix compile<CR>
