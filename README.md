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
    - YouCompleteMe配置，感觉在一些文件中不会补全，如asm
    - 代码块的补全插件
    - mac下无法映射<A-->
    - 许多<buffer>map是否把<Leader>改为<localleader>?
    - nnoremap <A-u> 将当前单词变大写 gUaw
    - inoremap <A-u> 将当前单词变大写
    - abbr for^ ...
    - Ultisnap安装了但还不清楚用法
    - command模式下 Alt-w toggle cwindow
    - 默认nofoldenable, 按Alt-f来toggle foldenable
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
