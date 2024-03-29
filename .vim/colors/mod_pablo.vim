" Custom version of default colorscheme 'pablo'

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mod_pablo"

highlight Comment	 ctermfg=8						  guifg=#808080
highlight Constant	 ctermfg=14			   cterm=none guifg=#00ffff				  gui=none
highlight Identifier ctermfg=6						  guifg=#00c0c0
highlight Statement  ctermfg=3			   cterm=bold guifg=#c0c000				  gui=bold
highlight PreProc	 ctermfg=10						  guifg=#00ff00
highlight Type		 ctermfg=2						  guifg=#00c000
highlight Special	 ctermfg=12						  guifg=#0000ff
highlight Error					ctermbg=9							guibg=#ff0000
highlight Todo		 ctermfg=4	ctermbg=3			  guifg=#000080 guibg=#c0c000
highlight Directory  ctermfg=2						  guifg=#00c000
highlight StatusLine ctermfg=0 ctermbg=250 cterm=none guifg=#5f87af guibg=#0000ff gui=none
highlight Normal									  guifg=#ffffff guibg=#000000
highlight Search				ctermbg=3							guibg=#c0c000
highlight LineNr     ctermfg=Gray

hi User1 ctermfg=182 ctermbg=160
hi User2 ctermfg=black ctermbg=173
hi User3 ctermfg=100 ctermbg=229
hi User4 ctermfg=64 ctermbg=48
hi User5 ctermfg=22 ctermbg=40
hi User7 ctermfg=231 ctermbg=1 gui=bold
hi User8 ctermfg=231 ctermbg=25
hi User9 ctermfg=231 ctermbg=54
hi User0 ctermfg=231 ctermbg=69  
