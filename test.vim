(atom 'aaa)
(atom 'aaa)
(atom 'aaa)
(atom '(+ 1 1))
"分两种情况,一种是单引号后面不跟括号,一种是跟括号,先讨论第一种
:%s/\v'(.{-})\)/(quote \1)/g
