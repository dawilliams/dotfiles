if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
" Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kassio/neoterm'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'

call plug#end()

"  Behavior Modification ---------------------------------------  {{{
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
    set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
    set mouse=a           " enable mouse (selection, resizing windows)
    set nowrap            " nowrap by default
    set number            " Show line numbers
    set numberwidth=1     " Number of columns for showing the line number
    set smartcase         " use case sensitive if capital letter present or \C
    set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
    set tabstop=2         " Use 2 spaces for tabs.
    set expandtab         " insert tab with right amount of spacing
    set termguicolors     " enable true colors
    set visualbell        " visual bell for errros

    if has('persistent_undo')
      set undofile        " persistent undo between file reloads
    endif

    set splitbelow        " Open new split panes to the bottom
    set splitright        " Open new split panes to the bottom
" }}}

" Plugin Modifications --------------------------------------------------- {{{
  " ================================
  " coc.nvim default settings
  " ================================
    " if hidden is not set, TextEdit might fail.
    set hidden
    " Better display for messages
    set cmdheight=2
    " Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use U to show documentation in preview window
    nnoremap <silent> U :call <SID>show_documentation()<CR>

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    vmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  " ====================================
  " go.vim
  " ====================================
    " disable vim-go :GoDef short cut (gd)
    " this is handled by LanguageClient [LC]
    let g:go_def_mapping_enabled = 0

    " format with goimports instead of gofmt
    " This manages your imports and runs gofmt
    let g:go_fmt_command = "goimports"

  " ====================================
  " goyo.vim + limelight.vim
  " ====================================
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

  " ====================================
  " Neomake
  " ====================================
    "call neomake#configure#automake('w')

  " ====================================
  " Snippets (UltiSnips):
  " ====================================
  "  let g:UltiSnipsExpandTrigger="<tab>"
  "  let g:UltiSnipsListSnippets="<tab>"
  "  let g:UltiSnipsJumpForwardTrigger="<c-f>"
  "  let g:UltiSnipsJumpBackwardTrigger="<c-b>"

  " ====================================
  " Terraform
  " ====================================
    let g:terraform_fmt_on_save=1
" }}}

" Vim Script file settings --------------------------------------- {{{
  augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
  augroup END
" }}}

" UI Customizations ---------------------------------------------- {{{
  set background=dark
  colorscheme PaperColor
" }}}

" Auto Commands -------------------------------------------------- {{{
  autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy  " set groovy syntax for Jenkinsfiles
"  }}}

"  Key Mappings -------------------------------------------------- {{{
  " replace word under cursor, globally, with confirmation
    nnoremap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
    vnoremap <Leader>k y :%s/<C-r>"//gc<Left><Left><Left>

" }}}

" For Neovim ------------------------------------------------------ {{{
  " use neovim-remote (pip3 install neovim-remote) allows
  " opening a new split inside neovim instead of nesting
  " neovim processes for git commit
    let $GIT_EDITOR  = 'nvr -cc split --remote-wait +"setlocal bufhidden=delete"'
    let $EDITOR      = 'nvr -l'

  " interactive find replace preview
    set inccommand=nosplit

  " Navigate neovim + neovim terminal emulator with alt+direction
    tnoremap <c-h> <C-\><C-n><C-w>h
    tnoremap <c-j> <C-\><C-n><C-w>j
    tnoremap <c-k> <C-\><C-n><C-w>k
    tnoremap <c-l> <C-\><C-n><C-w>l

  " easily escape terminal
    tnoremap <leader><esc> <C-\><C-n><esc><cr>

  " quickly toggle term
    nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l
" }}}
