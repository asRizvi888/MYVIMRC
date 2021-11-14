set nocompatible
set nu
set rnu
set autoread
set mouse+=a
set autochdir
set guicursor=
set showtabline=5
set scl=yes
set guifont="FiraCode NF"\ 13
set complete+=kspell
set completeopt+=menuone,longest,preview,menu
set wildmenu
set colorcolumn=100
set background=dark
set cursorline
set fdm=indent
set nofoldenable
set smartindent
set ai
set incsearch
set laststatus=2
set shiftwidth=4
set ma
set tabstop=4
set nowrap
set noswapfile
set scrolloff=5
set noerrorbells
set encoding=UTF-8

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()

colorscheme gruvbox
"let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'soft'
"autocmd VimEnter * hi Normal ctermbg=none

nnoremap <C-o> :NERDTreeToggle<CR>

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

syntax on
filetype plugin on
filetype indent on
" Documentation on hover

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  	au WinLeave * setlocal nocursorline
augroup END

"mappings
let mapleader = ","

nnoremap vv <c-v>
nmap <C-v> <esc>gP
nmap <C-a> <esc>ggVG<CR>
nmap <C-c> <esc>:y+<CR>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" tab management
nmap <C-t> :tabnew!<CR>
nmap <C-n> :tabnext<CR>
nmap <C-p> :tabprevious<CR>
nmap <C-k> :tabclose!<CR>
nmap <C-b> :bu  
nmap <C-z> :qa!<CR>

"Toggle Lexplore with Ctrl-O

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3

au FileType netrw set scl=no

function! ToggleVExplorer()
	Lexplore
    vertical resize 30
endfunction
"nmap <C-O> :call ToggleVExplorer()<CR>
"Toggle Terminal

function! ToggleVTrem()
	vertical botright term
    vertical resize 45
endfunction 
nmap <C-L> 		:call ToggleVTrem()<CR>

function! ToggleBterm()
	bel term
  	resize 10
endfunction 
nmap <C-H> 		:call ToggleBterm()<CR>

nmap <C-left> 	:vertical resize -2 <CR>
nmap <C-right> 	:vertical resize +2 <CR>
nmap <C-up> 	:resize -2 <CR>
nmap <C-down> 	:resize +2 <CR>

"compiler(s)
autocmd filetype cpp 		nmap <buffer> <f9> :w<bar>!g++ % -o %:r  && ./%:r<CR>
autocmd filetype c 			nmap <buffer> <f9> :w<bar>!gcc % -o %:r  && ./%:r<CR>
autocmd filetype java 		nmap <buffer> <f9> :w<bar>!java %<CR>
autocmd filetype java 		nmap <buffer> <f5> :w<bar>!javac % && java %:r<CR>
autocmd filetype javascript nmap <buffer> <f9> :w<bar>!node %<CR>
autocmd filetype typescript nmap <buffer> <f9> :w<bar>!ts-node %<CR>
autocmd filetype python 	nmap <buffer> <f9> :w<bar>!python3 %<CR>
autocmd filetype cpp 		nmap <buffer> <f4> :w<bar>!g++ % -o %:r  && ./%:r < "in_"%:r <CR>
autocmd filetype cpp 		nmap <buffer> <f5> :w<bar>!g++ % -o %:r  && ./%:r <

autocmd filetype vim		nmap <f9> :w!<bar>so %<CR>

"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"auto completion
au filetype c 	   			setl ofu=ccomplete#CompleteC
au filetype python 			setl ofu=python3complete#Complete
au filetype java   			setl ofu=javacomplete#CompleteJava
au filetype javasCRipt 		setl ofu=javascriptcomplete#CompleteJS
au filetype cpp 			setl ofu=cppcomplete#CompleteCPP

autocmd FileType html 		set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css 		set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml 		set omnifunc=xmlcomplete#CompleteTags

"tabline:
"+----------------------------------------------------------+
"|To enable powerline install Airline with the command below|
"|sudo apt-get install airline				    			|
"|If not, then comment the lines below						|
"+----------------------------------------------------------+

let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 2                                                                                                    
let g:airline_section_b = '%{getcwd()}' 				" in section b of the status line display the cwd
let g:airline#extensions#tabline#enabled = 2           	" enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 1 	" remove 'x' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = 'tabs'   	" can put text here like buffers to denote buffers (i clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = 'buffers'    " can put text here like tabs to denote tabs (i clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       	" disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 1    	" dont show tab numberson the right
let g:airline#extensions#tabline#show_buffers = 0     	" dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 1     	" minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0     	" disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 0     	" disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0   	" disables the weird ornage arrow on the tabline
