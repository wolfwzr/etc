" ***IMPORTANT README***
" Please ***DO NOT USE CHINESE*** in this file

if has("gui_running") && has("macunix")

    " Window Switch {{{1
    " nmap <A-j> <C-w>j
    nmap ∆ j
    " nmap <A-k> <C-w>k
    nmap ˚ k
    " nmap <A-h> <C-w>h
    nmap ˙ h
    " nmap <A-l> <C-w>l
    nmap ¬ l
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

    " QuickFix List Next/Prev item {{{1
    " <A-n>
    nmap ˜ :cn<CR>
    " <A-p>
    nmap π :cp<CR>
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
    "}}}1
    
    " Moving in Cmdline Mode {{{1
    " <A-h> <Left>
    cnoremap ˙ <Left>
    " <A-l> <Right>
    cnoremap ¬ <Right>
    " <A-H> <Home>
    cnoremap Ó <Home>
    " <A-L> <End>
    cnoremap Ò <End>
    " <A-f> <C-f>
    cnoremap ƒ <C-f>
    " <A-j> <Down>
    cnoremap ∆ <Down>
    " <A-k> <Up>
    cnoremap ˚ <Up>
    " }}}1

endif
