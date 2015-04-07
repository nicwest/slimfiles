" vim:fdm=marker

set nocompatible
filetype plugin indent on

" Config{{{1
let g:nicwest_remote = 1
let g:nicwest_os = 'linux'

" Colors: {{{1
syntax enable
set background=dark
colorscheme elflord
hi Pmenu ctermfg=15
hi PmenuSel ctermfg=15
hi Folded ctermbg=8

" Settings: {{{1

set number relativenumber          " both types of line number
set cursorline                     " so I can see where I am

set tabstop=4                      " sanity things
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set encoding=utf-8
set hidden                         " hides buffers when they leave windows

set colorcolumn=80
set scrolloff=3
set showmode                       " show insert/visual mode
set wildmenu                       " Ex completion menu
set wildmode=longest:full,full

set novisualbell                   " only audio bell
set ttyfast                        " not on an old computer

set showbreak=>                    " denotes an artifical linebreak
set iskeyword-=_                   " underscore is a word boundry
set linebreak                      " break lines in sensible locations

set noundofile                     " all of these off so I don't littler files
set nobackup                       " all over the place
set noswapfile

set ignorecase                     " search settings
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Key Binds: {{{1
"jump to opersite character pair
nnoremap <tab> %
vnoremap <tab> %
" reselect previous block when indenting
vnoremap < <V`]
vnoremap > >V`]
" Y is to y what D is to d
nnoremap Y y$
" x maps to null buffer
nnoremap x "_x
xnoremap x "_x
nnoremap cx xp
" show buffer numbers
nnoremap <c-b> :buffers<CR>
" I like regex, but not this much 
nnoremap L $
nnoremap H ^
vmap L $
vmap H ^
omap L $
omap H ^
" replay macro in q register
nnoremap Q @q
vnoremap Q @q
" explore files
nnoremap - :Explore<CR>
"window movements
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Leader {{{1
let mapleader = "\<Space>"
" clear searches
nnoremap <leader><BS> :noh<cr>
" writefiles
nnoremap <Leader>w :w<CR>
" swap to alternate buffer
nnoremap <leader><Tab> <C-^>
" Put under/put over will keep formatting
nnoremap <silent> <leader>pu :pu<CR>`[=`]
nnoremap <silent> <leader>po :pu!<CR>`[=`]
" fold toggle
nnoremap <leader><leader> za

" Autocmds: {{{1
aug markdown
  au!
  au BufNewFile,BufRead *.md set filetype=markdown
  au FileType markdown setlocal spell
aug END

aug twospaces
  au!
  au FileType html,htmldjango,javascript,css,scss,vim,yaml,yml
        \ setlocal ts=2 sts=2 sw=2
aug END

" Commands: {{{1
command! -bang Fuck if "<bang>" == "!" |
      \ execute 'w !sudo tee > /dev/null %' |
      \ echohl WarningMsg |
      \ echo 'PEWPEW! SUDO!' |
      \ echohl None |
      \ endif
