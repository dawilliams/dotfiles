" For this method of minpac to work, this file must reloadable
" See https://github.com/k-takata/minpac#load-minpac-on-demand for more
" details.

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('AndrewRadev/splitjoin.vim')
  call minpac#add('Glench/Vim-Jinja2-Syntax')
  call minpac#add('NLKNguyen/papercolor-theme')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('chr4/nginx.vim')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('fatih/vim-go', {'do': 'GoUpdateBinaries'})
  call minpac#add('iamcco/markdown-preview.nvim', { 'do': '!cd app & yarn install'})
  call minpac#add('junegunn/fzf', {'do': '!./install --bin'})
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('kassio/neoterm')
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('rhysd/vim-clang-format')
  call minpac#add('sebdah/vim-delve')
  call minpac#add('tpope/vim-dotenv')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-vinegar')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('tyru/open-browser-github.vim')
  "call minpac#add('uarun/vim-protobuf')
endif

" Behavior Modification ---------------------------------------  {{{
"" Don't restate NeoVim defaults.
"" See :help nvim-defaults for more info
    let mapleader=","       " set leader key

    set autowrite           " save changes to file while closing it. Also used in vim-go
    set expandtab           " insert tab with right amount of spacing
    set list                " show invisible characters
    set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
    set shiftwidth=2        " Number of spaces to use for each step of (auto)indent.
    set splitright          " Open new split panes to the right
    set splitbelow          " Open new split panes to the bottom
    set tabstop=2           " Use 2 spaces for tabs.
    set visualbell          " flash screen instead of beep sound on errors

    if has('termguicolors')
      let g:base16colorspace=256
    endif

    if has('persistent_undo')
      set undofile          " persistent undo between file reloads
    endif
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
  " fzf.vim
  " ====================================
    " do not use fzf built-in Rg command since it also searches within filenames.
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
            \ 'rg --column --line-number --no-ignore-vcs --hidden '
              \ . '--smart-case --no-heading --color=always '
              \ . shellescape(<q-args>),
            \ 1,
            \ {'options':  '--delimiter : --nth 4..'},
            \ 0)

  " ====================================
  " go.vim
  " ====================================
    " disable vim-go :GoDef short cut (gd)
    " this is handled by LanguageClient [LC]
    let g:go_def_mapping_enabled = 0

    " format with goimports instead of gofmt
    " This manages your imports and runs gofmt
    let g:go_fmt_command = "goimports"

    " run :GoBuild or :GoTestCompile based on go file
    function! s:build_go_files()
      let l:file = expand('%')
      if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
      elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
      endif
    endfunction

    augroup golang
      autocmd!
      autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
      autocmd FileType go setlocal foldmethod=syntax
      autocmd Filetype go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
      autocmd Filetype go nmap <leader>c :<C-u>GoCoverageToggle<CR>
      autocmd Filetype go nmap <leader>r :<C-u>GoRun<CR>
      autocmd Filetype go nmap <leader>t :<C-u>GoTest<CR>
    augroup END
" }}}

" Vim Script file settings --------------------------------------- {{{
    augroup filetype_vim
      autocmd!
      autocmd FileType vim setlocal foldmethod=marker
    augroup END
" }}}

" UI Customizations ---------------------------------------------- {{{
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
" }}}

" Auto Commands -------------------------------------------------- {{{
  autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy  " set groovy syntax for Jenkinsfiles
  autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')  " Create directory b4 writing file if it doesn't exist
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  " ts - show existing tab with 4 spaces width
  " sw - when indenting with '>', use 4 spaces width
  " sts - control <tab> and <bs> keys to match tabstop
"  }}}

" Commands ------------------------------------------------------- {{{
  command! PackClean packadd minpac | source $MYVIMRC | call minpac#clean()
  command! -nargs=1 -complete=custom,Packlist
        \ PackOpenUrl packadd minpac | source $MYVIMRC | call openbrowser#open(
        \    minpac#getpluginfo(<q-args>).url)
  command! PackStatus packadd minpac | source $MYVIMRC |call minpac#status()
  command! PackUpdate packadd minpac | source $MYVIMRC |call minpac#update('', {'do': 'call minpac#status()'})
"  }}}

"  Key Mappings -------------------------------------------------- {{{
  nnoremap <C-p> :<C-u>FZF<CR>
" }}}

" For Neovim ------------------------------------------------------ {{{
  if has('nvim') && executable('nvr')
    let $VISUAL = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif

  " Navigate neovim + neovim terminal emulator with alt+direction
    tnoremap <c-h> <C-\><C-n><C-w>h
    tnoremap <c-j> <C-\><C-n><C-w>j
    tnoremap <c-k> <C-\><C-n><C-w>k
    tnoremap <c-l> <C-\><C-n><C-w>l

  " easily escape terminal
    tnoremap <leader><esc> <C-\><C-n><esc><cr>

  " quickly toggle terminal
    nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l
" }}}
