" import emacs keymap
inoremap <C-a> <HomE>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-y> <C-r>"
"inoremap <C-k> <S-End><Del>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-y> <C-R>"
"cnoremap <C-k> <S-End><Del>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
"imap <C-A> <ESC>^i
"imap <C-E> <ESC>$a
"imap <C-K> <ESC>d$i
"cmap <C-K> <shift><end>
"map <C-A> ^
"map <C-E> $
"map <C-K> d$

" import elisp
func! Run_elisp()
  :normal %v%y
  let g:elisp_script=@"
  :echo system("emacs -Q -batch -eval '(prin1" . g:elisp_script . ")'")
  :normal %
endfunc
nnoremap <silent><leader>fv :call Run_elisp()<CR>
