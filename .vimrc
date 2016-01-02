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
"Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
"Bundle 'astashov/vim-ruby-debugger'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'mrhooray/vim-hybrid'
Bundle 'tpope/vim-commentary'
Bundle 'vim-scripts/taglist.vim'
Bundle 'asins/vimcdoc'

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
set writebackup
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
set cursorline

"powerline
set laststatus=2
set encoding=utf-8
if has("gui_running")
  set lines=999 columns=999
endif

if has("gui_running")
  colorscheme yytextmate
else
  colorscheme hybrid
endif

"EasyMotion
let g:EasyMotion_leader_key = 'f'

"NERDTree settings
let NERDTreeShowBookmarks=1
let NERDChrismasTree=1
let NERDTreeWinPos="left"
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=30
let NERDTreeDirArrows=1
"let g:rubytest_cmd_spec = "rspec -fd %p"
"let g:SuperTabRetainCompletionType="context"

" Ack
" let g:ack_default_options = "ignore-file=log"

" taglist
let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8_1/bin/ctags"

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
map <silent><leader>s :source ~/.vimrc<CR>
map <silent><leader>e :e ~/.vimrc<CR>
map <silent><leader>t :TlistToggle<CR>

nmap ,w <C-W>w
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

" .vimrc auto referesh
autocmd! BufWritePost .vimrc source ~/.vimrc
if has("gui_running")
  autocmd! BufWritePost .gvimrc source ~/.gvimrc
endif

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType ruby setlocal et sta sw=2 sts=2
au BufNewFile *.py exec ":call AddPyCodingLine()"
