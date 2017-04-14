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
" YouCompleteMe Autocomplete
Bundle 'Valloric/YouCompleteMe'
" Syntax Checking / Highlighting
Plugin 'scrooloose/syntastic'
" PEP8 Checking
Plugin 'nvie/vim-flake8'
" Material Hybrid
Plugin 'kristijanhusak/vim-hybrid-material'
" Solarized color-scheme
Plugin 'altercation/vim-colors-solarized'
" PaperColor color-scheme
Plugin 'NLKNguyen/papercolor-theme'
"Python syntax highlighting
Plugin 'hdima/python-syntax'
" File Browsing Tree
Plugin 'scrooloose/nerdtree'
" NerdTree Tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Git-Gprep
Plugin 'tjennings/git-grep-vim'
" Super search plugin
Plugin 'kien/ctrlp.vim'
" VirtualEnv
Plugin 'jmcantrell/vim-virtualenv'
" Vim-Fugitive Plugin
Plugin 'tpope/vim-fugitive'
" Robot Framework Plugin
Plugin 'mfukar/robotframework-vim'
" Go vim plugin
Plugin 'fatih/vim-go'
" Html / CSS plugin
Plugin 'othree/html5.vim'
" HTML Match Tag
Plugin 'gregsexton/MatchTag'
" Powerline plugin
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
if has("win16") || has("win32") || has("win64")
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
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

"Basic Settings
set nu "Line numbers
set clipboard=unnamed "Share clipboard with OS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noswapfile
set guicursor+=a:blinkon0

if has("win16") || has("win32") || has("win64")
	set guifont=Inconsolata\ for\ Powerline:h12
else
	set guifont=Inconsolata\ for\ Powerline:h15
endif

"Enable backspace
set backspace=indent,eol,start

"Splitting Windows (:sv for vertical split, :vs for horizontal split)
set splitbelow
set splitright

"Enable commenting multiple lines
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

"Visual Mode Tabbing
vmap <Tab> >gv
vmap <S-Tab> <gv

"Visual Mode Yanking (Copy) and keep selection
vmap y y<Esc>gv

"Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Tab Navigation
nnoremap <C-Left> <Esc>:tabprev<CR>
nnoremap <C-Right> <Esc>:tabnext<CR>

"Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

"Enable code folding with spacebar
nnoremap <space> za

"Add PEP8 indentation for python
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
	\ set colorcolumn=80,90 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Robot framework format
au BufNewFile,BufRead *.robot
	\ let g:robot_syntax_for_txt=1 |
	\ imap <Tab> <space><space><space> |
	\ set tabstop=4 |
	\ set shiftwidth=4 |
	\ set colorcolumn=90 |

" HTML format
au BufNewFile,BufRead *.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Javascript format
au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
	
" Yaml format
au BufNewFile,BufRead *.yaml
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |

" CSS format
au BufNewFile,BufRead *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" SCSS format
au BufNewFile,BufRead *.scss
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Indentation for other file types
au BufNewFile,BufRead *.lua, *.xml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 

"UTF8 Support
set encoding=utf-8

"YouCompleteMe Settings
let g:ycm_autoclose_preview_window_after_completion=1

"Syntax checking enabling
let python_highlight_all=1
syntax on

"Color-Scheme
set background=dark
colorscheme hybrid_material

"Material-Color-Scheme Option
let g:enable_bold_font = 1

"Ggrep key mappings
autocmd QuickFixCmdPost *grep* cwindow

"Vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"NerdTree Settings
nnoremap <S-Space> <Nop>
nnoremap <C-Space> <Nop>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeMapOpenInTab='<C-Space>' "Open in new tab
let NERDTreeMapActivateNode='<Space>' "Open / Go-to directory
let NERDTreeMapOpenVSplit='<S-Space>' "Open with vertical split
let NERDTreeShowHidden=1
