set encoding=utf8
call plug#begin('~/.vim/plugged')
" Async Linting
Plug 'w0rp/ale'
" Dev Icons
Plug 'ryanoasis/vim-devicons'
" Nerd Tree, a file manager for vim
Plug 'scrooloose/nerdtree'
" GruvBox Color Scheme
Plug 'morhetz/gruvbox'
" Multi-File word search
Plug 'wincent/ferret'
" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
" AirLine
Plug 'vim-airline/vim-airline'
" Vim Go integration
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" typescript-vim for TypeScript Syntax
Plug 'leafgarland/typescript-vim'
"" TypeScript + React integration
Plug 'ianks/vim-tsx'
" Syntax Highlighting
Plug 'vim-syntastic/syntastic'
"JavaScript Syntax
Plug 'pangloss/vim-javascript'
" JSX
Plug 'MaxMEllon/vim-jsx-pretty'
" GraphQL
Plug 'jparise/vim-graphql'
""Indent guides
Plug 'nathanaelkane/vim-indent-guides'
" Commenting
Plug 'preservim/nerdcommenter'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

""Black python formatting
Plug 'psf/black', { 'branch': 'stable' }

Plug 'integralist/vim-mypy'

call plug#end()
let g:loaded_youcompleteme = 1


" Remap leader
let mapleader=";"

" copy to clipboard
set clipboard=unnamed
set nowrap

" Enable cool terminal colors
set termguicolors
colorscheme gruvbox


set tabstop=2 
set shiftwidth=2 
set expandtab
set splitbelow
set splitright
set number
set autoread                " Don't bother me when a file changes
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set wildmenu		    " show possible completions in command mode
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion
set autowrite               " Lets us automatically save the compiled Go binaries
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go Lang Config, primarily vim-go
""""""""""""""""""""""""""""""""""""""""""""""""""""

" run :GoRung with leader r
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Leader b to build test and regular go files
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Leader C to toggle test coverage
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)


" use goimports package for import handling in Go files
let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Black.py Config 
""""""""""""""""""""""""""""""""""""""""""""""""""""
let black_linelength = 79 
let black_string_normalization = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional Split config
""""""""""""""""""""""""""""""""""""""""""""""""""""

"split navigations using control
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =

" Auto open nerdtree and set some configurations
autocmd vimenter * NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" Control O to toggle nerd tree
nmap <C-o> :NERDTreeToggle<CR>

" Use Ag for Ack.vim https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
" Trying out RipGrep 
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif

" RipGrep for Ack.vim
" if executable('rg')
"  let g:ackprg = 'rg --vimgrep --no-heading'
" endif

" Bind \ to do our Ack vim call:
nnoremap \ :Ack<SPACE>

" FZF Config
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

" Map Fzf to Ctrl-p
nnoremap <c-p> :FZF<cr> 

let $FZF_DEFAULT_COMMAND = 'rg --files --follow -g "!{.git,node_modules}/*" 2>/dev/null'
" Not sure what this does
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{*.lock,*-lock.json}" '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:40%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

" This is the default extra key bindings for opening files
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout for quickfix
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let python_highlight_all=1
syntax on

filetype plugin on
set foldlevel=99

" allow backspace to edit indentation
set backspace=indent,eol,start
" Auto trim trailing whitespace

autocmd BufWritePre *.py :%s/\s\+$//e
