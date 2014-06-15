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
    
    " Copy/Paste {{{1
    " vmap <A-c> "+y
    vmap ç "+y
    " imap <A-v> <ESC>"+pa
    imap √ <ESC>"+pa
    " nmap <A-v> "+p
    nmap √ "+p
    "}}}1

endif
