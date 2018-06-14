set encoding=utf-8
set nu
set nocp
" Sane backspace in insert mode
set backspace=indent,eol,start


" Open Splits to the bottom right
set splitbelow
set splitright

"split navigations using Control
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

call plug#begin('~/.vim/plugged')
" Simply Fold, for better folding!
Plug 'tmhedberg/SimpylFold'
" Black for python
Plug 'ambv/black'
" Syntax highlighting goodness

call plug#end()

"PEP8 indentation!
au BufNewFile,BufRead *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix

" Two Spaces for js, jsx, html, css
au BufNewFile,BufRead *.js, *.jsx, *.html, *.css
  \ set tabstop=2
  \ set softtabstop=2
  \ set shiftwidth=2

" Black.py on save
autocmd BufWritePost *.py execute ':Black'

" Docstrings for folded code w/ SimpylFold
leg g:SimplyFold_docstring_preview=1
