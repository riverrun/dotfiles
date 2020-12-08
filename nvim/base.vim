" Colorscheme
set termguicolors
set background=dark

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

" Make some commonly used key bindings easier to reach
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
noremap H ^
noremap L $
vnoremap L g_
noremap M %
inoremap <C-j> <C-n>

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

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.pdf,*.psd,*.pyc
set wildignore+=.hg,.git,.svn

" Split screens
nnoremap <C-j> <C-w>w
nnoremap <C-k> <C-w>W
set splitbelow
set splitright
set diffopt+=vertical

" Search & replace
nnoremap n nzz
nnoremap N Nzz

if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c%m
endif

nnoremap <Leader>cs :cdo %s/<C-r><C-w>//g <Bar> update<C-f>2F/l
nnoremap <Leader>ss :%s/<C-r>///g<Left><Left>

" Add undo until last write
nnoremap U :earlier 1f<CR>

" Neovim terminal
nnoremap <Leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal scrollback=100000
autocmd TermEnter * setlocal scrolloff=0
autocmd TermLeave * setlocal scrolloff=6

" Filetype settings
set expandtab shiftwidth=2 softtabstop=2
augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.pl set filetype=prolog
    autocmd Filetype python,sh,zsh,erlang,haskell,prolog setlocal shiftwidth=4 softtabstop=4
    autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab
augroup END

" Folding
set foldmethod=syntax
set foldlevel=1
augroup filetypes_folding
    autocmd!
    autocmd Filetype python setlocal foldmethod=indent
augroup END
let g:markdown_folding=1
