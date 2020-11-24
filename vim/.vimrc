" ----------------------- vundle BEGIN -------------------------
set nocompatible
filetype off                   " required!

let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	Plugin 'scrooloose/nerdtree'
	Plugin 'rhysd/vim-clang-format'
	Plugin 'kana/vim-operator-user'
	Plugin 'bling/vim-airline'
	Plugin 'tpope/vim-fugitive'
	Plugin 'morhetz/gruvbox'
	Plugin 'dylanaraps/wal.vim'
	Plugin 'mhinz/vim-signify'
	"Plugin 'lervag/vimtex'
call vundle#end()
filetype plugin indent on    " required

" reloading vimrc: :so %
colorscheme gruvbox
"colorscheme wal

"set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'medium'

syntax enable

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" prevent mouse vanishing
set mousehide
set mousemodel=popup
set laststatus=2
set signcolumn=yes
set ttymouse=sgr

set ttyfast

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


set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:vimtex_view_general_viewer = 'zathura'

autocmd FileType c call FT_c()
autocmd FileType c,cpp map <buffer><Leader>x <Plug>(operator-clang-format)
autocmd FileType tex call FT_tex()
autocmd FileType tex setl updatetime=1
"autocmd BufWritePost * GitGutter

" NORMAL mode mappings
nmap <F2> :NERDTreeToggle<CR>
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <S-F8> :set nohls<CR>
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

function FT_tex()
	set tabstop=4
	set nosmartindent
	set indentexpr=
endfunction

function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

if has("cscope")
	let cscopes = ["./cscope.out", "../cscope.out", "../../cscope.out", $CSCOPE_DB]
	let w:cscope_db = ""

	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	"set cscopetag

	" check cscope for definition of a symbol before checking ctags: set to 1
	" if you want the reverse search order.
	set csto=0

	" Auto generate tags file on file write of *.c and *.h files
	" autocmd BufWritePost *.c,*.h silent! !tag . &

	" Find a cscope file that could be readable
	for c in cscopes
		if filereadable(c)
			let w:cscope_db=c
			break
		endif
	endfor

	if exists("w:cscope_db") && w:cscope_db != ""
		execute "autocmd FileChangedShell " . w:cscope_db . " silent! cs reset"
		execute "cs add " . w:cscope_db
	endif

	" show msg when any other cscope db added
	set cscopeverbose

	" The following maps all invoke one of the following cscope search types:
	"
	"   's'   symbol: find all references to the token under cursor
	"   'g'   global: find global definition(s) of the token under cursor
	"   'c'   calls:  find all calls to the function name under cursor
	"   't'   text:   find all instances of the text under cursor
	"   'e'   egrep:  egrep search for the word under cursor
	"   'f'   file:   open the filename under cursor
	"   'i'   includes: find files that include the filename under cursor
	"   'd'   called: find functions that function under cursor calls
	"
	" Below are three sets of the maps: one set that just jumps to your
	" search result, one that splits the existing vim window horizontally and
	" diplays your search result in the new window, and one that does the same
	" thing, but does a vertical split instead (vim 6 only).
	"
	" I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
	" unlikely that you need their default mappings (CTRL-\'s default use is
	" as part of CTRL-\ CTRL-N typemap, which basically just does the same
	" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
	" If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
	" of these maps to use other keys.  One likely candidate is 'CTRL-_'
	" (which also maps to CTRL-/, which is easier to type).  By default it is
	" used to switch between Hebrew and English keyboard mode.
	"
	" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
	" that searches over '#include <time.h>" return only references to
	" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
	" files that contain 'time.h' as part of their name).

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
