" ***IMPORTANT README***
" Please ***DO NOT USE CHINESE*** in this file

if has("gui_running") && has("macunix")
    " Alt(Opt) Key was used ad GM, so avoid use it

    " GUI Window Position Adjust {{{1
    " <A-j>
    "nnoremap ∆ :call W_winpos_adjust(0,10)<CR>
    " <A-k>
    "nnoremap ˚ :call W_winpos_adjust(0,-10)<CR>
    " <A-h>
    "nnoremap ˙ :call W_winpos_adjust(-20,0)<CR>
    " <A-l>
    "nnoremap ¬ :call W_winpos_adjust(20,0)<CR>
    " }}}1

    " GUI Window Size Adjust {{{1
    " <A-S-j>
    "nnoremap Ô :set lines+=1<CR>
    " <A-S-k>
    "nnoremap  :set lines-=1<CR>
    " <A-S-h>
    "nnoremap Ó :set columns-=2<CR>
    " <A-S-l>
    "nnoremap Ò :set columns+=2<CR>
    " }}}1

    " Window Size Adjust {{{1
    " <A--> Decrease Window Height
    "nnoremap – 3-
    " <A-+> Increase Window Height
    " nnoremap ± 3+
    " <A-<> Decrease Windows Width
    " nnoremap ¯ 3<
    " <A->> Increase Windows Width
    " nnoremap ˘ 3>
    " }}}1
endif

" vim: set ft=vim:
