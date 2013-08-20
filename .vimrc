" author: mdongsheng@gmail.com
" Date: 2013-08-09

"我的配置
syntax on

set sw=4
set ts=4
set et
filetype on
filetype plugin indent on
set nocompatible
set backspace=indent,eol,start
set autoindent
set history=50
set showcmd
set hlsearch
set incsearch
set ruler
set number
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set tabstop=8
set cindent shiftwidth=2
set autoindent shiftwidth=2
set wildmode=list:full
set wildmenu
set nobackup
set noswapfile
set showmatch
set ignorecase
"set iskeyword+=_,$,%,#,
set report=0
set mouse=a
set nowrap
set browsedir=buffer
set selection=exclusive
set selectmode=mouse,key

"NERDTree settings
let NERDTreeShowBookmarks=1
let NERDChrismasTree=1
let NERDTreeWinPos="left"
let NERDTreeMinimalUI=1
"let g:rubytest_cmd_spec = "rspec -fd %p"
"let g:SuperTabRetainCompletionType="context"

"Ctrlp Settings
let g:ctrlp_working_path_mode = 'ra'
map <F8> :NERDTreeToggle<CR>

let mapleader = ","
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>g :FufTag<CR>
map <leader>b :FufBuffer<CR>
map <silient><leader>s :source ~/.vimrc<CR>
map <silient><leader>e :e ~/.vimrc<CR>

nnoremap <leader>cw :FufFileWithFullCwd<CR>
nnoremap <F9> zf<CR>
nnoremap <F10> za
nnoremap <F7> zR

inoremap <silent><C-H> <Left>
inoremap <silent><C-L> <Right>
inoremap <silent><C-J> <Down>
inoremap <silent><C-K> <Up>
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>

" .vimrc auto referesh
autocmd! BufWritePost .vimrc source ~/.vimrc
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
autocmd FileType python setlocal et sta sw=4 sts=4
