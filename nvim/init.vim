call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'neomake/neomake'
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
nnoremap <silent> <F5> :call <SID>ToggleBG()<CR>

" Set space as leader
let mapleader=" "

" Remove Ctrl-z and s bindings, so that I don't hit them by mistake
map <C-z> <Nop>
noremap s <Nop>

" Replace hard-to-reach keys
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
noremap H ^
noremap L $
vnoremap L g_
noremap M %

" Miscellaneous options
set path+=lib/**,test/**,tests/**
set mouse=a
set guicursor=
set relativenumber
set number
set hlsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set nobackup
set history=50
set hidden
set cursorline
set scrolloff=6
set laststatus=2

" Help in new tab
nnoremap <Leader>h :tab help<Space>

" Visual mode deleting into black hole and pasting from register
vnoremap <Leader>r "_dP

" Remap Y to be more like C and D
nnoremap Y y$

" Opening and saving files
nnoremap <Leader>e :edit<Space>
nnoremap <Leader>f :find<Space>
nnoremap S :wa<CR>

" Easier buffer navigation
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Neovim terminal
nnoremap <Leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Search & replace
nnoremap n nzz
nnoremap N Nzz

if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c%m
endif

" TODO: replace these two with functions at some stage
nnoremap <Leader>cs :cdo %s/<C-r><C-w>//g <Bar> update<C-f>2F/l
nnoremap <Leader>ss :%s/<C-r>///g<Left><Left>

" Split screens
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
set splitbelow
set splitright

" Filetype settings
set expandtab shiftwidth=2 softtabstop=2
augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.pl set filetype=prolog
    autocmd Filetype python,sh,zsh,erlang,haskell,prolog setlocal shiftwidth=4 softtabstop=4
    autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab
augroup END

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,*.pyc
set wildignore+=.hg,.git,.svn

" Folding
set foldmethod=syntax
set foldlevel=10
augroup filetypes_folding
    autocmd!
    autocmd Filetype python setlocal foldmethod=indent
augroup END

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
let g:airline_section_y = 'Term: %{bufnr("term") == -1 ? "None" : bufnr("term")}'
