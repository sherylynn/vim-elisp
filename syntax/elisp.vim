if exists("b:current_syntax")
    finish
endif
"定义 可以多个关键词放一组 叫什么只是称呼，是后面link的高亮
"也可以多次定义划分几行 效果一致
"-----------------------------
"syntax match elispFunction "\v\(.*?\s"
"syntax match elispFunction "\v.*(\@<=\().\{-}\s"
"syntax match elispFunction "\m\(.*\)\(\@<=(\).\{-}\s"
"syntax match elispFunction "\m.\{-}\@<=(.\{-}\s"
"syntax match elispFunction "\v(\@=(.\{-}\s"
"------------------------------------
"vim的正则，\m兼容度和其他正则最高.除了\(\)
"零宽反向是说前面的匹配原匹配到了后就不管了，只收入?<=后面的数据
"先在子表达式中匹配任意字符加上左括号
"后面要保留的匹配中.\{-}是vim中的非贪婪(与.*相对)
"syntax match elispFunction "\v(.*\()\@<=(.\{-}\s)"
syntax match elispFunction "\m\(.*(\)\@<=\(.\{-}\s\)"
"------------------------------------------------------------
":help group-name 常见配色高亮组
syntax keyword elispKeyword car cdr cond cons queto
syntax keyword elispKeyword defun lambda setq progn let push mapcar while
"emacs 内置函数 针对emacs自身
syntax keyword elispSpecial other-window switch-to-buffer-other-window 
syntax keyword elispSpecial erase-buffer add-text-properties
syntax keyword elispSpecial goto-char replace-match
syntax keyword elispSpecial other insert 
syntax keyword elispSpecial message print prin1 format
"Comment 用match然后匹配正则
syntax match elispComment "\v;.*$"
"操作符
syntax match elispOperator "\v\*"
syntax match elispOperator "\v/"
syntax match elispOperator "\v\+"
syntax match elispOperator "\v-"
"字符串
syntax region elispString start=/\v"/ skip=/\v\\./ end=/\v"/
"' 代表了 queto 所以不能拿来注释
"syntax region elispString start=/\v'/ skip=/\v\\./ end=/\v'/
"链接组
highlight link elispKeyword keyword
highlight link elispFunction Function
highlight link elispSpecial Type
highlight link elispComment Comment
highlight link elispOperator Operator
highlight link elispString String

let b:current_syntax = "elisp"
