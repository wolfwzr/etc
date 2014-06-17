" ***IMPORTANT README***
" Please ***DO NOT USE CHINESE*** in this file

if has("gui_running") && has("macunix")

    " GUI Window Position Adjust {{{1
    " <A-j>
    "nmap <A-j> :call WOLFWZR_winpos_adjust(0,10)<CR>
    " <A-k>
    "nmap <A-k> :call WOLFWZR_winpos_adjust(0,-10)<CR>
    " <A-h>
    "nmap <A-h> :call WOLFWZR_winpos_adjust(-20,0)<CR>
    " <A-l>
    "nmap <A-l> :call WOLFWZR_winpos_adjust(20,0)<CR>
    " }}}1
    
    " GUI Window Size Adjust {{{1
    " <A-S-j>
    nmap Ô :set lines+=1<CR>
    " <A-S-k>
    nmap  :set lines-=1<CR>
    " <A-S-h>
    nmap Ó :set columns-=2<CR>
    " <A-S-l>
    nmap Ò :set columns+=2<CR>
    " }}}1

    " Window Size Adjust {{{1
    " <A--> Decrease Window Height
    nmap – 3-
    " <A-+> Increase Window Height
    nmap ± 3+
    " <A-<> Decrease Windows Width
    nmap ¯ 3<
    " <A->> Increase Windows Width
    nmap ˘ 3>
    " }}}1
    
    " Back/Forword Jump {{{1
    " alt-o
    nmap ø 
    " alt-i
    nmap ˆ 	
    " }}}1
    
    " Copy/Cut/Paste {{{1
    " Copy <A-c>
    nnoremap ç viw"+y
    vnoremap ç "+y
    inoremap ç <ESC>viw"+yea
    " Cut <A-x>
    nnoremap ≈ viw"+x
    vnoremap ≈ "+x
    inoremap ≈ <ESC>viw"+xea
    " Paste <A-v>
    nnoremap √ "+p
    inoremap √ <ESC>"+p
    "cnoremap <A-v> <C-r>+
    "}}}1
    
    " Quick move in command line mode {{{1
    " <A-h>
    "cnoremap <A-h> <Left>
    " <A-l>
    "cnoremap <A-l> <Right>
    " <A-H>
    "cnoremap <A-H> <Home>
    " <A-L>
    "cnoremap <A-L> <End>
    " <A-f>
    "cnoremap <A-f> <C-f>
    " <A-j>
    "cnoremap <A-j> <Down>
    " <A-k>
    "cnoremap <A-k> <Up>
    "}}}1
    
    " QuickFix Next/Prev Item {{{1
    " <A-n>
    "nnoremap <A-n> :cn<CR>
    " <A-n>
    "nnoremap <A-p> :cp<CR>
    " }}}1
endif
