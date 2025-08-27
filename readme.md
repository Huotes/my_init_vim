# Configuração Neovim para Go + Python

Este repositório contém meu arquivo `init.vim` personalizado para desenvolvimento em **Go** e **Python**, com foco em produtividade, linting, navegação e aparência aprimorada.

## Principais Recursos

- **Gerenciamento de Plugins**: Usando [Vundle](https://github.com/VundleVim/Vundle.vim)
- **LSP**: [coc.nvim](https://github.com/neoclide/coc.nvim) para autocompletar e suporte avançado
- **Go**: Integração completa com [vim-go](https://github.com/fatih/vim-go)
- **Python**:
  - Formatação automática com [Black](https://github.com/psf/black)
  - Sintaxe aprimorada com `python-syntax`
- **Linting e Fixing**: [ALE](https://github.com/dense-analysis/ale) configurado para Go e Python
- **Interface**:
  - [lightline.vim](https://github.com/itchyny/lightline.vim) para barra de status minimalista
  - Tema [gruvbox-material](https://github.com/sainnhe/gruvbox-material)
- **Navegação**:
  - [NERDTree](https://github.com/preservim/nerdtree)
  - [Tagbar](https://github.com/preservim/tagbar)
  - [fzf.vim](https://github.com/junegunn/fzf.vim) para busca de arquivos

## Atalhos Úteis

- `Ctrl + e` – Abrir explorador de arquivos
- `dnn` – Alternar NERDTree
- `dtt` – Abrir Tagbar
- `dff` – Buscar arquivos com FZF
- `K` – Documentação do símbolo sob o cursor
- `gd` / `gD` / `gi` / `gr` – Navegação de definições, declarações, implementações e referências

## Instalação

1. Clone o repositório e copie o `init.vim` para `~/.config/nvim/init.vim`
2. Instale os plugins:
   ```vim
   :PluginInstall
