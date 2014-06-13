" ***IMPORTANT README***
" Please ***DO NOT USE CHINESE*** in this file

if has("macunix")
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
    " nmap Ô 3-
    " <A-+> Increase Window Height
    " nmap  3+
    " <A-<> Decrease Windows Width
    " nmap Ó 3<
    " <A->> Increase Windows Width
    " nmap Ò 3>
    " }}}1
    
    " Back/Forword Jump {{{1
    " alt-o
    nmap ø 
    " alt-i
    nmap ˆ 	
    " }}}1
    
    " GUI Window Size Adjust {{{1
    if has("gui_running")
        " <A-S-j>
        " nmap <A-S-j> :set lines+=1<CR>
        " <A-S-k>
        " nmap <A-S-k> :set lines-=1<CR>
        " <A-S-h>
        " nmap <A-S-h> :set columns-=2<CR>
        " <A-S-l>
        " nmap <A-S-l> :set columns+=2<CR>
    endif
    " }}}1
endif
