bash配置和vim配置
=================


vim配置
-------


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
    - 将:cn映射成<C-n>, :cp映射成<C-N>
    - mac下无法映射<A-->
- bash

存在的问题
----------

1. help类型的buffer无法通过autocmd BufNew,BufNewFile事件触发动作，为什么？目前是通过autocmd FileType help cmd来实现help类型的功能定制的
2. autocmd ColorScheme事件无法在ColorScheme切换后触发

