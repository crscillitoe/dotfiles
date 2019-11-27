set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'benmills/vimux'
Plugin 'leafgarland/typescript-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chriskempson/base16-vim'
Plugin 'psf/black'
call vundle#end()

set t_Co=256

let base16colorspace=256
let g:ycm_python_binary_path = 'python3'
colorscheme base16-monokai
set clipboard=unnamedplus

"TRANSPARENCY
autocmd VimEnter * hi Normal ctermbg=none

"Use dark/light theme
set background=dark

"press Ctrl + N to open NerdTree
map <C-n> :NERDTreeToggle<CR>

"Auto close vim if NerdTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWritePre *.py execute ':Black'

let g:indentLine_char = ''


nnoremap <F5> yyp<c-v>$r-


function! s:Figlet()
 y"f
 let val = f
 :read !figlet val
endfunction


function! s:Underline(chars)
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

set laststatus=2

"set synmaxcol=120

let itermenv=$ITERM_PROFILE


set runtimepath+=~/dotfiles/vim

" Don't use vi settings
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
" spell check
autocmd BufRead *.md setlocal spell spelllang=en_us

" column 120
if exists('+colorcolumn')
  set colorcolumn=200
endif


" Turn on line numbering. Turn it off with "set nonu" 
set rnu
set nu


" allow plugin, indent, etc
filetype plugin indent on
set autoindent

" (Sometimes) case insensitive search
set ic
set smartcase

" Highlight search
" set hls

syntax enable


let g:ycm_filetype_specific_completion_to_disable = {'cs': 1}


set guifont=Source\ Code\ Pro:h14

" Allow jj to trigger ESC
imap jj <Esc>

" ;; toggles a ; at EOL (see http://stackoverflow.com/a/18157585/2405902)
nnoremap ;; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR> :noh <CR>

" Open TDL file
nnoremap tdl :vsp ~/tdl.md <CR>

" Map leader to ,
let mapleader = ","

" Use spaces instead of tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

autocmd FileType cs setlocal tabstop=4
autocmd FileType cs setlocal shiftwidth=4
autocmd FileType cs setlocal softtabstop=4


" Allow backspaces
set backspace=indent,eol,start


" Get rid of bell
set noerrorbells
set visualbell
set t_vb=

" word wrap
set wrap
set linebreak
set nolist  " list disables linebreak
set lbr " Wrap text instead of being on one line

" Don't start with folds
set foldlevelstart=99
set foldlevel=99

" if md or txt file, set type markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.Rmd set filetype=markdown
au BufRead,BufNewFile *.markdown set filetype=markdown

" if json, set type javascript
au BufRead,BufNewFile *.json set filetype=javascript

" paste, no paste
nnoremap <leader>z :set invpaste paste?<CR>
set pastetoggle=<leader>z
set showmode

" copy paste
nmap <C-A-V> "+gP
imap <C-A-V> <ESC><C-A-V>i
vmap <C-A-C> "+y 

if has("gui_running")
    set guioptions=egmrt
    set lines=40
endif

" switch window
map gw <C-w>w
map GW <C-w>W

" switch tab
map GT gT

let g:airline_powerline_fonts = 1

" autocomplete mode
set wildmode=list:longest,list:full

" Tabular (from http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
map <Leader>f dd :read !figlet <C-r>" <CR>

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Relative number yank
nmap [p :<C-U>exe '+' . (v:count1) . 't.'<CR>

nmap ss :source ~/.vimrc<CR>

set go-=m
set go-=T
set go-=r
set go-=L
set guifont=Courier\ 10


nmap <C-k> :YcmCompleter GoToDefinition<cr>




nmap <leader>p :call VimuxRunCommand('cd ' . expand('%:p:h') . ' && dotnet run')<cr>

nmap <leader>c :call VimuxRunCommand('clear')<cr>

nmap <leader>e :call VimuxRunCommand('echo hi')<cr>
nmap <leader>2 :call VimuxRunCommand('python3 ' . expand('%:p'))<cr>


" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
" example: :let i = 1 | %s/abc/\='xyz_' . Inc()/g
function Inc(...)
  let result = g:i
  let g:i += a:0 > 0 ? a:1 : 1
  return result
endfunction
