execute pathogen#infect()

" ==============
" == Settings
" ==============
" Remap leader
nnoremap <SPACE> <Nop>
let mapleader=" "

colorscheme PaperColor
set background=light

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

"save on lose focus
au FocusLost * :wa

" Fix vim-vue syntax randomly disappearing
autocmd FileType vue syntax sync fromstart

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

" ==============
" == GUI
" ==============
if has("gui_running")
  color sift
  set noantialias
  set guioptions-=e
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L

  " set guifont=FixedsysTTF\ 12
  set guifont=Terminus

  hi GitGutterAdd guifg=#338833 guibg=#0c121c
  hi GitGutterChange guifg=#FFFE07 guibg=#0c121c
  hi GitGutterChangeDelete guifg=#FFFE07 guibg=#0c121c
  hi GitGutterDelete guifg=#884444 guibg=#0c121c
endif

" ==============
" == Style
" ==============
" hi ColorColumn ctermbg=darkgray
" hi Conditional ctermfg=Yellow
" hi NonText ctermfg=236
" hi SpecialKey ctermfg=236
hi ExtraWhitespace ctermbg=red

" match ExtraWhitespace /\s\+$/
" function! NumberToggle()
"   if(&relativenumber == 1)
"     set norelativenumber
"   else
"     set relativenumber
"   endif
" endfunc

nnoremap <C-o> :call NumberToggle()<cr>

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ==============
" == Plugins config
" ==============
" Typescript
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbol)

" Nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" Vue
let g:vue_disable_pre_processors=1

" Ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" LightLine
let g:lightline = { 'colorscheme': 'wombat' }

" Ale
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Disable all other linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1


" Run prettier-vue on save for .vue files
fun! PrettierVue()
  silent write !prettier-vue %
  edit!
endfun

autocmd BufWritePre *.vue call PrettierVue()

" Run rpettier on save for all other extensions
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md Prettier
