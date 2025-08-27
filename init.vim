" ===============================
" Neovim init.vim para Go + Python
" ===============================

set nocompatible
set noswapfile
set background=dark
let mapleader = " "

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" -------------------
" Gerenciador de Plugins
" -------------------
Plugin 'VundleVim/Vundle.vim'

" Suporte para múltiplas linguagens
Plugin 'sheerun/vim-polyglot'

" LSP
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Go
Plugin 'fatih/vim-go'

" Python
Plugin 'psf/black'
Plugin 'vim-python/python-syntax'

" Análise estática
Plugin 'dense-analysis/ale'

" Interface e navegação
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'sainnhe/gruvbox-material'
Plugin 'preservim/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'RRethy/vim-illuminate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin indent on
syntax enable

" -------------------------
" Tema
" -------------------------
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground = 'original'
colorscheme gruvbox-material

" Transparência (funciona em terminal que suporta)
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

" Python Highlight
let python_highlight_all=1

" -------------------------
" Atalhos gerais
" -------------------------
map <C-e> :Ex<CR>
map <C-c> :close<CR>
map dnn :NERDTreeToggle<CR>
map drr :NERDTreeRefreshRoot<CR>
map dtt :TagbarOpen<CR>
map dtc :TagbarClose<CR>
map dff :Files<CR>
map drg :Rg<CR>

" Navegação entre janelas
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>

" -------------------------
" ALE para Python e Go
" -------------------------
let g:ale_linters = {
\ 'python': ['flake8', 'pylint'],
\ 'go': ['gofmt', 'golint', 'gopls']
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['black'],
\ 'go': ['gofmt']
\}
let g:ale_fix_on_save = 1

" -------------------------
" Configuração Coc.nvim
" -------------------------
" Atalhos essenciais
inoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocActionAsync('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  :call CocAction('format')<CR>
xmap <leader>f  :call CocAction('format')<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>q :CocFix<CR>
autocmd FileType go nmap <leader>oi :CocCommand go.import.organize<CR>
nmap <leader>e :CocList diagnostics<CR>

" -------------------------
" Vim-Go Config
" -------------------------
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "gofmt"
let g:go_auto_type_info = 1

" -------------------------
" Comandos Python
" -------------------------
autocmd FileType python map <buffer> <F9> :w<CR>:!python3 %<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:!python3 %<CR>

" -------------------------
" Indent Guides
" -------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:rainbow_active = 0
