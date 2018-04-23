set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lambdalisue/vim-pyenv'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-git'
"Plugin 'wincent/command-t'
"Plugin 'mileszs/ack.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'fs111/pydoc.vim'
"Plugin 'alfredodeza/pytest.vim'
"Plugin 'reinh/vim-makegreen'
"Plugin 'vim-scripts/TaskList.vim'
"Plugin 'vim-scripts/The-NERD-tree'
"" Plugin 'garbas/vim-snipmate'
"Plugin 'tomtom/tlib_vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"" Plugin 'honza/vim-snippets'
"" Plugin 'lambdalisue/vim-python-virtualenv'
"Plugin 'klen/python-mode'
"Plugin 'vim-airline/vim-airline'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'ervandew/supertab'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-repeat'
"Plugin 'davidhalter/jedi-vim'
"" Plugin 'valloric/youcompleteme'
"Plugin 'SirVer/ultisnips'
"Plugin 'jmcomets/vim-pony'
"Plugin 'chase/vim-ansible-yaml'
"Plugin 'ap/vim-css-color'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'tpope/vim-markdown'
"Plugin 'suan/vim-instant-markdown'
call vundle#end()

" Force python version calls ahead of time
"let python_version = split(system('python --version'))[1]
"echo python_version
"let python_major_version = get(split(python_version, '\.'), 0, '0')
"if python_major_version == '3'
"	echo has('python3')
"else
"	echo has('python')
"endif

syntax on
filetype on
filetype indent plugin on
let mapleader=","
set hidden
set history=50
set hlsearch
set mouse=a
set showmatch
set textwidth=0
set wrap
set bs=indent,eol,start
