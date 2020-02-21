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

" path to your python 
let g:python3_host_prog = '/usr/bin/python3'

" UI configuration
syntax on
syntax enable

"----------------------------------------------
" General settings
"----------------------------------------------

" colorscheme
colorscheme gruvbox
set background=dark

set autoindent                      " take indent for new line from previous line
set list                            " show trailing whitespace
set number

" Search options
set ignorecase
set smartcase                       " case-sensitive if expression contains a capital letter
set incsearch
set hlsearch
set nolazyredraw

set cursorline
set hidden
set title

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2                    " always slow statusline
set colorcolumn=80                  " show column line at 80 chars

" Error bells
set noerrorbells
set novisualbell

set synmaxcol=1000
set updatetime=100



"----------------------------------------------
" Python
"----------------------------------------------

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

nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Disable Jedi-vim autocompletion and enable call-signatures options
"let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
"let g:jedi#popup_on_dot = 0
"let g:jedi#completions_command = ""
"let g:jedi#show_call_signatures = "1"

"go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1

let g:deoplete#enable_at_startup = 1
let g:go_def_mode = "gopls"
let g:go_info_mode='gopls'
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
