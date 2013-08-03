" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Author: mdongsheng at gmail.com
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endi

"我的配置
filetype on
filetype plugin indent on
set ruler
set number
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set tabstop=2
set cindent shiftwidth=2
set autoindent shiftwidth=2
set wildmode=list:full
set wildmenu
set nobackup
set noswapfile
set noswapfile
set showmatch
set ignorecase
set iskeyword+=_,$,%,#,
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
map <F8> :NERDTree<CR>

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

"Config _vimrc auto referesh
autocmd! BufWritePost .vimrc source ~/.vimrc
"autocmd VimEnter * NERDTree
