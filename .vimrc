"░░░██╗░░░██╗██╗███╗░░░███╗██████╗░░█████╗░
"░░░██║░░░██║██║████╗░████║██╔══██╗██╔══██╗
"░░░╚██╗░██╔╝██║██╔████╔██║██████╔╝██║░░╚═╝
"░░░░╚████╔╝░██║██║╚██╔╝██║██╔══██╗██║░░██╗  
"██╗░░╚██╔╝░░██║██║░╚═╝░██║██║░░██║╚█████╔╝   
"╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░

""""""""""""""""
" Plugin/startup
""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on
set ttimeoutlen=50
set nocompatible

set autoread
" pathogen n da gudno
execute pathogen#infect()
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" ADD PLUGINS HERE "
call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'

call plug#end()

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"""""""""""""""""""
" swp files n stuff
"""""""""""""""""""
set noswapfile
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


""""""""""""""""""""""""
" Some general settings:
""""""""""""""""""""""""
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set scrolloff=3 " keep 3 lines below/above the cursor

set ignorecase
set ruler
set relativenumber
set number
syntax enable

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Allow mouse navigation "
set mouse=a


"""""""""""""""""""
" Colors and things
"""""""""""""""""""
" disable markdown cus it's annoying "
autocmd! bufreadpost *.md set syntax=off

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme gruvbox
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""
" tab settings
""""""""""""""
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" delete entire tab with one keystroke
set softtabstop=4
set autoindent



""""""""""""""""""""""""""""""""""""""
" settings for the other type of tabs:
""""""""""""""""""""""""""""""""""""""
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""
" Some interface stuff
""""""""""""""""""""""
set showcmd  " shows most recent command
filetype indent on  " indent in a filetype specific way
set wildmenu  " visual autocomplete
set lazyredraw  " only redraw screen when needed

" searching settings
set showmatch  " show matching parenthesis, quotes, etc.
set incsearch  " search as chars are entered
set hlsearch  " highlight matches

" gets rid of search highlight when 'space' is pressed
nnoremap ,<space> :nohlsearch<CR> 

" Always show the status line
set laststatus=2

set cursorline

" Format the status line
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ \ \ %P  
" BETTER STATUS LINE
" source: https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
" set statusline=
" set statusline+=%7*\[%n]                                  "buffernr
" set statusline+=%1*\ %<%F\ %m\                                "File+path
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %r%w\ %P\ \                      "Modified? Readonly? Top/bot.
" " set da colors --> this goes in current colorscheme file
" " now set it up to change the status line based on mode
" if version >= 700
"   au InsertEnter * hi User8 term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"   au InsertLeave * hi User8 term=reverse ctermfg=0 ctermbg=69 gui=bold,reverse
" endif

" Status line that isn't as rainbowy
" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ "n"      : "Normal",
    \ "no"     : "Normal·Operator Pending",
    \ "v"      : "Visual",
    \ "V"      : "V·Line",
    \ "\<C-v>" : "V·Block",
    \ "s"      : "Select",
    \ "S"      : "S·Line",
    \ "^S"     : "S·Block",
    \ "i"      : "Insert",
    \ "R"      : "Replace",
    \ "Rv"     : "V·Replace",
    \ "c"      : "Command",
    \ "cv"     : "Vim Ex",
    \ "ce"     : "Ex",
    \ "r"      : "Prompt",
    \ "rm"     : "More",
    \ "r?"     : "Confirm",
    \ "!"      : "Shell",
    \ "t"      : "Terminal"
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" Turn cursor to a line when in insert mode
" 
" Options:
"   0 -> blinking block
"   1 -> blinking block (default)
"   2 -> steady block
"   3 -> blinking underline
"   4 -> steady underline
"   5 -> blinking bar (xterm)
"   6 -> steady bar (xterm)
let &t_SI = "\e[6 q"
let &t_SR = "\e[2 q"
let &t_EI = "\e[1 q"


""""""""""""""""""
" folding settings
""""""""""""""""""
set foldenable  
set foldlevelstart=10 
set foldnestmax=10
" 'space' to open/close folds
nnoremap <space> za  
set foldmethod=indent


""""""""""
" Bindings
""""""""""
" go to beginning / end of a line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" visually select the last characters added in 'insert' mode
nnoremap gV `[v`]

" leader stuff
let mapleader=","
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>n :call ToggleNumber()<CR>
nnoremap <leader>s :call ToggleSpell()<CR>
nnoremap <leader>p :call TogglePaste()<CR>
nnoremap <leader>w :call ToggleWrap()<CR>


"""""""""""""""""""""""
" da personal functions
"""""""""""""""""""""""
"  toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! HighlightSearch()
	if &hls
		return 'H'
	else
		return ''
	endif
endfunction

function! ToggleSpell()
    if(&spell == 1)    
        setlocal nospell
    else
        setlocal spell
    endif
endfunction

function! TogglePaste()
    if (&paste == 1)
        set nopaste
		echo "nopaste"
    else 
        set paste
		echo "paste"
    endif
endfunc


function! ToggleWrap()
    if (&wrap)
        set nowrap
    else
        set wrap
    endif
endfunction


