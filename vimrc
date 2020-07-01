set nocompatible
"Switch on filetype plugin, turn on syntax, and select colorscheme
filetype plugin on
syntax on
color zellner
set nu
set relativenumber
set viminfo='100,<1000,s100,h
"Disable arrow keys
map  <UP> <NOP>
map  <DOWN> <NOP>
map  <RIGHT> <NOP>
map  <LEFT> <NOP>

imap <UP> <NOP>
imap <DOWN> <NOP>
imap <RIGHT> <NOP>
imap <LEFT> <NOP>

au FileType scheme imap <c-\> λ

set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ip :!ip addr show
inoremap <C-\> <c-k>l*
inoremap \( ()i
inoremap \9 ()i
inoremap \[ []i
inoremap \{ {}i

vnoremap ,( xi(pa)i
vnoremap ,9 xi(pa)i

"Set tags file at current or parent directories
set tags=""
autocmd filetype java set tags+=tags;/
"Write on move from file
set autowrite
set expandtab
set smartindent
"Allow backspace to traverse all characters
set backspace=indent,eol,start
set ignorecase
set smartcase
"Keep 50 lines of Command Line history
set  history=50
"Always show cursor position
set  ruler
"Allow for tab completion
set  showcmd
"Show search results as query is typed
set  incsearch
"AUTO INDENT!
set  autoindent		
"Set tabsize to 2
set tabstop=2
set shiftwidth=2

"Variable containing header info for new Java files
au FileType java let s:header="i/**@author Jared Gentner/public class " . expand('%:t:r') . ' {}ki	'
au FileType java set colorcolumn=100
au FileType c let s:header="i#include<stdio.h>int main(int argc, char *argv[]){}k  "
au FileType python,ocaml colo peachpuff
au FileType plaintex let &ft="tex"
au BufNewFile,BufRead *.not setfiletype notes
au FileType tex let s:header="i\\documentclass[12pt]{article}\\usepackage[margin=1in]{geometry}\\usepackage[doublespacing]{setspace}\\begin{document}\\end{document}O"
"By default call Header() when a new file is opened
autocmd BufNewFile * call Header()

"if the variable header is assigned, create a header from it
function Header()
    if exists("s:header")
	    exe "normal! " . s:header
    endif
endfunc

