try
  !emacsclient -eval "(- 1 2)"
catch 
  !emacs -Q -nw -daemon
endtry
