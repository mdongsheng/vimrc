" author: mdongsheng@gmail.com
" Date: 2013-08-09

"我的配置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'kchmck/vim-coffee-script'
Bundle 'slim-template/vim-slim.git'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'cespare/vim-golang'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'astashov/vim-ruby-debugger'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'mrhooray/vim-hybrid'

syntax on
set sw=4
set ts=4
set et
filetype on
filetype plugin indent on
set hidden
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
"set tabstop=8
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
"set nowrap
set browsedir=buffer
set selection=exclusive
set selectmode=mouse,key
set guifont=Monaco:h16
set lines=9999 columns=9999
set cursorline

colorscheme hybrid

"EasyMotion
let g:EasyMotion_leader_key = 'f'

"NERDTree settings
let NERDTreeShowBookmarks=1
let NERDChrismasTree=1
let NERDTreeWinPos="left"
let NERDTreeMinimalUI=1
"let g:rubytest_cmd_spec = "rspec -fd %p"
"let g:SuperTabRetainCompletionType="context"

"Ctrlp Settings
let g:ctrlp_working_path_mode = 'ra'
map ,d :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>k

let mapleader = ","
map <leader>F :FufFile<CR>
map <leader>f :FufTaggedFile<CR>
map <leader>g :FufTag<CR>
map <leader>b :FufBuffer<CR>
map <silient><leader>s :source ~/.vimrc<CR>
map <silient><leader>e :e ~/.vimrc<CR>

nmap ,m <C-W>w

nnoremap <leader>cw :FufFileWithFullCwd<CR>
nnoremap <F9> zf<CR>
nnoremap <F10> za
nnoremap <F7> zR

inoremap <silent><C-H> <Left>
inoremap <silent><C-L> <Right>
inoremap <silent><C-J> <Down>
inoremap <silent><C-K> <Up>
inoremap <C-P> <C-X><C-E>
inoremap <C-B> <C-X><C-Y>

xnoremap p pgvy

"自动添加python的encoding
function! AddPyCodingLine()
  call append(0, "# -*- coding: utf-8 -*-")
endfunction

function! ToogleFullScreen()
  call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")
endfunction

"call ToggleFullScreen()

" .vimrc auto referesh
autocmd! BufWritePost .vimrc source ~/.vimrc
autocmd! BufWritePost .gvimrc source ~/.gvimrc
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType ruby setlocal et sta sw=2 sts=2
au BufNewFile *.py exec ":call AddPyCodingLine()"
call EasyMotion#highlight#init()
