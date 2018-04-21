if exists("b:current_syntax")
    finish
endif
"定义 可以多个关键词放一组 叫什么只是称呼，是后面link的高亮
"也可以多次定义划分几行 效果一致
":help group-name 常见配色高亮组
syntax keyword elispKeyword car cdr cond cons
syntax keyword elispKeyword defun lambda setq progn let push mapcar while
"emacs 内置函数 针对emacs自身
syntax keyword elispFunction other-window switch-to-buffer-other-window 
syntax keyword elispFunction erase-buffer add-text-properties
syntax keyword elispFunction goto-char replace-match
syntax keyword elispFunction other insert 
syntax keyword elispFunction message print prin1 format
"Comment 用match然后匹配正则
syntax match elispComment "\v;.*$"
"操作符
syntax match elispOperator "\v\*"
syntax match elispOperator "\v/"
syntax match elispOperator "\v\+"
syntax match elispOperator "\v-"
"字符串
syntax region elispString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region elispString start=/\v'/ skip=/\v\\./ end=/\v'/
"链接组
highlight link elispKeyword keyword
highlight link elispFunction Function
highlight link elispComment Comment
highlight link elispOperator Operator
highlight link elispString String

let b:current_syntax = "elisp"
