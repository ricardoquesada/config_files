set nocompatible                        " Don't be compatible with vi
set background=dark	                    " I use dark background
set tabstop=4                           " Tab stop of 4
set shiftwidth=4                        " Shift width of 4 spaces (used on auto indent)
set history=100	                        " 50 Lines of history
set expandtab                           " Use spaces, not tabs.
set softtabstop=4                       " Treat 4 spaces as a tab for bs/del operations
set autoindent                          " Auto Indent
set ignorecase                          " Make searches case insensitive
set smartcase                           " Make search case sensitive if it has caps
set incsearch                           " Incremental search (shows best match so far)
set hlsearch                            " Highlight matches to the search 
set backspace=indent,eol,start          " Backspace over anything! (Super backspace!)
set ruler                               " Show the line number and columnn the cursor is on
set number                              " Show line numbering
set wildmenu                            " Autocomplete features in the status bar
"set foldmarker={,}                      " Fold C style code
"set foldmethod=marker                   " Fold on the marker 
filetype plugin on                      " Enable filetype plugins
syntax on                               " Turn on syntax highlighting
"colorscheme tango                       " Use tango colors
colorscheme solarized                   " Use solarized colors
" we don't want to edit these type of files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp

" visual shifting (builtin-repeat)
if &diff
   vnoremap < :diffget<CR>
   vnoremap > :diffput<CR>
else
   vnoremap < <gv
   vnoremap > >gv 
endif

" work more logically with wrapped lines
noremap j gj
noremap k gk

" bind ctrl+space for omnicompletion
inoremap <Nul> <C-x><C-o>
" tab labels show the filename without path(tail)
set guitablabel=%N/\ %t\ %M
" tab navigation (next tab) with alt left / alt right
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" Toggle the tag list bar
nmap <F4> :TlistToggle<CR>

" smart indenting for python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" allows us to run :make and get syntax errors for our python scripts
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete

" for snippets
if &ft == 'python'
    set ft=python.django_tempate.django_model
endif

" set up tags
set tags=tags;/
set tags+=$HOME/.vim/tags/python.ctags

" move to the current files directory
autocmd BufEnter * lcd %:p:h 

"Solarized F5 change between light & dark
function! ToggleBackground()
    if (g:solarized_style=="dark")
        let g:solarized_style="light"
        colorscheme solarized
    else
        let g:solarized_style="dark"
        colorscheme solarized
    endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F5> :call ToggleBackground()<CR>
inoremap <F5> <ESC>:call ToggleBackground()<CR>a
vnoremap <F5> <ESC>:call ToggleBackground()<CR>

