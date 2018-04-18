" import emacs keymap
inoremap <C-A> <HOME>
inoremap <C-E> <END>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-D> <DELETE>
inoremap <C-Y> <C-R>"
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-D> <DELETE>
cnoremap <C-Y> <C-R>"
nnoremap <C-A> <HOME>
nnoremap <C-E> <END>
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
