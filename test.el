;;Comment test
;test
(message "hello")
(+ 1 1)
(print "hello")
(setq me "lynn")
(prin1 me)
(defun hello (x)
  (message x))
(hello "elisp")
;;下面两个add结果其实一样，说明print的返回，除了操控结果外的返回也对的？
(defun add (x y)
  (print (+ x y)))
(add 2 2)
(add (add 2 2) (add 3 3))
(defun add (x y)
  (print (+ x y)) (+ x y))
(add (add 2 2) (add 3 3))
