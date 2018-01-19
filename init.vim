call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Ale, an async linter for vim
Plug 'w0rp/ale'
" Super Tab allows for tab completion in insert mode
Plug 'ervandew/supertab'
" Auto Commenter
Plug 'scrooloose/nerdcommenter'
" Nerd Tree, a file manager for vim 
Plug 'scrooloose/nerdtree'
"Some react JS and JSX syntax engines
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" deoplete, an async completion engine.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python Completion for deoplete
Plug 'zchee/deoplete-jedi'
"JavaScript completion with tern
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Emmet for vim 
Plug 'mattn/emmet-vim'
call plug#end()

" re-map leader key to ';'
let mapleader=";"
"color scheme for OceanicNext
if (has("termguicolors"))
 set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme OceanicNext
filetype on             " vim will try to detect the file type
filetype plugin on      " if i'm using a plugin for this filetype it will get loaded
filetype indent on      " when a file is loaded in it's indent file is loaded
set tabstop=2           " show tabs with two spaces
set shiftwidth=2        " when indenting with '>' use two spaces width
set expandtab           " on pressing tab insert 2 spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matche

" Fuzzy file finder to behave like cntrl-P
nnoremap <c-p> :FZF<cr>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>


"ctrl modifier to move through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" Creates the Ag: command for text searching 
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" Bind \ to do our Ag:
nnoremap \ :Ag<SPACE>

" JSX highlighting in JS files
let g:jsx_ext_required = 0

" enable deoplete on startup
let g:deoplete#enable_at_startup = 1

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]
"remap emmet-vim Cntrl y to contrl e
let g:user_emmet_leader_key='<C-E>'
" Auto open nerdtree
autocmd vimenter * NERDTree

