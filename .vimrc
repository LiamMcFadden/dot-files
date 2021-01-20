"pathogen n da gudno
execute pathogen#infect()
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

"allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"swp files n stuff
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"Some default settings:
set number
syntax enable

"tab settings
set tabstop=4  "num spaces that \t is equal to
set softtabstop=4  "num spaces when editing
set expandtab  "makes tabs spaces

set showcmd  "shows most recent command
set cursorline  "highlight curr line
filetype indent on  "indent in a filetype specific way
set wildmenu  "visual autocomplete
set lazyredraw  "only redraw screen when needed

"searching settings
set showmatch  "show matching parenthesis, quotes, etc.
set incsearch  "search as chars are entered
set hlsearch  "highlight matches

"gets rid of search highlight when 'space' is pressed
nnoremap ,<space> :nohlsearch<CR> 

"folding settings
set foldenable  
set foldlevelstart=10 
set foldnestmax=10
"'space' to open/close folds
nnoremap <space> za  
set foldmethod=indent

"go to beginning / end of a line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

"visually select the last characters added in 'insert' mode
nnoremap gV `[v`]

"leader stuff
let mapleader=","
nnoremap <leader>u :GundoToggle<CR>

"da personal functions-------------------------------

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
