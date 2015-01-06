set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-git'
Plugin 'wincent/command-t'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'fs111/pydoc.vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'reinh/vim-makegreen'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
Plugin 'lambdalisue/vim-python-virtualenv'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-repeat'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

syntax on
filetype on
filetype indent plugin on
let mapleader=","

color ansi_blows

set ts=4
au filetype html set ts=2
au filetype htmldjango set ts=2
au filetype javascript set ts=2
set shiftwidth=4
au filetype html set shiftwidth=2
au filetype htmldjango set shiftwidth=2
au filetype javascript set shiftwidth=2
set nu!
au filetype python set expandtab
au filetype html set expandtab
au filetype htmldjango set expandtab
au filetype javascript set expandtab
set smarttab
au filetype python set textwidth=119
set softtabstop=4
au filetype html set softtabstop=2
au filetype htmldjango set softtabstop=2
au filetype javascript set softtabstop=2
set shiftround
set autoindent
set foldmethod=indent
set foldlevel=99

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>td <Plug>TaskList
map <leader>u :GundoToggle<CR>
map <leader>tt :NERDTreeToggle<CR>
map <leader>a <Esc>:Ack!

let g:pep8_map='<leader>8'
au filetype python map <leader>dt :set makeprg=django-admin.py\ test\|:call MakeGreen()<CR>

" Execute the tests
au filetype python nmap <silent><Leader>tf <Esc>:Pytest file<CR>
au filetype python nmap <silent><Leader>tc <Esc>:Pytest class<CR>
au filetype python nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
au filetype python nmap <silent><Leader>tn <Esc>:Pytest next<CR>
au filetype python nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
au filetype python nmap <silent><Leader>te <Esc>:Pytest error<CR>

let g:CommandTCancelMap='<Esc>'

let g:jedi#use_tabs_not_buffers=0

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabClosePreviewOnPopupClose=1
set completeopt=menuone,longest,preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd BufReadPost *.py call SyntasticCheck()

let g:pymode_folding=0
let g:pymode_lint_checkers=['pylint', 'pyflakes', 'pep8', 'mccabe']
let g:pymode_rope=0
let g:syntastic_python_checkers=['python', 'pyflakes', 'pep8', 'flake8']

py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

nnoremap Q <nop>
nnoremap <silent> <Leader>/ :nohlsearch<CR>

set laststatus=2
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
let g:airline_powerline_fonts=1
set fillchars+=stl:\ ,stlnc:\

augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
