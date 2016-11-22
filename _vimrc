set nocompatible              " be iMproved, required
filetype off                  " required

if has("win16") || has("win32") || has("win64")
  if &shell=~#'bash$'
    set shell=$COMSPEC " sets shell to correct path for cmd.exe
  endif
  set rtp+=~/Vim/vimfiles/bundle/Vundle.vim
  call vundle#begin('~/Vim/vimfiles/bundle/') 
elseif has ("unix")
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Code folding plugin
Plugin 'tmhedberg/SimpylFold'
" Auto-Indentation plugin
Plugin 'vim-scripts/indentpython.vim'
" Auto-complete plugin
Bundle 'Valloric/YouCompleteMe'
" Syntax Checking / Highlighting
Plugin 'scrooloose/syntastic'
" PEP8 Checking
Plugin 'nvie/vim-flake8'
" Material Hybrid
Plugin 'kristijanhusak/vim-hybrid-material'
" Solarized color-scheme
Plugin 'altercation/vim-colors-solarized'
" File Browsing Tree
Plugin 'scrooloose/nerdtree'
" NerdTree Tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Super search plugin
Plugin 'kien/ctrlp.vim'
" Powerline plugin
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

"Settings

"Splitting Windows (:sv for vertical split, :vs for horizontal split)
set splitbelow
set splitright

"Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

"Enable code folding with spacebar
nnoremap <space> za

"Add PEP8 indentation for python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Indentation for other file types
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"Flag unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF8 Support
set encoding=utf-8

"YouCompleteMe Settings
let g:ycm_autoclose_preview_window_after_completion=1

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"Syntax checking enabling
let python_highlight_all=1
syntax on

"Color-Scheme
set background=dark
colorscheme hybrid_material

"NerdTree Settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"Basic Settings
set nu "Line numbers
set clipboard=unnamed "Share clipboard with OS

