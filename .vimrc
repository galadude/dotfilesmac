set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" MY PLUGINS
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'R-MacVim'
Plugin 'jceb/vim-orgmode'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" search
set ignorecase

" appearance
set gfn=Monaco:h16
set scrolloff=999 " typewriter mode
set cursorline

" markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Make broken lines behave nicely
nnoremap k gk
nnoremap j gj

nnoremap 0 g0
nnoremap $ g$


" REQUIRED. jhis makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'Skim'

" general
filetype plugin indent on 

let mapleader = ","
" let maplocalleader = ","
set backspace=2
syntax on
set number
set hlsearch

" 1 tab == 2 spaces
set expandtab
set smarttab

set shiftwidth=2
set tabstop=2

set so=7

"" maps
map <space> /
map <c-space> ?
"map <leader> :noh<cr>
"
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
map <leader>1 <F5>
map <leader>2 <F7>

" bash like autocomplete
set wildmode=longest,list,full
set wildmenu

"" visual
"colorscheme desert

"" tabs shortcut
noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>

"" Encryption
set viminfo=
set cm=blowfish

