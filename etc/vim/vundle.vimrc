" a插件 {{{1
" jump between .h and .c files
Bundle 'vim-scripts/a.vim'
nnoremap <Leader>a :A<CR>
" if mapcheck("<Leader>is", "i") != ""
"     set columns=100
"     iunmap <Leader>is
" endif
" if mapcheck("<Leader>ih", "i") != ""
"     iunmap <Leader>ih
" endif
" if mapcheck("<Leader>ihn", "i") != ""
"     iunmap <Leader>ihn
" endif
" }}}1

" Mark插件 {{{1
" Mark different color with different string
Bundle 'vim-scripts/Mark'
" 注意，Mark 插件会使用 autocmd! 注册事件，如下：
"   autocmd! BufWinEnter * call s:UpdateMark()
" 这将会清除默认 group 的所有已注册 BufWinEnter 事件，所以应该将它放到组里
"   augroup mark
"       autocmd! BufWinEnter * call s:UpdateMark()
"   augroup END
" }}}1

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
" :NERDTreeFind - 打开 NERDTree 窗口并定位到当前文件
Bundle 'scrooloose/nerdtree'
let g:NERDTreeWinSize=25
" 检测NERDTree是否打开
"if exists('t:NERDTreeBufName')
"    let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
"else
"    let nerdtree_open = 0
"endif
" 本函数功能：
"   打开或关闭 NERDTree 窗口 **并且调整窗口宽度**
"   1. 打开 NERDTree 窗口，并将 vim 窗口宽度增加 g:NERDTreeWinSize
"   2. 关闭 NERDTree 窗口，并将 vim 窗口宽度减少 g:NERDTreeWinSize
function W_nerdtree_toggle()
    NERDTreeToggle
    if has("gui_running")
        let l:vim_window_width = &columns
        " NERDTree Window from closed to open
        if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
            let l:vim_window_width += g:NERDTreeWinSize + 1
        else " NERDTree Window from open to closed
            let l:vim_window_width -= g:NERDTreeWinSize + 1
        endif
        execute 'set columns='.l:vim_window_width
    endif
endfunction
nnoremap <Leader>e :call W_nerdtree_toggle()<CR>
"if has("autocmd")
"    这个nnoremap未能生效，因为被nerdtree插件覆盖了吗？
"    autocmd FileType nerdtree nnoremap <buffer> q :call W_nerdtree_toggle()<CR>
"endif
" }}}1

" tagbar插件 {{{1
" 显示符号列表（宏、类、函数、变量等）
" 使用方法：
" :TagbarToggle 或 <Leader>l
Bundle 'majutsushi/tagbar'
" 检测Tagbar是否打开
"let tagbar_open = bufwinnr('__Tagbar__') != -1
let g:tagbar_width=28
" 本函数功能：（发现g:tagbar_expand参数可解决该问题，不再自己实现）
"   打开或关闭 Tagbar 窗口 **并且调整窗口宽度**
"   1. 打开 Tagbar 窗口，并将 vim 窗口宽度增加 g:tagbar_width
"   2. 关闭 Tagbar 窗口，并将 vim 窗口宽度减少 g:tagbar_width
"function W_tagbar_toggle()
"    if has("gui_running")
"        let l:vim_window_width = &columns
"        " Tagbar now is opened
"        if bufwinnr("__Tagbar__") != -1
"            TagbarToggle
"            let l:vim_window_width -= g:tagbar_width + 1
"            execute 'set columns='.l:vim_window_width
"        else " Tagbar now is closed
"            let l:vim_window_width += g:tagbar_width + 1
"            execute 'set columns='.l:vim_window_width
"            TagbarToggle
"        endif
"    else
"        TagbarToggle
"    endif
"endfunction
"nnoremap <Leader>t :call W_tagbar_toggle()<CR>
let g:tagbar_expand = 1
nnoremap <Leader>t :TagbarToggle<CR>
" }}}1

" ctrlp插件 {{{1
" 优雅地查找文件
" 使用方法：
" ctrl-p 或 s-<space>
" 在查找界面可用ctrl-j/k来上下选择文件
" 文件匹配不必连续，但要顺序，如abc可匹配文件
"    ./hello/about/block/ack/readme.md
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
" nnoremap <Leader>b :CtrlPBuffer<CR>
" nnoremap \| :CtrlPBuffer<CR>
" CtrlP查找的文件列表
let g:ctrlp_user_command = 'find %s -type f \( \( -path "*/.git/*" -o -path "*/.svn/*" -o -path "*/.hg/*" -o -path "*.swp" -o -path "*.so" -o -path "*.a" -o -path "*.o" -o -path "*.zip" -o -path "a.out" -o -path "*.tar.*" -o -path "*.tar" -o -path "*.rar" \) -prune -o -print \)'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'c'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.a,*.so,*.swp,*.zip,*.o,a.out
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
" }}}1

" vim-markdown插件 {{{1
" 提供markdown的代码高亮及折叠方法
" Mappings:
"   ]] : go to next header
"   [[ : go to prev header
"   ][ : go to next sibling header
"   [] : go to prev sibling header
"   ]c : go to current header
"   ]u : go to parrent header
" Commands:
"   :Toc : create Table of Contents in a quickfix vertical window
"   :Toch : same as Toc, but in a horizontal window
"   :Toct : same as Toc, but in a new tab
"   :Tocv : same as Toc, for sysmetry(对称) with :Toch and :Tocv
Bundle 'plasticboy/vim-markdown'
" let g:vim_markdown_no_default_key_mappings=1
" let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=2
" }}}1

" YouCompleteMe插件 {{{1
" 根据语义自动补全代码
" 还能实时编译，显示编译告警
" 使用方法：
" 1. 输入过程中有可选匹配项时会自动弹出下拉列表，可使用tab选择
" 2. 匹配过程中不必从头完全匹配
"    如输入hw，下拉列表中可能出现oh_hello_world选项
Bundle 'Valloric/YouCompleteMe'
if has("macunix")
    let g:ycm_global_ycm_extra_conf = '/Users/wolfwzr/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_c_conf.py'
endif
" }}}1

" colorselector插件 {{{1
" 优雅的挑选配色方案
" 使用方法：
" :SelectColorS
"   n - 预览下一个配色方案
"   p - 预览上一个配色方案
" :EditCurrentColorS 编辑当前配色方案
Bundle 'c9s/colorselector.vim'
" }}}1

" vim-colorscheme插件 {{{1
" 海量配色方案
Bundle 'flazz/vim-colorschemes'
" }}}1

" Buffer-grep插件 {{{1
" 在所有Buffer中搜索并放到新的quickfix窗口中然后打开quickfix窗口
" 使用方法
" :Bgrep pattern
Bundle 'vim-scripts/Buffer-grep'
" }}}1

" powerline插件 "{{{
Bundle 'Lokaltog/vim-powerline'
" fancy最漂亮，但要求字体支持一些特殊字符
" 若当前使用的字体不支持这些字符，给字体打个补丁就行了,具体如下：
" 1. linux 系统
"   1. 安装fontforge
"       zypper install fontforge
"   2. 找到powerline自带的fontpatcher程序，如：
"       ~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher
"   3. 找到当前使用的字体的文件，如:
"       /usr/share/font/truetype/YaHei.Consolas.1.12.ttf
"   4. 执行以下命令给字体打补丁：
"       fontforge -script ~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher /usr/share/font/truetype/YaHei.Consolas.1.12.ttf
"   5. 执行完以上命令后在当前目录应该生成了一个新字体文件，将该字体安装
"       /usr/share/font/truetype/YaHei.Consolas.1.12-Powerline.ttf
"   6. 在vim做如下设置：
"       set guifont=YaHei\ Consolas\ Hybrid\ for\ Powerline\ 14
"           \,YaHei\ Consolas\ Hybrid\ 14
"       let g:Powerline_symbols = 'fancy'
" 2. Mac OSX 系统 
" 参考:
" 本地版: ~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher
" 在线版: https://powerline.readthedocs.org/en/latest/fontpatching.html
"
if has("gui_running")
    let g:Powerline_symbols = 'fancy'
else
    let g:Powerline_symbols = 'unicode'
    "let g:Powerline_symbols = 'compatible'
endif
let g:Powerline_stl_path_style = 'short'
"}}}

" indentLine插件 {{{1
" 在代码中显示垂直对齐线
"   适合于空格缩进的代码，
"   如果是Tab缩进则没必要使用插件，使用VIM自带的功能就好了：
"       :set list
"       :set listchars=tab:\|\ 
" 使用方法
" :IndentLinesEnable
Bundle 'Yggdroot/indentLine'
" IndentLinesEnable
" 设置对齐线的背景色
"   let g:indentLine_color_term = 239
"   let g:indentLine_color_gui = '#A4E57E'
"   hi Conceal ...
" 设置对齐线字符(│,|,¦,┊,┆,︙)
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_faster = 1
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_fileType = ['c', 'cpp', 'python', 'sh']
let g:indentLine_fileTypeExclude = ['man', 'help', 'qf']
" }}}1

" vim-easymotion插件 {{{
Bundle 'Lokaltog/vim-easymotion'
map <C-j> <Plug>(easymotion-j)
map <C-k> <Plug>(easymotion-k)
map s     <Plug>(easymotion-s)
map <C-/> <Plug>(easymotion-sn)
"}}}

" rainbow插件 {{{
Bundle 'oblitum/rainbow'
"let g:rainbow_guifgs : [
"    \ '#458588',
"    \ '#b16286',
"    \ '#cc241d',
"    \ '#d65d0e',
"    \ '#458588',
"    \ '#b16286',
"    \ '#cc241d',
"    \ '#d65d0e',
"    \ '#458588',
"    \ '#b16286',
"    \ '#cc241d',
"    \ '#d65d0e',
"    \ '#458588',
"    \ '#b16286',
"    \ '#cc241d',
"    \ '#d65d0e',
"    \ ]
let g:rainbow_guifgs = [
    \ '#DCC6AE',
    \ '#b8bb26',
    \ '#8ccbea',
    \ '#8ec07c',
    \ '#c3e5d8',
    \ '#afd700',
    \ '#fabd2f',
    \ '#68CDEC',
    \ '#a4e57e',
    \ '#ffdb72',
    \ '#9999ff',
    \ '#ffb3ff',
    \ '#C8EC98',
    \ '#fc5a4d',
    \ '#ff7272',
    \ '#fb4934',
    \ ]
"au FileType c,cpp,objc,objcpp call rainbow#load()
"let g:rainbow_active = 1
":RainbowToggle  --you can use it to toggle this plugin.
":RainbowLoad    --you can use it to load/reload this plugin.
" See: https://github.com/oblitum/rainbow
" }}}

" tabular插件 {{{
Bundle 'godlygeek/tabular'
" See: https://github.com/godlygeek/tabular
" }}}

" 未启用插件

" bufexplorer.zip插件(未启用) {{{1
" 安装了CtrlP后使用CtrlP的Buffer搜索功能也很方便，命令:CtrlPBuffer
" Bundle 'vim-scripts/bufexplorer.zip'
" let g:bufExplorerShowNoName = 1
" let g:bufExplorerDisableDefaultKeyMapping = 1
" nnoremap <Leader>e :BufExplorer<CR>
" nnoremap <Leader>e :BufExplorerHorizontalSplit<CR>
" }}}1
" UltiSnip插件(未启用) {{{
" 代码块的补全
" Bundle 'sirver/UltiSnips'
"}}}

" vim: set ft=vim:
