let g:emacsclient_command="emacsclient --eval '(print (+ 1 1))'"
let g:emacsserver_command="emacs -Q --daemon"
if !exists("*Async_Just_Err")
  func Async_Just_Err()
    let l:just_run_job=job_start(g:emacsclient_command,{"out_cb":"Just_run","err_cb":"Just_err"})
  endfunc
endif
if !exists("*Just_run")
  func Just_run(channel,msg)
    echom a:msg
  endfunc
endif
if !exists("*Just_err")
  func Just_err(channel,msg)
    "出错直接尝试拉后台
"    echom a:msg
    call EmacsDaemon()
  endfunc
endif
if !exists("*EmacsDaemon")
  func EmacsDaemon()
    let server_job=job_start(g:emacsserver_command,{"out_cb":"EmacsKeep","err_cb":"EmacsErr"})
  endfunc
endif
if !exists("*EmacsKeep")
  func EmacsKeep(channel,msg)
    let l:status=matchstr(a:msg,'\m\(starting\)')
    if l:status=='starting'
      let g:emacsstatus="started"
    else
    endif
  endfunc
endif
if !exists("*EmacsErr")
  func EmacsErr(channel,msg)
"    echom a:msg
  endfunc
endif
if !exists("*ClientTest")
  func ClientTest()
  endfunc
  call Async_Just_Err()
endif
