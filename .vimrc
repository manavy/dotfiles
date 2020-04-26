colorscheme desert

" -------------------
" indent/scroll
" -------------------
set cindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set scrolloff=10
set wildmode=longest:list
set shortmess+=I
set fileformats=unix,dos,mac

" -------------------
" backup/swap
" -------------------
set backup
set backupdir=~/backup
set hidden "enable undo after change buffer
set autowrite
set history=50

" -------------------
" special chars
" -------------------
set ambiwidth=double "for editing multibyte strings
set list
set listchars=tab:\.\ ,eol:\ ,trail:_

" -------------------
" status
" -------------------
set notitle
set nocompatible
set laststatus=2 "always keep showing status line

" -------------------
" encoding
" -------------------
" UTF-8
set termencoding=utf-8
set encoding=japan
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
scriptencoding utf-8

" -------------------
" case/search
" -------------------
set ignorecase
set smartcase
set nohlsearch
set incsearch
set showmatch

" -------------------
" Filetype
" -------------------
filetype plugin indent on

autocmd! BufRead,BufNewFile *.html set filetype=html
autocmd! BufRead,BufNewFile *.rb set filetype=ruby
autocmd! BufRead,BufNewFile *.ts set filetype=typescript
autocmd FileType javascript set shiftwidth=2 | set expandtab
autocmd FileType typescript set shiftwidth=2 | set expandtab
autocmd FileType html set shiftwidth=2 | set expandtab
autocmd FileType objc set shiftwidth=2 | set expandtab
autocmd BufNewFile,BufRead *.vue set filetype=html

" -------------------
" KeyMap
" -------------------
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V
map <silent> <F1> :bd<CR>
map <silent> <F2> :bp<CR>
map <silent> <F3> :bn<CR>
map <silent> <F4> :call BufferList()<CR>
map <silent> <F5> :Explore<CR>

" -------------------
" keymap for move/delete
" -------------------
set backspace=indent,eol,start
imap  <BS>
nnoremap j gj
nnoremap k gk

" -------------------
" syntax highlight
" -------------------
syntax on

augroup highlightZenkakuSpace
  autocmd!
  autocmd VimEnter,ColorScheme * highlight ZenkakuSpace cterm=underline ctermfg=gray guifg=gray
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END

" -------------------
" syntax
" -------------------
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" To use ripgrep
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:60%')
	\           : fzf#vim#with_preview('right:50%:hidden', '?'),
	\   <bang>0)

Plug 'leafgarland/typescript-vim'

call plug#end()


