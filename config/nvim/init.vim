if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhinz/vim-startify'

call plug#end()

"  Behavior Modification ----------------------  {{{
"" Don't restate NeoVim defaults.
"" See :help nvim-defaults for more info

" set leader key
let g:mapleader="\\"

" alias for leader key
nmap <space> \
xmap <space> \

set foldmethod=manual " set folds by syntax of current language
set ignorecase        " ignore case in searches
set list              " show invisible characters
set mouse=a           " enable mouse (selection, resizing windows)
set nowrap            " nowrap by default
set number            " Show line numbers
set numberwidth=1     " Number of columns for showing the line number
set smartcase         " use case sensitive if capital letter present or \C
set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
set tabstop=2         " Use 2 spaces for tabs.
set termguicolors     " enable true colors
set visualbell        " visual bell for errros

if has('persistent_undo')
  set undofile        " persistent undo between file reloads
endif

set splitbelow        " Open new split panes to the bottom
set splitright        " Open new split panes to the bottom
" }}}

" Vim Script file settings ------------------------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Color Settings ------------------------ {{{
colorscheme palenight
let g:palenight_terminal_italics=1
" }}}
