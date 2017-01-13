runtime! debian.vim
set compatible

if has("syntax")
      syntax on
endif

set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd      " Show (partial) command in status line.
"set showmatch        " Show matching brackets.
"set ignorecase       " Do case insensitive matching
"set smartcase        " Do smart case matching
"set incsearch        " Incremental search
"set autowrite        " Automatically save before commands like :next and :make
"set hidden       " Hide buffers when they are abandoned
"set mouse=a      " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" ================================================
"            personal configuration
" ================================================
set tabstop=4
set shiftwidth=4
set number
set smarttab
set backspace=indent,eol,start
set expandtab      "use space substitute tab
set encoding=utf-8
set autoindent
set smartindent
set laststatus=2   "config airline
set t_Co=256       "force vim into 256 color mode


"Enable emmet for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"key mapping
let g:user_emmet_expandabbr_key = '<Tab>'

"Add airline symbols
"let g:airline_powerline_fonts = 1
"enable airline-branch
"let g:airline#extensions#branch#enabled = 1
"enable airline-tagbar
"let g:airline#extensions#tagbar#enabled = 1

"Vim-Indent-guides Config
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

map <F3> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

"Add Any Cscope Database in current dir
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

"==========================================
"       VIM Plugins Configuration
"==========================================
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, equired!
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
"Original repos on GitHub
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'tpope/vim-rails.git'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'bling/vim-airline'
Plugin 'Chiel92/vim-autoformat'
Plugin 'majutsushi/tagbar'
"Plugin 'SirVer/ultisnips'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'altercation/vim-colors-solarized'

"-------------------------------------------
" vim-scripts repos
"Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'ctags.vim'
"Plugin 'taglist.vim'

"-------------------------------------------
" non-GitHub repos
"Plugin 'git://git.wincent.com/command-t.git'


" Git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///Users/gmarik/path/to/plugin'

call vundle#end()             " required!
filetype plugin indent on     " required!

" Vundle Usage:
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
