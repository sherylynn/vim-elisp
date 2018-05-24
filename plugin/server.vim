if !exists("*Async_Just_Err")
  func Async_Just_Err(run,err)
    let l:just_run_job=job_start(a:run,{"out_cb":"Just_run","err_cb":"Just_err"})
  endfunc
endif
if !exists("*Just_run")
  func Just_run(channel,msg)
    echom a:msg
  endfunc
endif
if !exists("*Just_err")
  func Just_err(channel,msg)
    echom a:msg
  endfunc
endif
let g:emacsclient_command="emacsclient --eval '(print (+ 1 1))'"
let g:emacsserver_command="emacs -Q --daemon"
if has("win32")||has("win64")
  let g:try_emacsclient="待定"
else
  let g:try_emacsclient=system(g:emacsclient_command)
endif

if !exists("*EmacsDaemon")
  func EmacsDaemon()
    let server_job=job_start(g:emacsserver_command,{"callback":"EmacsHandler"})
  endfunc
endif
if !exists("*EmacsHandler")
  func EmacsHandler(channel,msg)
"    let l:status=matchstr(a:msg,'\m\(such\)')
"    let l:status=matchstr(a:msg,'such')
    let l:status=matchstr(a:msg,'\v(Starting)|(such)')
    if l:status=='Starting'
      "save status
      echom "emacs started"
    elseif l:status=='such'
      echom "had u installed emacs?"
    else
      "因为是流式传输,没符合的直接漏出来了
"      echom a:msg
    endif
  endfunc
endif
"echo g:try_emacsclient
"matchstr 是使用正则搜索并给出搜索的结果
if matchstr(g:try_emacsclient,'server-file')=='server-file'
  "没启动，需要启动
  echom "starting___"
  call EmacsDaemon()
else
  "说明正常
endif
"太困了智商都下降了
"-------------------------------------------------------
"TODO
"---------------------------
