set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lambdalisue/vim-pyenv'
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
"" Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
"" Plugin 'lambdalisue/vim-python-virtualenv'
Plugin 'vim-airline/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-repeat'
Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'
"Plugin 'valloric/youcompleteme'
Plugin 'SirVer/ultisnips'
Plugin 'jmcomets/vim-pony'
Plugin 'chase/vim-ansible-yaml'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-markdown'
Plugin 'suan/vim-instant-markdown'
call vundle#end()

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


set background=dark
color skyler_blows

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

autocmd BufNewFile,BufRead *.yml set filetype=ansible

set ts=4
au filetype css set ts=2
au filetype scss set ts=2
au filetype html set ts=2
au filetype htmldjango set ts=2
au filetype javascript set ts=2
set shiftwidth=4
au filetype css set shiftwidth=2
au filetype scss set shiftwidth=2
au filetype html set shiftwidth=2
au filetype htmldjango set shiftwidth=2
au filetype javascript set shiftwidth=2
set nu!
au filetype css set expandtab
au filetype scss set expandtab
au filetype python set expandtab
au filetype html set expandtab
au filetype htmldjango set expandtab
au filetype javascript set expandtab
set smarttab
au filetype python set textwidth=119
set softtabstop=4
au filetype css set softtabstop=2
au filetype scss set softtabstop=2
au filetype html set softtabstop=2
au filetype htmldjango set softtabstop=2
au filetype javascript set softtabstop=2
set shiftround
set autoindent

set foldmethod=indent
set foldlevel=99
set foldcolumn=5
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>tl <Plug>TaskList
map <leader>u :GundoToggle<CR>
map <leader>tt :NERDTreeToggle<CR>
map <leader>a <Esc>:Ack!

set tags=./tags;$HOME

" let g:gundo_prefer_python3 = 1

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

" Set shells so pyenv can call out to the system
set shellpipe=2>&1\|\ tee
set shellredir=>%s\ 2>&1

let python_major_version = pyenv#python#get_internal_major_version()
if python_major_version == 3
	let g:UltiSnipsUsePythonVersion = 3
	let g:pymode_python='python3'
else
	let g:UltiSnipsUsePythonVersion = 2
	let g:pymode_python='python'
endif

let g:jedi#use_tabs_not_buffers=0
if jedi#init_python()
	function! s:jedi_auto_force_py_version() abort
		let python_major_version = pyenv#python#get_internal_major_version()
		let g:jedi#force_py_version = python_major_version
	endfunction
	augroup vim-pyenv-custom-augroup
		autocmd! *
		autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
		autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
	augroup END
endif

au FileType python set omnifunc=jedi#completions
let g:SuperTabDefaultCompletionType="<C-n>"
let g:SuperTabClosePreviewOnPopupClose=1
let g:SuperTabCrMapping = 0
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menuone,longest,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"YCM Completion
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_seed_identifers_with_syntax = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1 
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"nnoremap <leader>g :YcmCompleter GoTo<CR>

let g:UltiSnipsExpandTrigger       ='<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsListSnippets = '<c-e>'
"let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
autocmd BufReadPost *.py call SyntasticCheck()

nnoremap <leader>8 :PymodeLint<CR>
let g:pymode_folding=0
let g:pymode_lint=0
let g:pymode_options_max_line_length=120
let g:pymode_rope=0

let g:syntastic_python_checkers=['python', 'pyflakes', 'pep8', 'flake8']
let g:syntastic_python_pylint_post_args='--max-line-length=120'
let g:syntastic_html_checkers=['tidy']
let g:syntastic_html_tidy_exec='tidy5'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF

nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

nnoremap Q <nop>
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Deletes buffers
map <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Foundation
map <leader>fb :!foundation build<CR>

set laststatus=2
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
let g:airline_powerline_fonts=1
set fillchars+=stl:\ ,stlnc:\

" set guifont=Monospace
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" open/refresh in firefox
nnoremap <leader>ff :exec ':silent !firefox % &'<CR>:redraw!<CR>

let g:ffrefresh = 1

nnoremap <leader>fd :call FirefoxRefreshToggle()<CR>

function! FirefoxRefreshToggle()
  if g:ffrefresh
    let g:ffrefresh = 0
  else
    let g:ffrefresh = 1
  endif
endfunction

autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox_if_modified()
function! Refresh_firefox_if_modified()
  if &modified && g:ffrefresh
    write
    call Refresh_firefox()
  endif
endfunction

function! Refresh_firefox()
  silent !echo 'vimYo = content.window.pageYOffset;
              \ vimXo = content.window.pageXOffset;
              \ BrowserReload();
              \ content.window.scrollTo(vimXo,vimYo);
              \ repl.quit();' |
              \ nc -w 1 localhost 4242 2>&1 > /dev/null
  :redraw!
endfunction

command! -nargs=1 Repl silent !echo
      \ "repl.home();
      \ content.location.href = '<args>';
      \ repl.enter(content);
      \ repl.quit();" |
      \ nc localhost 4242

nmap <leader>mh :Repl http://
" mnemonic is MozRepl Http
nmap <silent> <leader>ml :Repl file:///%:p<CR>
" mnemonic is MozRepl Local
nmap <silent> <leader>md :Repl http://localhost/
" mnemonic is MozRepl Development

nnoremap <silent> <c-f><c-j> :call Firefox_scroll_down()<cr>
function! Firefox_scroll_down()
  silent call system("echo 'content.window.scrollByPages(1); repl.quit();' | nc -w 1 localhost 4242")
endfunction

nnoremap <silent> <c-f><c-k> :call Firefox_scroll_up()<cr>
function! Firefox_scroll_up()
  silent call system("echo 'content.window.scrollByPages(-1); repl.quit();' | nc -w 1 localhost 4242")
endfunction

nnoremap <c-f><c-l> :call Firefox_next_tab()<cr>
function! Firefox_next_tab()
  silent call system("echo 'var tabc = window.getBrowser().tabContainer; var tabs = tabc.childNodes; var index = tabc.selectedIndex; if (index !== tabs.length - 1) { tabc.selectedItem = tabs[index + 1]; } else { tabc.selectedItem = tabs[0]; } repl.quit()' | nc -w 1 localhost 4242")
endfunction

nnoremap <c-f><c-h> :call Firefox_prev_tab()<cr>
function! Firefox_prev_tab()
  silent call system("echo 'var tabc = window.getBrowser().tabContainer; var tabs = tabc.childNodes; var index = tabc.selectedIndex; if (index === 0) { tabc.selectedItem = tabs[tabs.length - 1]; } else { tabc.selectedItem = tabs[index - 1]; } repl.quit()' | nc -w 1 localhost 4242")
endfunction

nnoremap <c-f><c-w> :call Firefox_close_tab()<cr>
function! Firefox_close_tab()
  silent call system("echo 'var tabc = window.getBrowser().tabContainer; var tabs = tabc.childNodes; var index = tabc.selectedIndex; window.getBrowser().removeTab(tabs[index]); repl.quit()' | nc -w 1 localhost 4242")
endfunction

nnoremap <c-f><c-i> :call Firefox_prev_window()<cr>
function! Firefox_prev_window()
	silent call system("FOCUSID=`xdotool getwindowfocus`; echo 'var windows = Array.from(this.browserWindows()); var index = !this.windowIndex ? 0 : this.windowIndex; if (index === 0) { index = windows.length - 1; } else { index = index - 1; }  windows[index].focus(); this.windowIndex = index; repl.quit()' | nc -w 1 localhost 4242; sleep 0.5; DESKTOP=`xdotool get_desktop_for_window $FOCUSID`; xdotool set_desktop $DESKTOP; xdotool windowfocus --sync $FOCUSID")
endfunction

nnoremap <c-f><c-o> :call Firefox_next_window()<cr>
function! Firefox_next_window()
	silent call system("FOCUSID=`xdotool getwindowfocus`; echo 'var windows = Array.from(this.browserWindows()); var index = !this.windowIndex ? 0 : this.windowIndex; if (index === windows.length - 1) { index = 0; } else { index = index + 1; }  windows[index].focus(); this.windowIndex = index; repl.quit()' | nc -w 1 localhost 4242; sleep 0.5; DESKTOP=`xdotool get_desktop_for_window $FOCUSID`; xdotool set_desktop $DESKTOP; xdotool windowfocus --sync $FOCUSID")
endfunction

nnoremap <c-f><c-r> :call Refresh_firefox()<cr>

" open/refresh in firefox
nnoremap <leader>ff :call Firefox_open_current_file()<cr>
function! Firefox_open_current_file()
  let focusid = system("xdotool getwindowfocus")
  :exec ':silent !firefox % &'
  :redraw!
  sleep 500m
  silent call system("xdotool windowfocus --sync " . focusid)
endfunction

autocmd VimEnter * redraw!
