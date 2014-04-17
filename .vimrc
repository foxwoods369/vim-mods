filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype on
filetype plugin indent on
au filetype htmldjango filetype indent off
let mapleader=","

color ansi_blows

set ts=4
au filetype htmldjango set ts=2
au filetype css set ts=2
set shiftwidth=4
au filetype htmldjango set shiftwidth=2
au filetype css set shiftwidth=2
set nu!
au filetype python set expandtab
set smarttab
au filetype python set textwidth=119
set softtabstop=4
au filetype htmldjango set softtabstop=2
au filetype css set softtabstop=2
set shiftround
set autoindent
set foldmethod=indent
set foldlevel=99
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <c-g> :RopeGoToDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>a <Esc>:Ack!
au filetype python map <leader>dt :set makeprg=django-admin.py\ test\|:call MakeGreen()<CR>

" Execute the tests
au filetype python nmap <silent><Leader>tf <Esc>:Pytest file<CR>
au filetype python nmap <silent><Leader>tc <Esc>:Pytest class<CR>
au filetype python nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
au filetype python nmap <silent><Leader>tn <Esc>:Pytest next<CR>
au filetype python nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
au filetype python nmap <silent><Leader>te <Esc>:Pytest error<CR>

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline+=%{fugitive#statusline()}

let g:pep8_map='<leader>8'
let g:pyflakes_use_quickfix = 0
let g:CommandTCancelMap='<Esc>'

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabDefaultCompletionType="<c-n>"
set completeopt=menuone,longest,preview

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

augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
