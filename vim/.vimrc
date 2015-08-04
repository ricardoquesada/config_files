" .vimrc
" Written by Matt Roper <matt@mattrope.com>
"
" Feel free to use any or all of this file in your own vimrc file.


" Don't use vi compatibility; I want all the new features in Vim
set nocompatible

" Version 6.0-specific stuff
if version >= 600
    syntax enable
    filetype on
    filetype plugin on
    filetype indent on
else
    syntax on
endif

" Low priority filename suffixes for filename completion {{{
set suffixes-=.h        " Don't give .h low priority
set suffixes+=.aux
set suffixes+=.log
set wildignore+=*.dvi
set suffixes+=.bak
set suffixes+=~
set suffixes+=.swp
set suffixes+=.o
set suffixes+=.class
" }}}

set showfulltag         " Get function usage help automatically
set showcmd             " Show current vim command in status bar
set showmatch           " Show matching parentheses/brackets
set showmode            " Show current vim mode

set background=dark

set bs=2                " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set selection=exclusive " don't include character under cursor in selection
set incsearch           " incremental (emacs-style) search
set vb t_vb=            " kill the beeps! (visible bell)
set wildmenu            " use a scrollable menu for filename completions
"set ignorecase          " case-insensitive searching

" Indentation / tab replacement stuff
"set shiftwidth=4        " > and < move block by 4 spaces in visual mode
"set sts=4
"set et                  " expand tabs to spaces
set autoindent           " always set autoindenting on

" Move text, but keep highlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Color Scheme (only if GUI running) {{{
if has("gui_running")
    colorscheme evening
endif
" }}}

" Key mappings {{{

" Allow the . to execute once for each line in visual selection
vnoremap . :normal .<CR>

" Make ' function behave like ` usually does and then change ` to replay
" recorded macro a (as if @a was typed).  In visual mode, ` (which now acts
" like @a) should function on all selected lines.
noremap ' `
nnoremap ` @a
vnoremap ` :normal @a<CR>

" Make tab perform keyword/tag completion if we're not following whitespace
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" Make F7 spellcheck the buffer
noremap <F7> <Esc>:call IspellCheck()<CR><Esc>

" Programming Keys:
"   F9  = Make
"   F10 = Next Error
"   F11 = Prev Error
inoremap <F9> <Esc>:make<CR>
inoremap <F10> <Esc>:cnext<CR>
inoremap <F11> <Esc>:cprev<CR>
noremap <F9> <Esc>:make<CR>
noremap <F10> <Esc>:cnext<CR>
noremap <F11> <Esc>:cprev<CR>

" Buffer Switching:
"   F2 = next buffer
"   F3 = previous buffer
"   F4 = kill buffer
inoremap <F2> <Esc>:bn<CR>
inoremap <F3> <Esc>:bp<CR>
inoremap <F4> <Esc>:bd<CR>
noremap <F2> <Esc>:bn<CR>
noremap <F3> <Esc>:bp<CR>
noremap <F4> <Esc>:bd<CR>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Key mappings }}}

" Autocommands {{{
if has("autocmd")

    " When vim is used in a console window, set the title bar to the
    " name of the buffer being editted.
    if !has("gui_running")
        auto BufEnter * let &titlestring="VIM - ".expand("%:p")
    endif

    " In text and LaTeX files, always limit the width of text to 76
    " characters.  Also perform logical wrapping/indenting.
    autocmd BufRead *.txt set tw=76 formatoptions=tcroqn2l
    autocmd BufRead *.tex set tw=76

    " Programming settings {{{
    augroup prog
        au!
        au BufRead *.c,*.cc,*.cpp,*.h,*.java set formatoptions=croql cindent nowrap nofoldenable
        au BufEnter *.java      map <C-Return> :w\|:!javac %<CR>
        au BufEnter *.c         map <C-Return> :w\|:!gcc %<CR>
        au BufEnter *.cc,*.cpp  map <C-Return> :w\|:!g++ %<CR>
        au BufLeave *.java,*.c,*.cc unmap <C-Return>

        " Don't expand tabs to spaces in Makefiles
        au BufEnter  [Mm]akefile*  set noet
        au BufLeave  [Mm]akefile*  set et

        " Set up folding for python
        au FileType python set nofoldenable foldmethod=indent
    augroup END
    " }}}


    " Reread configuration of Vim if .vimrc is saved {{{
    augroup VimConfig
        au!
        autocmd BufWritePost ~/.vimrc       so ~/.vimrc
        autocmd BufWritePost vimrc          so ~/.vimrc
    augroup END
    " }}}


"    " C programming auto commands {{{
"    augroup cprog
"        au!
"
"        " When starting to edit a file:
"        "   For C and C++ files set formatting of comments and set C-indenting on.
"        "   For other files switch it off.
"        "   Don't change the order, it's important that the line with * comes first.
"        "autocmd FileType *      set formatoptions=tcql nocindent comments&
"        "autocmd FileType c,cpp  set formatoptions=croql comments=sr:/*,mb:*,el:*/,://
"
"        " Automatic "folding" in C code.  This is cool.
"        "if version >= 600
"        "    "au FileType c set foldenable foldmethod=indent
"        "    au FileType c,cpp set nofoldenable foldmethod=syntax
"        "    au FileType c,cpp syn region Block start="{" end="}" transparent fold
"        "    "au FileType c syn region Comment start="/\*" end="\*/" fold
"        "endif
"    augroup END
"    " }}}

endif " has("autocmd")
" }}}

" Functions {{{

" IspellCheck() {{{
function! IspellCheck()
    let l:tmpfile = tempname()

    execute "normal:w!" . l:tmpfile . "\<CR>"
    if has("gui_running")
        execute "normal:!xterm -e ispell " . l:tmpfile . "\<CR>"
    else
        execute "normal:! ispell " . l:tmpfile . "\<CR>"
    endif
    execute "normal:%d\<CR>"
    execute "normal:r " . l:tmpfile . "\<CR>"
    execute "normal:1d\<CR>"
endfunction
" IspellCheck }}}

" InsertTabWrapper() {{{
" Tab completion of tags/keywords if not at the beginning of the
" line.  Very slick.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
" InsertTabWrapper() }}}

" Functions }}}

" Settings for specific syntax files {{{
let c_gnu=1
let c_comment_strings=1
let c_space_errors=1

"let perl_fold=1          " turn on perl folding capabilities
" }}}


" Modeline {{{
" vim:set ts=4:
" vim600:fdm=marker fdl=0 fdc=3 vb t_vb=:
" }}}


" Own Changes
set hlsearch
set incsearch
set autochdir
set nowrap
set number
set guifont=Droid\ Sans\ Mono:h12

execute pathogen#infect()

" C=64 ACME
augroup filetypedetect
    autocmd BufNewFile,BufRead *.a set syntax=acme.vim
augroup END

" C=64 ca65
filetype plugin indent on
augroup filetypedetect
    au BufNewFile,BufRead *.s,*.inc,*.mac set ft=asm_ca65
augroup END

" overwrite defaults: Indentation / tab replacement stuff
set shiftwidth=8         " > and < move block by 4 spaces in visual mode
set sts=8
set ts=8
set noet                 " expand tabs to spaces
