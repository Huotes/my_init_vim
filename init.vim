" ===============================
" Neovim init.vim para Go + Python + Rust
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
Plug 'junegunn/vim-plug'  " Vim-Plug, só para referência
Plug 'sheerun/vim-polyglot'  " Suporte a múltiplas linguagens

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Go
Plug 'fatih/vim-go'

" Python
Plug 'psf/black'
Plug 'vim-python/python-syntax'

" Rust
Plug 'rust-lang/rust.vim'

" Análise estática
Plug 'dense-analysis/ale'

" Interface e navegação
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'lunarvim/darkplus.nvim' " Tema darkflat-like
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
let g:gruvbox_contrast_dark = 'hard'   " opcional, pode ser 'soft' ou 'medium'
let g:gruvbox_transparent_bg = 1       " ativa transparência para Gruvbox
colorscheme gruvbox

" Transparência
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
" Navegação e NERDTree
nnoremap <C-e> :Ex<CR>
nnoremap <C-c> :close<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeRefreshRoot<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>

" Navegação entre janelas
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" -------------------------
" ALE para Python, Go e Rust
" -------------------------
let g:ale_linters = {
\ 'python': ['flake8', 'pylint'],
\ 'go': ['gofmt', 'golint', 'gopls'],
\ 'rust': ['rls', 'cargo']
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['black'],
\ 'go': ['gofmt'],
\ 'rust': ['rustfmt']
\}
let g:ale_fix_on_save = 1

" -------------------------
" Configuração Coc.nvim
" -------------------------
" Atualiza sugestões manualmente
inoremap <silent><expr> <C-Space> coc#refresh()

" Tab confirma sugestão
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"

" Navegação entre sugestões com Ctrl+n / Ctrl+p
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

" Shift+Tab não faz nada (não mapeado)

" Navegação e ações com Coc
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
" Indent Guides
" -------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow_active = 0
