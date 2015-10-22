
"""
""" Vundle Set up
"""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" MY PLUGINS
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'benmills/vimux'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'jalvesaq/R-Vim-runtime'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""
""" My Functions
"""

" Vimux fun
function! MyRSource()
  normal :w 
  call VimuxOpenRunner()
  call VimuxSendText("source('")
  call VimuxSendText(@%)
  call VimuxSendText("')")
  call VimuxSendKeys('enter')
endfunction

function! MyRLine()
  call VimuxOpenRunner()
  normal "kyy
  call VimuxSendText(@k)
endfunction

function! MyRSelection()
  call VimuxOpenRunner()
  let ourcode = split(@k, "\n")
  let n = len(ourcode)
  let i = 0
  while i < n
    call VimuxSendText(ourcode[i])
    call VimuxSendKeys('enter')
    let i += 1
  endwhile
endfunction

"""
""" MAPS
"""

""" My leader maps
let mapleader = ","
let maplocalleader = "<"

""" My command line mode maps
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

""" buffer maps
cnoremap wbn :w<cr>:bn

""" My operators

""" My general maps
ino <C-l> <esc>
nmap <leader>0 :source $MYVIMRC<cr>:echo 'vimrc sourced'<cr>

""" My navigation maps
no k gk
no j gj
no 0 g0
no ½ g$

""" My searching maps (very magic)
no <space> /\v
no <C-space> ?\v

map <leader>h :nohl<cr>
vno <leader>r "hy:%s/\v<C-r>h//gc<left><left><left>
vno <leader>g "hy:g/\v<C-r>h/

" VIMUX MAPS
vno <leader>l "ky:call MyRSelection()<cr>
nno <leader>l :call MyRLine()<cr>j
map! <leader>l :call MyRLine()<cr>j
nno <leader><leader> :call MyRSource()<cr>
nno <leader>c :call VimuxRunCommand("")<left><left>

"""
""" GENERAL SETTINGS
"""

""" My search
set ignorecase
set hlsearch
set incsearch

""" My appearance
set number
syntax on

set scrolloff=999 " typewriter mode
set cursorline
"set gfn=Monaco:h16

set t_Co=256 " set 256 colors
colorscheme molokai

""" My encoding
set enc=utf-8
set fileencoding=utf-8

""" My tab and backspace
set expandtab
set smarttab

set shiftwidth=2
set tabstop=2

set so=3 " margin on top and bottom
set wildmode=longest,list,full " bash like autocomplete
set backspace=2

""" My misc
set noswapfile
au BufRead,BufNewFile *.md set filetype=markdown

""" My Latex
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'Skim'



