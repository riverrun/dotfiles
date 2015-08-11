" Configuration file for vim.

" Use 256 colors
set t_Co=256

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to manage plugins
execute pathogen#infect()

" Syntastic options
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Solarized colors
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

" Change the mapleader from \ to space
let mapleader="\<Space>"

" Neovim terminal keybindings
map <leader>t :terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Open netrw file explorer
map <leader>f :Explore<CR>
let g:netrw_liststyle=3

" Easier buffer navigation
nmap <leader>e :edit<Space>
nnoremap <leader>l :buffers<CR>:buffer<Space>
nnoremap <silent> <tab> :bnext<CR>
nnoremap <silent> <s-tab> :bprevious<CR>
nmap <leader>s :wa<CR>

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

" Visual mode deleting into black hole and pasting from register
vmap r "_dP

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup            " do not keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hidden              " hide buffers instead of closing them
set number              " set numbering
set scrolloff=6         " allow scrolling when moving to top or bottom of screen
set laststatus=2         " always show statusline

" Toggle relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

set relativenumber
nnoremap <leader>n :call NumberToggle()<CR>

" Toggle paste mode
set pastetoggle=<F2>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Allow highlighting search patterns and toggle highlighting.
syntax on
set hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" Set tabs to four spaces.
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " html, xml, etc files
  autocmd FileType html,htmldjango,css,less,xhtml,xml setlocal shiftwidth=2 softtabstop=2

  " elixir and nim files
  autocmd FileType elixir,nim setlocal shiftwidth=2 softtabstop=2

  " c files
  autocmd FileType c setlocal softtabstop=8 shiftwidth=8 noexpandtab

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif
