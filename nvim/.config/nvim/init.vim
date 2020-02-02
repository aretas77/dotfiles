call plug#begin('~/.local/share/nvim/plugged')
    Plug 'davidhalter/jedi-vim'
    " UI related
	Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Better Visual Guide
    Plug 'Yggdroot/indentLine'

    " Formater
    Plug 'Chiel92/vim-autoformat'

    " Autocomplete
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

	Plug 'scrooloose/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'

    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'

	Plug 'airblade/vim-gitgutter'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'dense-analysis/ale'
call plug#end()

filetype plugin indent on

" True Color Support if it's avaiable in terminal
if has("termguicolors")
 "   set termguicolors
endif

" path to your python 
let g:python3_host_prog = '/usr/bin/python3'

" UI configuration
syntax on
syntax enable

" colorscheme
"let base16colorspace=256
"colorscheme base16-gruvbox-dark-hard
colorscheme gruvbox
set background=dark

set number
"set relativenumber

" Search configuration
set ignorecase
set smartcase
set incsearch

set cursorline
set nolazyredraw
set hidden

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" vim-autoformat
" noremap <F3> :Autoformat<CR>

set synmaxcol=1000

" NCM2
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
  let ncm2#popup_delay = 5
  let ncm2#complete_length = [[1, 1]]
  let g:ncm2#matcher = 'substrfuzzy'
augroup END

set laststatus=2  " always slow statusline

set noerrorbells
set visualbell

" easy split movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tabs:
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Disable Jedi-vim autocompletion and enable call-signatures options
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"


" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
