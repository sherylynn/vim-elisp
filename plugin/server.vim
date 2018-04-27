if !exists("*Async_Just_Err")
  func Async_Just_Err(run,err)
    let l:just_run_job=job_start(a:run,{"out_cb":"Just_run","err_cb":"Just_err"})
  endfunc
endif
let g:emacsclient_command="emacsclient --eval '(print (+ 1 1))'"
let g:emacsserver_command="emacs -Q --daemon"
if has("win32")||has("win64")
  let g:try_emacsclient="待定"
else
  let g:try_emacsclient=system(g:emacsclient_command)
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
if !exists("*EmacsDaemon")
  func EmacsDaemon()
    let server_job=job_start(g:emacsserver_command,{"out_cb":"EmacsKeep","err_cb":"EmacsErr"})
  endfunc
endif
if !exists("*EmacsKeep")
  func EmacsKeep(channel,msg)
    echom a:msg
    let l:status=matchstr(a:msg,'\m\(starting\)')
    if l:status=='starting'
      "save status
      let g:emacsstatus="started"
    else
      "is installed?
"      echom "are you installed emacs ?"
    endif
  endfunc
endif
if !exists("*EmacsErr")
  func EmacsErr(channel,msg)
    echom a:msg
"    let l:status=matchstr(a:msg,'\m\(starting\)')
"    if l:status=='starting'
"      "save status
"      let g:emacsstatus="started"
"    else
"      "is installed?
"      echom "are you installed emacs ?"
"    endif
  endfunc
endif
