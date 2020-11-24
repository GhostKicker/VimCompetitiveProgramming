set nocompatible              " be iMproved, required
filetype off                  " required
set pythonthreedll=python38.dll

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'
<<<<<<< HEAD
Plugin 'morhetz/gruvbox'
"Plugin 'SirVer/ultisnips'
call vundle#end()            " required
filetype plugin indent on    " required
=======
"Plugin 'SirVer/ultisnips'
call vundle#end()            " required
filetype plugin indent on    " required

"----SNIPPETS----
"if has('python3')
"  silent! python3 1
"endif
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsEditSplit="vertical"
"----SNIPPETS----

>>>>>>> 78789114b3861207492425bb09e00d0cc282344c
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

<<<<<<< HEAD
"----SNIPPETS----
"if has('python3')
"  silent! python3 1
"endif
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsEditSplit="vertical"
"----SNIPPETS----

au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

syntax on
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
if has('gui_running')
    set background=dark
endif
let g:netrw_liststyle = 3

"wildmenu lazyredraw visualbell number ruler expandtab tabstop shiftwidth autoindent smarttab smartindent
set wmnu lz vb nu ru et ts=4 sw=4 ai sta si 
"set gfn=consolas "guifont
=======
syntax on
colorscheme desert
let g:netrw_liststyle = 3

"wildmenu lazyredraw visualbell number ruler expandtab tabstop shiftwidth autoindent smarttab smartindent
set wmnu lz vb nu ru et ts=4 sw=4 ai sta si 
set gfn=consolas "guifont
>>>>>>> 78789114b3861207492425bb09e00d0cc282344c
set encoding=utf-8
set t_Co=256

set spr sb "splitright splitbelow
set hls is ar "hlsearch incsearch autoread

set guioptions-=T
set guioptions-=m

set mouse=a
set showcmd

set whichwrap+=<,>,[,]
set backspace=indent,eol,start


"========================================
function! Setup()
    vs $HOME/VimProject/source.cpp
    silent only!
    silent tabonly!
    vs $HOME/VimProject/input.txt
    sp $HOME/VimProject/output.txt
    tabnew $HOME/VimProject/CompileMessage.txt
<<<<<<< HEAD
    tabfirst
    silent execute "normal \<C-w>h\<C-w>k"
    silent execute "normal \<C-w>20>"
endfunction

function! SetupBrute()
    call Setup()
    tabnew $HOME/VimProject/brute/generate.cpp
    tabnew $HOME/VimProject/brute/testsource.cpp
    tabfirst
    silent execute "normal \<C-w>h\<C-w>k"
endfunction

function! ClearThis()
if has('unix')
    w | silent !cp $HOME/VimProject/templates/core.cpp %
endif
if has('win32')
    w | silent !copy \%userprofile\%\\VimProject\\templates\\core.cpp %
endif
    redraw!
=======
    tabp
    silent execute "normal \<C-w>h\<C-w>k"
endfunction

function! ClearSource()
if has('unix')
    silent !cp $HOME/VimProject/templates/core.cpp $HOME/VimProject/source.cpp
endif
if has('win32')
    silent !copy \%userprofile\%\\VimProject\\templates\\core.cpp \%userprofile\%\\VimProject\\source.cpp
endif
    redraw!
endfunction

"======================================

if has('win32')
    nnoremap <silent> <F6> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wsign-conversion -Wno-unused-result -std=c++17 -g  % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && gdb %:r.exe \|\| echo FAIL <CR>
    nnoremap <silent> <F5> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wsign-conversion -Wno-unused-result -std=c++17 -O2 % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && %:r.exe \|\| echo FAIL <CR>
endif
if has('unix')
    nnoremap <silent> <F6> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wsign-conversion  -Wno-unused-result -std=c++17 -g  % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && gdb %:r \|\| echo FAIL <CR>
    nnoremap <silent> <F5> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wsign-conversion  -Wno-unused-result -std=c++17 -O2 % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && %:r \|\| echo FAIL <CR>
endif
 
vmap <C-c> "+y
nmap <C-a> ggVG
nmap <C-v> "+gp
vmap <C-v> "+gp
imap <C-v> <esc><C-v>a
nnoremap <C-b> <C-v>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")" 
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]" 
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}" 
inoremap <expr> <Enter> strpart(getline('.'), col('.')-2, 2) != "{}" ? "\<Enter>" : "\<CR>\<Tab>\<CR>\<Up>\<Esc>$a"

"-----ONLY--LOCAL------
let teach = 0
if teach == 1
    syntax off
    colorscheme shine
endif


"----------LATEX----------

function! Gomaga()
    tabnew 
    E $HOME/Desktop/Works/Maga
endfunction

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
func SpellCheckRu()
    set spell spelllang=ru
>>>>>>> 78789114b3861207492425bb09e00d0cc282344c
endfunction

function! StartBrute()
    wa
    !$HOME/VimProject/brute/script.sh
endfunction

<<<<<<< HEAD
"======================================


if has('win32')
    nnoremap <silent> <F5> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wno-unused-result -std=c++17 -O2 % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && %:r.exe \|\| echo FAIL <CR>
    nnoremap <silent> <F6> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wno-unused-result -std=c++17 -O0 -g % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && gdb %:r.exe \|\| echo FAIL <CR>
endif
if has('unix')
    nnoremap <silent> <F5> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wno-unused-result -std=c++17 -O2 % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && %:r \|\| echo FAIL <CR>
    nnoremap <silent> <F6> :wa<CR><C-w>h<C-w>k :!g++ -D_MY -Wall -Weffc++ -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wno-unused-result -std=c++17 -O0 -g % -o %:r 2> VimProject/CompileMessage.txt && echo SUCCESS && gdb %:r \|\| echo FAIL <CR>
endif
nnoremap <silent> <F7> :wa<CR>:!python3 %<CR>
 
vmap <C-c> "+y
nmap <C-a> ggVG
nmap <C-v> "+gp
vmap <C-v> "+gp
imap <C-v> <esc><C-v>a
nnoremap <C-b> <C-v>
imap <C-f> {}<Left><Enter>
inoremap <expr> <Enter> strpart(getline('.'), col('.')-2, 2) != "{}" ? "\<Enter>" : "\<CR>\<Tab>\<CR>\<Up>\<Esc>$a"



"-----ONLY--LOCAL------
let teach = 0
if teach == 1
    syntax off
    colorscheme shine
endif


function! Gomaga()
    tabnew 
    E $HOME/Desktop/Works/Maga
endfunction

let g:tex_flavor = 'latex'
if (has('win32'))
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif
func SpellCheckRu()
    set spell spelllang=ru
endfunction

func SpellCheckEng()
    set spell spelllang=en
=======
func OpenLatex(name)
    echo "$HOME/VimLatex/".a:name."/".a:name.".tex"
    execute "normal :o $HOME/VimLatex/".a:name."/".a:name.".tex"
    if filereadable("$HOME/VimLatex/".a:name."/".a:name.".tex")
        silent execute "normal :e $HOME/VimLatex/".a:name."/".a:name.".tex"
    else
        echo a:name." does not exist"
    endif
endfunction 

func CreateLatex(name)
    silent execute "normal :!mkdir ~/VimLatex/".a:name."\<CR>"
    silent execute "normal :!touch ~/VimLatex/".a:name."/".a:name.".tex\<CR>"
    call OpenLatex(a:name)
>>>>>>> 78789114b3861207492425bb09e00d0cc282344c
endfunction

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
autocmd filetype tex nnoremap j gj
autocmd filetype tex nnoremap k gk
autocmd filetype tex vnoremap j gj
autocmd filetype tex vnoremap k gk
autocmd filetype tex nnoremap о gj
autocmd filetype tex nnoremap л gk
autocmd filetype tex vnoremap о gj
autocmd filetype tex vnoremap л gk
autocmd filetype tex vnoremap <Up> g<Up>
autocmd filetype tex vnoremap <Down> g<Down>
autocmd filetype tex nnoremap <Up> g<Up>
autocmd filetype tex nnoremap <Down> g<Down> 
<<<<<<< HEAD
=======

>>>>>>> 78789114b3861207492425bb09e00d0cc282344c
