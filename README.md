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
    - 一个更好的Tab跳转快捷键
    - YouCompleteMe配置，感觉在一些文件中不会补全，如asm
    - 各tab栏配色
    - iunmap keymap from a.vim
    - mac下无法映射<A-->
    - <Leader>hg vimgrep ... 
        - 借助插件
        - 使用buffers得到buffer列表，再使用grep pattern buffer_list | cw来查询, 参考bufferexplorer.zip插件的GetBufferInfo函数
    - 多个quickfix list的管理
        - cw (Quickfix List Window)
        - colder
        - cnewer
        - lw (Location List Window)
        - lolder
        - lnewer
    - 考虑powerline
- bash

存在的疑问
----------

1. help类型的buffer无法通过autocmd BufNew,BufNewFile事件触发动作，为什么？目前是通过autocmd FileType help cmd来实现help类型的功能定制的
2. autocmd ColorScheme事件无法在ColorScheme切换后触发
3. 为什么ctrl和alt表现不同？
    - nmap <C-n> :cn<CR>
    - nmap <C-N> :cn<CR>
    - nmap <C-S-n> :cn<CR>
    - 上面三个是等效的
    - nmap <A-n> :cn<CR>
    - nmap <A-N> :cn<CR>
    - nmap <A-S-n> :cn<CR>
    - 上面三个<A-N>与<A-S-n>是等效的，但与<A-n>不等效


