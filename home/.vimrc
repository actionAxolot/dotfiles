"--- Turn off vi compatibility ---"
set nocompatible
let base16colorspace=256

"---fucking line endings
set ffs=unix

"--- Have jj escape insert mode ---"
inoremap jj <Esc>

"---- Color in terminal ----"
if has("unix") || has("mac")
    if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/.vim/bundle/'))
else
    if has('vim_starting')
        set runtimepath+=~/vimfiles/bundle/neobundle.vim/
    endif

    call neobundle#begin(expand('~/vimfiles/bundle/'))
endif

"------- Packages to use ------"
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'vim-scripts/delimitMate.vim.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'vim-scripts/Tagbar.git'
NeoBundle 'mattn/emmet-vim.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
NeoBundle 'ajh17/Spacegray.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'scrooloose/syntastic'

call neobundle#end()
"------- Packages to use ------"

syntax on
filetype on
filetype plugin indent on

"------ Vim-notes configuration
let g:notes_directories = ['~/Dropbox/notes']
let g:notes_title_sync = 'rename_file'
let g:notes_suffix = '.txt'

"--- GUI window configurations ---"
set winaltkeys=no
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has("mac")
    set guifont=Monaco\ Mono\ 10
elseif has("unix")
    set guifont=Ubuntu\ Mono\ 10
else
    set guifont=Inconsolata:h11
endif


"---Remap key---"
let mapleader = "\<space>"

"--- Movement
nnoremap j gj
nnoremap k gk

"---Fold Method---"
set foldmethod=indent
set foldlevel=99

"---compatibility and security---"
set modelines=0
set ttimeoutlen=100

"--- Airport conf ----"
"let g:airline#extensions#tabline#enabled = 1

"---Set Color Scheme---"
colorscheme spacegray

"---Tabs configuration---"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"---Vim editor settings---"
set modelines=5
set mousemodel=popup
set pastetoggle=<F2>
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest:full,full
set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set nobackup
set noswapfile


"---Vim search improvements---"
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap ,, :noh<CR>

"---Vim Longlines mess---"
set textwidth=100
set formatoptions=qrn1

"---Mappings to show hidden characters---"
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"---Match it configuration---"
runtime macros/matchit.vim

"---filetype identification---"
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
set completeopt=menuone,longest,preview,menu

"---Indentation according to filetype---"
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

"---Working with windows---"
set winminheight=0
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"---Keybind NerdTree---"
map <leader>nt :NERDTreeToggle<CR>

"---keybind for tagbar---"
map <leader><leader><leader> :TagbarOpenAutoClose<CR>:noh<CR>

"--- buffer nav
nnoremap <space><space> :bnext<CR>

"--- Gundo mappings ---"
map <leader>g :GundoToggle<CR>

"---Store Backup files in a central place---"
set backup
set backupdir=~/tmp
set dir=~/tmp

"------ Misc. Bindings -----"
"- Codefolding remap -"
nnoremap zz za

"--- Create mappings to edit and source vimrc ---"
nmap <leader>vr :tabedit $MYVIMRC<CR>

" --- Unite and stuff ---"
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
if has("win32")
    nnoremap <C-t> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
else
    nnoremap <C-t> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async<cr>
    nnoremap <leader>a :Unite grep:.<cr>
endif
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>h :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"--- clipboard this shit
"set clipboard=unnamedplus

"--- Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

let g:syntastic_python_checkers = ["flake8"]

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Ultisnips conf
let g:UltiSnipsExpandTrigger="<tab>"

" --- Making clipboards play nice
map <leader>y "+y
map <leader>p "+p

" ---- Check for uninstalled bundles
NeoBundleCheck
