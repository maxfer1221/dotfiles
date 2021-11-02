set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

Plug 'sirver/ultisnips'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'psf/black'
Plug 'preservim/nerdtree'

call plug#end()

" color scheme
set t_Co=256
set background=dark
colorscheme nord 
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

syntax on
filetype plugin indent on

let mapleader = " "

set noerrorbells
" set nowrap
set wrap
set noswapfile
" risky!
set nobackup
" fix:
set undodir=~/.vim/undodir
set undofile
set smartcase
" relative numbers and line number
set nu rnu
" list cmd options
set wildmenu
set autoread
" spellcheck
set spell
set spelllang=en_us
set encoding=utf8
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set expandtab
" ruler
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey
set hls is
set ic
set cmdheight=1
set noruler
set ttyfast
" status bar
set laststatus=2

" NERDTree stuff
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer = 'zathura'

" highlight line in insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" key-bindings
nnoremap k gj
nnoremap j gk
" window maps
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>b :sp<CR>
nnoremap <leader>x :wincmd c<CR>

nnoremap <C-g> :Goyo 120<CR>
nnoremap <C-r> :source ~/.vimrc<CR>

nnoremap <silent> <leader>s :call ToggleSpell()<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_y=''
let g:airline_section_z=''
autocmd VimEnter * AirlineToggleWhitespace
let g:airline_right_sep=''
let g:airline_skip_empty_sections = 1
" let g:airline_section_a=%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%

let g:airline_detect_spell=0
let g:airline#extensions#wordcount#enabled = 0

autocmd VimEnter * echo 'hello, maximo'

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "masterTexSnips"]

" DOESN'T WORK VVVV
" remove zathura window decorations
augroup vimrc_vimtex
  autocmd!
  au User VimtexEventView call MyViewHook()
augroup END

function! MyViewHook() abort
  " Ensure this hook only executes within a VimTeX buffer
  


  if !exists('b:vimtex') | return | endif

  call system('t-dec')
endfunction

function! ToggleSpell() abort
    if &spell == 1
        set nospell
    else
        set spell
    endif
endfunction
