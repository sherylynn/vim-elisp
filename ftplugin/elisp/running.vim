"依靠的执行器
if !exists("g:elisp_command")
  let g:elisp_command="emacs"
  let g:command_option=" -Q -nw -batch -l "
endif
""%"代表当前buffer "#"表示之前buffer
func! ElispRunFile()
  silent !clear
  execute "!" . g:elisp_command . g:command_option . bufname("%")
endfunc
func! ElispShowResult()
  "get result
  let result=system(g:elisp_command . g:command_option . bufname("%"))
  "检测buf是否打开
  if !bufexists("__Elisp_Result__")
  "split and show
    split __Elisp_Result__
  else
    "根据buf获取窗口编号，根据窗口编号获取窗口id，跳转到对应id的窗口
    let l:buf_id=bufwinnr("__Elisp_Result__")
    let l:win_id=win_getid(l:buf_id)
    call win_gotoid(l:win_id)
  endif
  normal! ggdG
  setlocal filetype=elispresult
  setlocal buftype=nofile
  "insert the result
  "append在指定行加入内容 (行数,字符串列表)
  call append(0,split(result, '\v\n'))
  "回到之前窗口 :help ctrl-w_w wincmd p是回到铅一个窗口
  wincmd p 
endfunc

"localleader没设定
"nnoremap <buffer> <localleader>r :call ElispRunFile()<cr>
nnoremap <buffer> <leader>r :call ElispRunFile()<cr>
nnoremap <buffer> <leader>r :call ElispShowResult()<cr>
