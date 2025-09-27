" .vimrc
" 
" Chaosbengel's custom vim configuration

" We don't want to be compatible. Better safe than sorry,
" but this is only needed when used as a system wide config.
set nocompatible

" Set filetype off to let plugins do their stuff
filetype off

" Initialize vundle plugin manager
" Need to be installed: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Don't remove, required for vundle function
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/Nerdtree'
Plugin 'dense-analysis/ale'
" Add plugins here! I am not comfortable with automatically pulling 3rd party
" git repos, so I pull manually and include them from a directory. But, ist
" is possible to use repos directly. If you want to do this, read vundle docs!

" Nerdtree file explorer
" https://github.com/preservim/nerdtree
"Plugin 'file:///home/chaosbengel/.vim/plugins_upstream/nerdtree'

" ALE for syntax checking and linting
"Plugin 'file:///home/chaosbengel/.vim/plugins_upstream/ale'

" Required, Plugin stuff MUST be done before this!
call vundle#end() 


" Set filetype, loading of filetype plugins and indent files
filetype plugin indent on

" Who the fuck does not want syntax highlighting?!
syntax on

" Line numbering is cool, too!
set number

" Never assume the right encoding, set it explicitly!
set encoding=utf-8

" Wrap text that extends screen length
set wrap

" I like the visual bell.
set visualbell

" But turn off annoying flickering
set noerrorbells

" Expand tabs with x spaces
set expandtab
set tabstop=4
set softtabstop=4
" Expand tabs in indents with x spaces
set shiftwidth=4

" Show x lines after cursor
set scrolloff=5

" Fix backspace problems
set backspace=indent,eol,start

" Allow hidden buffers
set hidden

" Enable fast rendering, useful when scrolling
set ttyfast

" Always show status bar
set laststatus=2

" Show what mode we're in
set showmode

" Show command in last line
set showcmd

" Highlight search results
set hlsearch

" Highlight results during typing
set incsearch

" Search caseinsensitive
set ignorecase

" .... unless search string contains uppercase
set smartcase

" Highlight matching brackets
set showmatch

" Set color & darkmode
set t_Co=256
set background=dark

" Keybinds

" CTRL-t: Toggle NERDTree Window
nnoremap <C-t> :NERDTreeToggle<CR>

" CTRL-f: Open NERDTree at open file in tree
nnoremap <C-f> :NERDTreeFind<CR>

" CTRL-g: Open LazyGit
nnoremap <C-g> :!lazygit<CR><CR>

" ALE Configuraion

" Only run linters explicitly configures
let g:ale_linters_expolicit = 1

let g:ale_linters = {
\    'sh': ['shellcheck']
\}

" Set colors
highlight ALEWarning guibg=Yellow
highlight ALEError guibg=Red

" Enable ALE integrated completition
let g:ale_completition_enabled = 1
