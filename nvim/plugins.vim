call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'iCyMind/NeoSolarized'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'vimwiki/vimwiki'
Plug 'kassio/neoterm'
call plug#end()

" Set colorscheme
colorscheme NeoSolarized

" Fugitive
nnoremap gs :Gstatus<CR>

" Vim-airline
let g:airline_extensions=['branch']
let g:airline_theme='zenburn'
let g:airline_powerline_fonts=1

" Neoterm
let g:neoterm_default_mod='vertical'
let g:neoterm_size=60
nnoremap <Leader>t :T<Space>
nnoremap <Leader>; :Ttoggle<CR>
