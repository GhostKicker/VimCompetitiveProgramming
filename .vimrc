set nocompatible              " be iMproved, required
filetype off                  " required
set pythonthreedll=python38.dll
set exrc
set secure

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'
Plugin 'morhetz/gruvbox'
Plugin 'grwlf/xkb-switch'
"Plugin 'valloric/youcompleteme'
"Plugin 'SirVer/ultisnips'
call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0

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
set gfn=consolas "guifont
set encoding=utf-8
set t_Co=256

" Disable autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set spr sb "splitright splitbelow
set hls is ar "hlsearch incsearch autoread

set guioptions-=T
set guioptions-=m

set mouse=a 
set showcmd

set whichwrap+=<,>,[,]
set backspace=indent,eol,start

function! Setup()
    vs $HOME/VimProject/source.cpp
    silent only!
    silent tabonly!
    vs $HOME/VimProject/input.txt
    sp $HOME/VimProject/output.txt
    tabnew $HOME/VimProject/CompileMessage.txt
    tabfirst
    silent execute "normal \<C-w>h\<C-w>k"
    silent execute "normal \<C-w>20>"
endfunction

function! SetupBrute()
    call Setup()
    tabnew $HOME/VimProject/brute/generate.cpp
    tabnew $HOME/VimProject/brute/testsource.cpp
    vs $HOME/VimProject/brute/output_test.txt
    silent execute "normal \<C-w>h\<C-w>k"
    silent execute "normal \<C-w>20>"
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
endfunction

function! StartBrute()
    wa
    !$HOME/VimProject/brute/script.sh
endfunction


command! ClearThis call ClearThis()
command! Setup call Setup()
command! SetupBrute call SetupBrute()
command! StartBrute call StartBrute()

let local = "$HOME/VimProject/"
let messg = local."CompileMessage.txt"
let flags = "-D_MY -Wall -Wextra -Wfloat-conversion -Wconversion -Wshadow -Wno-unused-result -std=c++17"

if has('win32')
    nnoremap <silent> <F5> :wa<CR><C-w>h<C-w>k :execute "!g++ ".flags." -O2 % -o %:r 2> ".messg." && echo SUCCESS && %:r.exe \|\| echo FAIL" <CR>
    nnoremap <silent> <F6> :wa<CR><C-w>h<C-w>k :execute "!g++ ".flags." -O0 -g % -o %:r 2> ".messg." && echo SUCCESS && gdb %:r.exe \|\| echo FAIL" <CR>
endif
if has('unix')
    nnoremap <silent> <F5> :wa<CR><C-w>h<C-w>k :execute "!g++ ".flags." -O2 % -o %:r 2> ".messg." && echo SUCCESS && %:r \|\| echo FAIL" <CR>
    nnoremap <silent> <F6> :wa<CR><C-w>h<C-w>k :execute "!g++ ".flags." -O0 -g % -o %:r 2> ".messg." && echo SUCCESS && gdb %:r \|\| echo FAIL" <CR>
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

"-------------LATEX--------------

let g:tex_flavor = 'latex'

if (has('win32'))
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif

function! ClearThisLatex()
    if has('unix')
        w | silent !cp $HOME/VimLatex/TEMPLATE/TEMPLATE.tex %
    endif
    if has('win32')
        w | silent !copy \%userprofile\%\\VimLatex\\TEMPLATE\\TEMPLATE.tex %
    endif
    redraw!
endfunction

func SpellCheckRu()
    set spell spelllang=ru
endfunction

func SpellCheckEng()
    set spell spelllang=en
endfunction

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"autocmd FileType cpp,tex EnableXkbSwitch

"let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
"let g:XkbSwitchLib = "/path/to/libxkbswitch.so"
"echo libcall(g:XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
"call libcall(g:XkbSwitchLib, 'Xkb_Switch_setXkbLayout', 'us')



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

autocmd filetype tex inoremap ;;  <Esc>/<++><Enter>3xr :noh<Enter>i
autocmd filetype tex inoremap ;eq \begin{equation}<Enter>\end{equation}<Esc>ko
autocmd filetype tex inoremap ;tab \begin{tabular}<Enter>\end{tabular}<Esc>ko
autocmd filetype tex inoremap ;fr \frac{ }{<++>}<++><Esc>11hi

