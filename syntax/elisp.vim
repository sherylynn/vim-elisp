if exists("b:current_syntax")
    finish
endif
"定义
syntax keyword elispKeyword message defun lambda
"链接到高亮组
highlight link elispKeyword keyword

let b:current_syntax = "elisp"
