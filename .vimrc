set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'sirver/ultisnips'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psf/black'
Plug 'preservim/nerdtree'
Plug 'rakr/vim-one'

call plug#end()

" color scheme
set t_Co=256
" colorscheme nord 
colorscheme nord
set background=dark
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
"set colorcolumn=80
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

hi CursorLine cterm=NONE ctermbg=NONE

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

nnoremap <C-G> :Goyo<CR>

nnoremap <silent> <leader>s :call ToggleSpell()<CR>

" Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1

let g:airline_theme = 'base16'

let g:airline_section_b = ''
let g:airline_section_x = '%{line(".")}/%{line("$")}'
let g:airline_section_y = ''
let g:airline_section_z = '%{col(".")}/%{col("$")}'

" let g:airline_powerline_fonts = 1
autocmd VimEnter * AirlineToggleWhitespace
let g:airline_right_sep=''
let g:airline_skip_empty_sections = 1

let g:airline_detect_spell=0
let g:airline#extensions#searchcount#enabled = 0
" let g:airline#extensions#wordcount#enabled = 0

" set custom colors for airline
" Set custom colors for airline
"let g:airline_highlighting_cache_enabled = 0

" Set the color of the airline components
"highlight AirlineA ctermfg=red guifg=#000000
"highlight AirlineB ctermfg=blue guifg=#123321
"highlight AirlineC ctermfg=green guifg=#ee33dd
"highlight AirlineX ctermfg=white guifg=#55ee55
"highlight AirlineY ctermfg=lightred guifg=#111111
"highlight AirlineZ ctermfg=yellow guifg=#111111
"highlight AirlineStatusLine ctermbg=black guibg=#111111
"highlight AirlineStatusLineNC ctermbg=cyan guibg=#111111

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "masterTexSnips"]

" DOESN'T WORK VVVV
" remove zathura window decorations

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

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" weird stuff vim complains about
map  <Esc>[1;5A <C-Up>
map  <Esc>[1;5B <C-Down>
map  <Esc>[1;5D <C-Left>
map  <Esc>[1;5C <C-Right>
cmap <Esc>[1;5A <C-Up>
cmap <Esc>[1;5B <C-Down>
cmap <Esc>[1;5D <C-Left>
cmap <Esc>[1;5C <C-Right>

map  <Esc>[1;2D <S-Left>
map  <Esc>[1;2C <S-Right>
cmap <Esc>[1;2D <S-Left>
cmap <Esc>[1;2C <S-Right>
set term=xterm
