"try
"  !emacsclient -eval "(- 1 2)"
"catch /\msocket/
"  !emacs -Q -nw -daemon
"endtry
"try
"  echo g:test
""没有参数等同捕获所有错误
"catch /121/
""catch /.*/
"  echo "catch all"
"endtry
"try catch的match不能匹配获得的结果
let g:emacsclient_command="emacsclient -eval '(print (+ 1 1))'"
let g:emacsserver_command="emacs -Q -nw --daemon"
let g:try_emacsclient=system(g:emacsclient_command)
"echo g:try_emacsclient
"matchstr 是使用正则搜索并给出搜索的结果
if matchstr(g:try_emacsclient,'server-file')=='server-file'
  "没启动，需要启动
  let g:try_emacsserver=system(g:emacsserver_command)
  if matchstr(g:try_emacsserver,'')
  else
    "正常
  endif
else
  "说明正常
endif
"太困了智商都下降了
"-------------------------------------------------------
"TODO
"---------------------------
"初始启动判断是否存在server,如果在就不做处理，后面的程序直接client获取
"如果不存在就拉起
"太困了只写了个保证拉起来emacs daemon的，没考虑更多
"还要应用到后面实际插件中
"或许要考虑异步
