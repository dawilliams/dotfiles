if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

"=====================================================
"===================== SETTINGS ======================

" color
syntax enable

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1
