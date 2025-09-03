" ===============================
" Neovim init.vim para Go + Python + Rust + JS + HTML
" ===============================

" -------------------------
" Configurações básicas
" -------------------------
set nocompatible
set noswapfile
set background=dark
let mapleader = " "

" -------------------------
" Vim-Plug setup
" -------------------------
call plug#begin('~/.vim/plugged')

" -------------------------
" Gerenciador de Plugins
" -------------------------
Plug 'junegunn/vim-plug'            " Vim-Plug (referência)
Plug 'sheerun/vim-polyglot'         " Suporte a múltiplas linguagens
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " LSP + Autocomplete

" Go
Plug 'fatih/vim-go'

" Python
Plug 'psf/black'
Plug 'vim-python/python-syntax'

" Rust
Plug 'rust-lang/rust.vim'

" JavaScript / TypeScript / HTML / Web Dev
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'     " JSX/TSX highlight
Plug 'yuezk/vim-js'                 " Melhor suporte para JS
Plug 'othree/html5.vim'             " HTML5 support
Plug 'mattn/emmet-vim'              " Expansões emmet

" Análise estática
Plug 'dense-analysis/ale'

" Interface e navegação
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'lunarvim/darkplus.nvim'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'RRethy/vim-illuminate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()
filetype plugin indent on
syntax enable

" -------------------------
" Tema
" -------------------------
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = 1
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" -------------------------
" Configurações gerais
" -------------------------
set number relativenumber
set ts=4 sw=4 expandtab autoindent smartindent
set cursorline
set showmatch
set incsearch
set wildmenu
set confirm
set colorcolumn=80
set laststatus=2
set undodir=~/.vim/undodir
set undofile
let python_highlight_all=1

" -------------------------
" Atalhos gerais
" -------------------------
nnoremap <C-e> :Ex<CR>
nnoremap <C-c> :close<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeRefreshRoot<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" -------------------------
" ALE (Linters & Fixers)
" -------------------------
let g:ale_linters = {
\ 'python': ['flake8', 'pylint'],
\ 'go': ['gofmt', 'golint', 'gopls'],
\ 'rust': ['rls', 'cargo'],
\ 'javascript': ['eslint'],
\ 'html': ['tidy']
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['black'],
\ 'go': ['gofmt'],
\ 'rust': ['rustfmt'],
\ 'javascript': ['eslint'],
\ 'html': ['prettier']
\}
let g:ale_fix_on_save = 1

" -------------------------
" Coc.nvim Config
" -------------------------
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gD <Plug>(coc-declaration)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>f  :call CocAction('format')<CR>
xnoremap <leader>f  :call CocAction('format')<CR>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <leader>q :CocFix<CR>
autocmd FileType go nnoremap <leader>oi :CocCommand go.import.organize<CR>
nnoremap <leader>e :CocList diagnostics<CR>

" -------------------------
" Vim-Go Config
" -------------------------
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "gofmt"
let g:go_auto_type_info = 1

" -------------------------
" Comandos Python
" -------------------------
autocmd FileType python nnoremap <buffer> <F9> :w<CR>:!python3 %<CR>
autocmd FileType python inoremap <buffer> <F9> <esc>:w<CR>:!python3 %<CR>

" -------------------------
" Emmet para HTML/JSX
" -------------------------
let g:user_emmet_leader_key='<C-z>'
autocmd FileType html,css,javascript.jsx EmmetInstall

" -------------------------
" Indent Guides
" -------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow_active = 0
