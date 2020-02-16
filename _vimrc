source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"Vim default{{{
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
"}}}

set linebreak
set spell spelllang=en_gb
colorscheme desert
set nocp
set nu

set shiftround
set shiftwidth=4

"Vim script file settings{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

iabbrev @@ dan-tarrant1989@hotmail.com

let mapleader = ","

nnoremap <leader>N :setlocal number!<CR>

"Toggle column folds{{{
nnoremap <leader>F :call FoldColumnToggle()<CR>
function! FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
	    	setlocal foldcolumn=4
	endif
endfunction	    
"}}}
"Toggle quickfix window{{{
nnoremap <leader>Q :call QuickfixToggle()<CR>
let g:quickfix_is_open = 0
function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
	else
	    	copen
		let g:quickfix_is_open = 1
	endif

endfunction
"}}}

nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source! $MYVIMRC<CR>

nnoremap <leader>ms :mksession!<space>
nnoremap <leader>s  :source<space>%

nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>nrd :NERDTree<CR>

nnoremap <leader>H :setlocal nohlsearch!<CR>
inoremap jk <esc>
inoremap <esc> <nop>

nnoremap <leader>exp :! start .<CR>
"Disable arrow keys {{{
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"}}}

onoremap p i(
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/scrooloose/nerdtree'

call plug#end()


