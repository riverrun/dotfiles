call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'overcache/NeoSolarized'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
call plug#end()

" Set colorscheme
colorscheme NeoSolarized

" Dispatch
nnoremap <Leader>mat :Dispatch mix test<CR>
nnoremap <Leader>mft :Dispatch mix test %<CR>
nnoremap <Leader>mlt :execute "Dispatch mix test %:" . line(".")<CR>

" Fugitive
nnoremap gs :Gstatus<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveStatusline'
      \ },
      \ }
set noshowmode
