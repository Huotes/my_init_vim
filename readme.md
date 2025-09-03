# Configuração Neovim para Go + Python + Rust + JavaScript + HTML

Este repositório contém meu arquivo `init.vim` personalizado para desenvolvimento em **Go**, **Python**, **Rust**, **JavaScript** e **HTML**, com foco em produtividade, linting, navegação e aparência aprimorada.

## Principais Recursos

- **Gerenciamento de Plugins**: Usando [vim-plug](https://github.com/junegunn/vim-plug)
- **LSP & Autocomplete**: [coc.nvim](https://github.com/neoclide/coc.nvim) com suporte a múltiplas linguagens
- **Go**: Integração completa com [vim-go](https://github.com/fatih/vim-go)
- **Python**:
  - Formatação automática com [Black](https://github.com/psf/black)
  - Sintaxe aprimorada com [python-syntax](https://github.com/vim-python/python-syntax)
- **Rust**: Suporte oficial via [rust.vim](https://github.com/rust-lang/rust.vim)
- **JavaScript / HTML**:
  - [vim-javascript](https://github.com/pangloss/vim-javascript)
  - [vim-jsx-pretty](https://github.com/maxmellon/vim-jsx-pretty)
  - [html5.vim](https://github.com/othree/html5.vim)
  - [emmet-vim](https://github.com/mattn/emmet-vim) para expansões rápidas
- **Linting e Fixing**: [ALE](https://github.com/dense-analysis/ale) configurado para Go, Python, Rust, JS e HTML
- **Interface**:
  - [lightline.vim](https://github.com/itchyny/lightline.vim) para barra de status minimalista
  - Tema [gruvbox](https://github.com/morhetz/gruvbox) com transparência
- **Navegação**:
  - [NERDTree](https://github.com/preservim/nerdtree) para árvore de arquivos
  - [Tagbar](https://github.com/preservim/tagbar) para símbolos e classes
  - [fzf.vim](https://github.com/junegunn/fzf.vim) para busca de arquivos
  - Múltiplos cursores com [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

## Atalhos Úteis

- `Ctrl + e` – Abrir explorador de arquivos
- `<leader>n` – Alternar NERDTree
- `<leader>r` – Atualizar raiz do NERDTree
- `<leader>t` – Alternar Tagbar
- `<leader>f` – Buscar arquivos com FZF
- `<leader>g` – Buscar texto com Ripgrep
- `gd` / `gD` / `gi` / `gr` – Navegação entre definições, declarações, implementações e referências
- `K` – Mostrar documentação/hover da função ou variável
- `<leader>rn` – Renomear símbolo
- `<leader>f` – Formatador de código via Coc
