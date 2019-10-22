execute pathogen#infect()

" ==============
" == Settings
" ==============
" Remap leader
nnoremap <SPACE> <Nop>
let mapleader=" "

filetype plugin indent on    " required
syntax enable
" set colorcolumn=100
set autoread
set pastetoggle=<F2>
set number
set t_Co=256
set clipboard=unnamedplus
set mouse=a
set shell=/bin/bash
set ul=99
set laststatus=2
set timeoutlen=500 ttimeoutlen=0
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set tabstop=2
set expandtab
set encoding=utf8
set ruler
set incsearch
set noswapfile
set cursorline
set hid
set smartcase
"remove mode status from bottom line
set noshowmode
set noshowmatch
"disable .swp files
set nobackup
"Open new buffers in new page
set switchbuf+=usetab,newtab
"Display hidden chars
set listchars=tab:>·
set list
"Set tags directory
set tags=./tags,tags;$HOME

" == Autocmd
"disable autocomment on paste
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

au BufReadPre //* :NoMatchParen


" ==============
" == Maps
" ==============
" Disable autoindent paste
nnoremap <F2> :set invpaste paste?<CR>
imap <C-g> <CR><Esc>O<Tab>
" Map emmet to <C-e>
imap <C-e> <C-y>,

nmap <leader>ee :lnext<cr>

" Move lines
nmap <c-l> [e
nmap <c-k> ]e
vmap <c-k> ]egv
vmap <c-l> [egv

"save read only files without reopening vim
cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>v :e ~/.vimrc<CR>

nnoremap K gT
nnoremap L gt

nnoremap <leader>j <c-w><c-h>
nnoremap <leader>k <c-w><c-j>
nnoremap <leader>l <c-w><c-k>
nnoremap <leader>r <c-w><c-r>
nnoremap <leader>; <c-w><c-l>
nnoremap <leader>e :e ~/
nnoremap <leader>f /
nnoremap <leader>w <c-w><c-w>

" change ' to "
nnoremap <f11> :%s/'\([^']*\)'/"\1"/g<cr>
" change " to '
nnoremap <F12> :%s/"\([^"]*\)"/'\1'/g<CR>

map <leader>q :q<CR>
map <leader>t :tabnew<CR>

nnoremap <leader>hs :sp<CR>
nnoremap <leader>vs :vsp<CR>
nnoremap <leader><leader> :w<CR>

" nnoremap K <Nop>
" vnoremap K <Nop>

map <Esc><Esc> :w<CR>

" go to tab
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt

"normalmov
nnoremap j h
nnoremap k gj
nnoremap l gk
nnoremap ; l
"visualmov
vnoremap j h
vnoremap k gj
vnoremap l gk
vnoremap ; l

"allow . to repeat visual commands
vnoremap . :norm.<CR>

hi ExtraWhitespace ctermbg=red

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

