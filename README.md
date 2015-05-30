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
    - 代码块补全插件Ultisnap安装了但还不清楚用法
    - Make Use of <Fn> <S-Fn> \<Fn>
    - Make Use of [a-z][0-9], <Leader>1
- bash

存在的疑问
----------

1. 为什么 VIM 能区别 Alt + j 和 Alt + Shift + j, 却不能区分 Ctrl +j 和 Ctrl + Shift + j ?
2. 在asm类型处理函数里设置set syntax=nasm无效果，连autocmd也没效果，为什么
    ```
    autocmd FileType asm set syntax=nasm
    ```
3. noft Search is still underline style(no effect in osx)

提示
----

1. 保持 SSH 会话不超时
    ```
    cat ServerAliveInterval 100 >> /etc/ssh/ssh_config
    ```
