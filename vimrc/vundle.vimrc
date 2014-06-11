" a插件 {{{1
" jump between .h and .c files
Bundle 'vim-scripts/a.vim'
nmap <Leader>a :A<CR>

" Mark插件 {{{1
" Mark different color with different string
Bundle 'vim-scripts/Mark'

" NERDTree插件 {{{1
" 优雅地文件浏览
" 使用方法：
" :NERDTree 或 sf
" 在文件浏览界面可用的部分快捷键：
"    o  - 打开文件
"    go - 打开文件但光标停留在浏览界面
"    i  - 在新水平窗口中打开文件
"    gi - 在新水平窗口中打开文件但光标停留在浏览界面
"    s  - 在新垂直窗口中打开文件
"    gs - 在新垂直窗口中打开文件但光标停留在浏览界面
"    t  - 在新标签中打开文件 
"    T  - 在新标签中打开文件但光标停留在浏览界面
"    q  - 关闭浏览界面
" 可使用let g:NERDTreeWinSize=20设置浏览界面的宽度
Bundle 'scrooloose/nerdtree'
let g:NERDTreeWinSize=30
nmap <Leader>u :NERDTree<CR>
if has("autocmd")
    autocmd FileType nerdtree nmap <buffer> <Leader>u q
endif

" ctrlp插件 {{{1
" 优雅地查找文件
" 使用方法：
" ctrl-p 或 s-<space>
" 在查找界面可用ctrl-j/k来上下选择文件
" 文件匹配不必连续，但要顺序，如abc可匹配文件
"    ./hello/about/block/ack/readme.md
Bundle 'kien/ctrlp.vim'
nmap <Leader>o <C-p>

" vim-markdown插件 {{{1
" 提供markdown的代码高亮及折叠方法
Bundle 'plasticboy/vim-markdown'

" YouCompleteMe插件 {{{1
" 根据语义自动补全代码
" 还能实时编译，显示编译告警
" 使用方法：
" 1. 输入过程中有可选匹配项时会自动弹出下拉列表，可使用tab选择
" 2. 匹配过程中不必从头完全匹配，如输入hw，
"    下拉列表中可能出现oh_hello_world选项
Bundle 'Valloric/YouCompleteMe'
if has("macunix")
    let g:ycm_global_ycm_extra_conf = '/Users/wolfwzr/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_c_conf.py'
endif

" colorselector插件 {{{1
Bundle 'c9s/colorselector.vim'

" vim-colorscheme插件 {{{1
" 优雅的挑选配色方案
" 使用方法：
" :SelectColorS
" n - 预览下一个配色方案
" p - 预览上一个配色方案
Bundle 'flazz/vim-colorschemes'

" tarbar插件 {{{1
" 显示符号列表（宏、类、函数、变量等）
" 使用方法：
" :TagbarToggle 或 <Leader>l
Bundle 'majutsushi/tagbar'
let g:tagbar_width=30
nmap <Leader>l :TagbarToggle<CR>
