bash配置和vim配置
=================

vim配置
-------

依赖工具：
- Vundle插件
- sdcv（命令行词典工具）
- mkd_preview.sh 实现mkd文件预览功能

bash配置
--------


使用方法
--------

```
$ git clone git@github.com:wolfwzr/etc.git somedir
$ cd somedir
$ bash install.sh
```

待实现功能
----------

- vim
    - YouCompleteMe编译配置
        - 编译的文件类型,感觉在一些文件中不会补全(如asm)
        - 自定义编译选项
        - 设置默认关闭实时编译
        - 用编辑nmap的源代码（C++）时，补全特别特别慢，特别卡顿
    - abbr
    - 代码块补全插件Ultisnap安装了但还不清楚用法
    - zi : toggle foldenable
    - Make Use of <Fn> <S-Fn> \<Fn>
    - Make Use of [a-z][0-9], <Leader>1
    - noft Search is still underline style(no effect in osx)
- bash

存在的疑问
----------

1. help类型的buffer无法通过autocmd BufNew,BufNewFile事件触发动作，为什么？目前是通过autocmd FileType help cmd来实现help类型的功能定制的
2. autocmd ColorScheme事件无法在ColorScheme切换后触发
3. 为什么ctrl和alt表现不同？
   ``` 
    " 这三个是等效的
    nmap <C-n> :cn<CR>
    nmap <C-N> :cn<CR>
    nmap <C-S-n> :cn<CR>
    " <A-N> == <A-S-n> != <A-n>
    nmap <A-n> :cn<CR>
    nmap <A-N> :cn<CR>
    nmap <A-S-n> :cn<CR>
   ``` 
4. 在asm类型处理函数里设置set syntax=nasm无效果，连autocmd也没效果，为什么
    ```
    autocmd FileType asm set syntax=nasm
    ```
5. 设置了CursorLine的背景色后，当前行Search/语法高亮字符的背景色能保留，但Mark插件高亮的背景色无法保留，这是为什么？
    ```
    set CursorLine
    hi CursorLine guibg=Grey30
    ```
6. 当文件较大时，tagbar插件容易在文件刚打开或文件写入后发生卡顿，能不能针对某些文件类型关闭tagbar的功能，如asm?
7. atom下YCM报错，ycm server restart...
8. Bug?
    >不知为何，当打开一些没有特殊处理的类型文件时
    >（不在 WOLFWZR_filetype_setting 函数处理的类型）
    >偶尔会出现状态栏位于最底一行，把命令行给侵占了
    >通过debug发现重现设置字体能解决这问题。
    >但根本原因还是未找到，为何字体会造成这样的影响？
