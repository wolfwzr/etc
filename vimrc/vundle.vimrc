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
Bundle 'scrooloose/nerdtree'
let g:NERDTreeWinSize=30
" 本函数功能：
"   打开或关闭 NERDTree 窗口 **并且调整窗口宽度**
"   1. 打开 NERDTree 窗口，并将 vim 窗口宽度增加 g:NERDTreeWinSize
"   2. 关闭 NERDTree 窗口，并将 vim 窗口宽度减少 g:NERDTreeWinSize
function WOLFWZR_nerdtree_toggle()
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
nnoremap <Leader>u :call WOLFWZR_nerdtree_toggle() <CR>
" }}}1

" tagbar插件 {{{1
" 显示符号列表（宏、类、函数、变量等）
" 使用方法：
" :TagbarToggle 或 <Leader>l
Bundle 'majutsushi/tagbar'
let g:tagbar_width=30
" 本函数功能：
"   打开或关闭 Tagbar 窗口 **并且调整窗口宽度**
"   1. 打开 Tagbar 窗口，并将 vim 窗口宽度增加 g:tagbar_width
"   2. 关闭 Tagbar 窗口，并将 vim 窗口宽度减少 g:tagbar_width
function WOLFWZR_tagbar_toggle()
    if has("gui_running")
        let l:vim_window_width = &columns
        " Tagbar now is opened
        if bufwinnr("__Tagbar__") != -1
            TagbarToggle
            let l:vim_window_width -= g:tagbar_width + 1
            execute 'set columns='.l:vim_window_width
        else " Tagbar now is closed
            let l:vim_window_width += g:tagbar_width + 1
            execute 'set columns='.l:vim_window_width
            TagbarToggle
        endif
    else
        TagbarToggle
    endif
endfunction
nnoremap <Leader>l :call WOLFWZR_tagbar_toggle()<CR>
augroup tagbar_autocmd
    autocmd FileType tagbar 
        \ nnoremap <buffer> J <C-d>|
        \ nnoremap <buffer> K <C-u>
augroup end
" }}}1

" ctrlp插件 {{{1
" 优雅地查找文件
" 使用方法：
" ctrl-p 或 s-<space>
" 在查找界面可用ctrl-j/k来上下选择文件
" 文件匹配不必连续，但要顺序，如abc可匹配文件
"    ./hello/about/block/ack/readme.md
Bundle 'kien/ctrlp.vim'
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_user_command = 'find %s -type f \( \( -path "*/.git/*" -o -path "*/.svn/*" -o -path "*/.hg/*" -o -path "*.swp" -o -path "*.so" -o -path "*.a" -o -path "*.o" -o -path "*.zip" -o -path "a.out" -o -path "*.tar.*" -o -path "*.tar" -o -path "*.rar" \) -prune -o -print \)'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
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
Bundle 'plasticboy/vim-markdown'
" }}}1

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
" }}}1

" colorselector插件 {{{1
Bundle 'c9s/colorselector.vim'
" }}}1

" vim-colorscheme插件 {{{1
" 优雅的挑选配色方案
" 使用方法：
" :SelectColorS
" n - 预览下一个配色方案
" p - 预览上一个配色方案
Bundle 'flazz/vim-colorschemes'
" }}}1

" bufexplorer.zip插件 {{{1
Bundle 'vim-scripts/bufexplorer.zip'
let g:bufExplorerShowNoName = 1
let g:bufExplorerDisableDefaultKeyMapping = 1
"nnoremap <Leader>e :BufExplorer<CR>
"nnoremap <Leader>e :CtrlPBuffer<CR>
" nnoremap <Leader>e :BufExplorerHorizontalSplit<CR>
" }}}1

" Buffer-grep插件 {{{1
" 在所有Buffer中搜索并放到新的quickfix窗口中然后打开quickfix窗口
" 使用方法
" :Bgrep pattern
Bundle 'vim-scripts/Buffer-grep'
" }}}1

" Lokaltog/vim-easymotion插件 {{{1
Bundle "Lokaltog/vim-easymotion"
" }}}1

