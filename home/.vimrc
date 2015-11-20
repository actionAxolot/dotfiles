"--- Turn off vi compatibility ---"
let base16colorspace=256

"---fucking line endings
set ffs=unix

"--- Have jj escape insert mode ---"
inoremap fd <Esc>

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
NeoBundle 'ajh17/Spacegray.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'Valloric/YouCompleteMe'

call neobundle#end()
"------- Packages to use ------"

syntax on
filetype on
filetype plugin indent on

"--- GUI window configurations ---"
set winaltkeys=no
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has("mac")
    set guifont=Monaco\ Mono\ 10
elseif has("unix")
    set guifont=Source\ Code\ Pro\ 10
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
nmap <leader>fl :set list!<CR>
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

"---Window operations---"
set winminheight=0
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>l
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

"---Keybind NerdTree---"
map <leader>pt :NERDTreeToggle<CR>

"---keybind for tagbar---"
map <leader>ft :TagbarOpenAutoClose<CR>:noh<CR>

"--- buffer nav
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>

"--- Gundo mappings ---"
map <leader>fg :GundoToggle<CR>

"---Store Backup files in a central place---"
set backup
set backupdir=~/tmp
set dir=~/tmp

"------ Misc. Bindings -----"
"- Codefolding remap -"
nnoremap <leader>fz za

"--- Create mappings to edit and source vimrc ---"
nmap <leader>vr :tabedit $MYVIMRC<CR>

"--- Neovim terminal stuff ----"
tnoremap fd <C-\><C-n>

" --- Unite and stuff ---"
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
if has("win32")
    nnoremap <C-t> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
else
    nnoremap <C-t> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async<cr>
    nnoremap <leader>ua :Unite grep:.<cr>
endif
nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>uh :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>ub :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"--- clipboard this shit
"set clipboard=unnamedplus

" YouCompleteMe
let g:ycm_key_list_select_completion = ["<C-n>", "<Down>"]
let g:ycm_key_list_previous_completion = ["<C-p>", "<Up>"]
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips conf
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" --- Making clipboards play nice
map <leader>fy "+y
map <leader>fp "+p

" ---- Check for uninstalled bundles
NeoBundleCheck
