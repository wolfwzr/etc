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

注意事项
--------
- Mark.vim 插件需要修改(autocmd!问题)，具体看 vundle.vimrc
- 如果 autocmd 注册事件未响应时，使用 :autocmd {Event} 查看是否有对应注册，若没有，从以下几方面发现问题：
    - autocmd 语句是否被执行
    - autocmd 命令不指定组时使用的是默认组，检查是否哪里使用了autocmd!语句，该语句会先清空当前组的所以事件，可以使用 :verbose autocmd {Event} 来检查，或直接检查自己的配置或插件代码。
    - 最好在自己的 Group 内进行 autocmd 以避免上述问题（同时还能避免重复注册），如：
    ```
    augroup wolfwzr_autocmd
        au!
        autocmd BufNew :echom "BufNew"
    augroup END
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
    - 在 VimBufEnter 事件触发 filetype_setting 的基础上
        - 根据文件行数来决定是否启用 CursorLine
        - qf 类型中取消或定义淡淡的 Search
- bash

存在的疑问
----------

1. help类型的buffer无法通过autocmd BufNew,BufNewFile事件触发动作，为什么？目前是通过autocmd FileType help cmd来实现help类型的功能定制的
3. 为什么 VIM 能区别 Alt + j 和 Alt + Shift + j, 却不能区分 Ctrl +j 和 Ctrl + Shift + j ?
4. 在asm类型处理函数里设置set syntax=nasm无效果，连autocmd也没效果，为什么
    ```
    autocmd FileType asm set syntax=nasm
    ```
6. 当文件较大时，tagbar插件容易在文件刚打开或文件写入后发生卡顿，能不能针对某些文件类型关闭tagbar的功能，如asm?
7. atom下YCM报错，ycm server restart...
8. Bug?
    >不知为何，当打开一些没有特殊处理的类型文件时
    >（不在 WOLFWZR_filetype_setting 函数处理的类型）
    >偶尔会出现状态栏位于最底一行，把命令行给侵占了
    >通过debug发现重现设置字体能解决这问题。
    >但根本原因还是未找到，为何字体会造成这样的影响？

9. noft Search is still underline style(no effect in osx)
