
"Plugins

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'haya14busa/is.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'andys8/vim-elm-syntax'

call plug#end()


" Setting leader/unbinding keys

nnoremap <Space> <Nop>
nnoremap <F9> <Nop>
nnoremap <F9> <Nop>
let mapleader = " "


" Colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set background=dark


" Personal Preferences
set tabstop=4
set shiftwidth=4
set expandtab
set visualbell
set backspace=indent,eol,start
set relativenumber
set clipboard+=unnamedplus


" netrw stuff
let g:netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'
let g:netrw_winsize = 25


" Keybindings
nmap <Leader>t <Plug>(coc-terminal-toggle)
tmap <Leader><Leader>t <C-\><C-n><Plug>(coc-terminal-toggle)
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
nnoremap <Leader>c :e $MYVIMRC<CR>
nnoremap <Leader>f :FZF<CR>
inoremap {<CR> {}<LEFT><CR><ESC>O
inoremap {} {}
nmap <Leader>rn <Plug>(coc-rename)


" Using <F9> to run files
autocmd filetype cpp nnoremap <F9> :w <bar> :term g++ -Weffc++ -pedantic -O2 % -o %:r && ./%:r<CR>
autocmd filetype cpp inoremap <F9> <Esc>:w <bar> :term g++ -Weffc++ -pedantic -O2 % -o %:r && ./%:r<CR>
autocmd filetype python nnoremap <F9> :w <bar> term python3 %<CR>
autocmd filetype python inoremap <F9> <ESC>:w <bar> term python3 %<CR>
autocmd filetype python command F !flask run
autocmd filetype html nnoremap <F9> :w <bar> !open %<CR>
autocmd filetype html inoremap <F9> <Esc>:w <bar> !open %<CR>
autocmd filetype javascript nnoremap <F9> :w <bar> !npm start<CR>
autocmd filetype javascript inoremap <F9> <Esc>:w <bar> !npm start<CR>
autocmd filetype c nnoremap <F9> :w <bar> !clang % && ./a.out<CR>
autocmd filetype c inoremap <F9> <Esc>:w <bar> !clang % && ./a.out<CR>
autocmd filetype elm nnoremap <F9> :w <bar> !elm reactor<CR>
autocmd filetype elm inoremap <F9> <Esc>:w <bar> !elm reactor<CR>
autocmd filetype java nnoremap <F9> :w <bar> :term java %<CR>
autocmd filetype java inoremap <F9> <Esc>:w <bar> :term java %<CR>


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ #refresh()


" Go To Definition fuction
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>
