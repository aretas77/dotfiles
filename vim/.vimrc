" ----------------------- vundle BEGIN -------------------------
set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'rhysd/vim-clang-format'
	Plugin 'kana/vim-operator-user'
	Plugin 'bling/vim-airline'
	Plugin 'tpope/vim-fugitive'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'morhetz/gruvbox'
	Plugin 'dylanaraps/wal.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" reloading vimrc: :so %
colorscheme gruvbox
"colorscheme wal
"set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'medium'


au FileType c		call FT_c()

syntax enable

" prevent mouse vanishing
set mousehide
set mousemodel=popup
set laststatus=2
set signcolumn=yes

" enable 256 colors on Vim
set t_Co=256

" enable incremental search
set incsearch
set hidden
set cscopetag

" virtual tabstops using spaces
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set hlsearch
set linebreak

"set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

autocmd FileType c,cpp map <buffer><Leader>x <Plug>(operator-clang-format)
autocmd BufWritePost * GitGutter

" NORMAL mode mappings
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :set nohls<CR>
nmap <F9> mz:execute TabToggle()<CR>'z

nmap <leader>gs :Gstatus<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gd :Gdiff<CR>


" INSERT mode mappings
inoremap <c-d> <esc>dd

if has('gui_running')
	set background=light
	set guioptions=i
	set guifont=Inconsolata\ Medium\ 10
	set guioptions-=e
	set lines=999 columns=999
endif


" ----------------------- functions BEGIN -------------------------

" allow toggling between local and default mode
function TabToggle()
    if &expandtab
    	set tabstop=8
        set shiftwidth=8
        set softtabstop=0
        set noexpandtab
    else
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab
    endif
endfunction

function FT_c()
    set cino=g0:0t0(0
    set noet
endfunction

function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
