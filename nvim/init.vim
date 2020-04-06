" Neovim config file prepared by afakhry@

set nocompatible              " be iMproved, required
filetype on
filetype plugin indent on
" set showcmd
set foldmethod=indent
set foldnestmax=1
set wildmenu
set wildmode=list:longest,full
" Enable mouse support in console
set mouse+=a

" Let me do things with the mouse inside tmux
if &term =~ '^screen'
    " tmux knows the extended mouse mode (probably not needed for neovim)
    " set ttymouse=xterm2
endif

set nohidden
set switchbuf+=useopen,usetab

"Open new split panes to right and bottom, which feels more natural than Vim’s default:
set splitbelow
set splitright

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" 80-column delimiter
set colorcolumn=81

set ignorecase
set smartcase

set encoding=utf-8

" Using Plugged:
" Install if not there:
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let install_and_use_deoplete = 1

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'vim-syntastic/syntastic'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

if (install_and_use_deoplete == 1)
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'lifepillar/vim-mucomplete'
endif

Plug 'severin-lemaignan/vim-minimap'
" Plug 'lornix/vim-scrollbar'
Plug 'ericcurtin/CurtineIncSw.vim'

Plug 'andreyorst/SimpleSnippets.vim'

Plug 'https://gitlab.com/3d_immortal/uc_light.git'
Plug 'testing-in-chrome/gruvbox'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'

Plug 'liuchengxu/vim-clap'
" Plug 'ap/vim-buftabline'

Plug 'fatih/vim-go'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert

if (install_and_use_deoplete == 1)
  let g:deoplete#enable_at_startup = 1
else
  let g:mucomplete#enable_auto_at_startup = 1
  set shortmess+=c   " Shut off completion messages
  set belloff+=ctrlg " If Vim beeps during completion
  let g:mucomplete#completion_delay = 300
  let g:mucomplete#reopen_immediately = 0
endif

call glaive#Install()        " enable this line after the installation of glaive

" map leader to space:
let mapleader = " "

" custom setting
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on

" indent for global
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

set nobk			    " Don't create backup files
set si				    " Turn on smart indent
set ru				    " Turn on the ruler
set sc				    " Show commands
set smarttab		            " Turn on smart tabs
set shiftwidth=2		" Number of spaces for indentation
set bsdir=last			" Go to last folder when browsing
set hlsearch			" Highlight search results
set incsearch			" Turn on incremental searching
set history=100			" Keep X commands in history
set number			    " Turn on line numbers
set t_Co=256			" Enable 256 colors

"Faster clipboard copying/pasting
nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
xnoremap <leader>y "+y
xnoremap <leader>Y "+Y

""Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>p "+p
xnoremap <leader>P "+P

" Setup themes
" This is only necessary if you use set termguicolors.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" fixes glitch? in colors when using vim with tmux
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_powerline_fonts=1

let use_light_theme = 0

if (use_light_theme)
  let g:airline_theme='light'
  set background=light
  colorscheme uc_light
else
  let g:airline_theme='simple'
  set background=dark
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
endif

" SimpleSnippets
let g:SimpleSnippetsExpandOrJumpTrigger = "<Tab>"
let g:SimpleSnippetsJumpBackwardTrigger = "<S-Tab>"

" LanguageClient_Server:
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd', '--all-scopes-completion'],
  \ 'c': ['clangd', '--all-scopes-completion'],
  \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F12> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F6> :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>o :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>a :call LanguageClient#textDocument_codeAction()<CR>
command! -nargs=1 FindSymbol execute 'call LanguageClient#workspace_symbol(''<args>'')'
noremap <F5> :FindSymbol<space>
inoremap <C-Space> <C-x><C-o>

" Window resize via Alt + Shift + arrows
noremap <A-S-Left> <C-W>>
noremap <A-S-Right> <C-W><
noremap <A-S-Up> <C-W>+
noremap <A-S-Down> <C-W>-
noremap <silent> <C-s>  :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <esc>:update<CR><esc>

nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>N :bp<CR>
nnoremap <silent> <leader>q :cclose<CR>:lclose<CR>

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <leader>r :call RenameFile()<cr>

" Strip whitespace on save
fun! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfun

command! -nargs=0 Stripwhitespace :call <SID>StripTrailingWhitespaces()

" Switch header/source.
noremap <F4> :call CurtineIncSw()<CR>

map <silent> <F9> : NERDTreeToggle<CR>
map <silent> <C-\> : NERDTreeFind<CR>

" let g:loaded_scrollbar=1
" map <silent> <F7> :call ToggleScrollbar()<CR>
" map <silent> <F7> :MinimapToggle<CR>
map <silent> <F7> :set relativenumber!<CR>

" setup for tagbar
nmap <F8> :TagbarToggle<CR>

" My find:
" r! fdfind -i -H -c never -t f ""
noremap <C-p> :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'previewwindow': '30%'})<CR>
noremap <leader>g :call fzf#run({'source': 'rg --no-ignore --files', 'sink': 'e', 'previewwindow': '30%'})<CR>

noremap <C-S-f> :! git-clang-format<CR><esc>

" Saner Ctrl=L
noremap <c-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:redraw!<cr>

noremap <leader>f :let @+=expand('%')<cr>:echo 'Copied: ' @+<cr>

nnoremap n nzz
nnoremap N Nzz

" Fast vertical split.
nnoremap <leader>tt :vnew<cr>
nnoremap <leader>t :vsp<cr>

"Faster buffer switchingt
" nnoremap <leader>l :ls<cr>:b<space>
nnoremap <leader>l :call fzf#run({'source': map(filter(range(1, bufnr('$')),
                                \ 'buflisted(v:val)'), 'bufname(v:val)'),
                                \ 'sink': 'b', 'previewwindow': '30%'})<CR>

" Colors:
nnoremap <leader>c :call fzf#run({'source': map(split(globpath(&rtp, 'colors/*.vim')),
                                \               'fnamemodify(v:val, ":t:r")'),
                                \ 'sink': 'colo', 'left': '25%'})<CR>

" Faster bufdo:
nnoremap <leader>b :bufdo<space>

"So I can move around in insert
inoremap <C-Left> <C-o>b
inoremap <C-Right> <C-o>e<Right>

" Don't lose selection when indenting/unindenting:
xnoremap <  <gv
xnoremap >  >gv

fun! s:MyGrep(opts, txt)
  let l:grepprgb = &grepprg
  let l:grepformatb = &grepformat
  let &grepprg = 'rg --vimgrep -i -S '
  let &grepformat = "%f:%l:%c:%m"

  silent! exe 'lgrep! ' . a:opts . ' ' . a:txt
  exe 'lopen'
  redraw!
  let @/=escape(substitute(a:txt, '"', '', 'g'), '|')
  call feedkeys(":let &hlsearch=1\<CR>", 'n')

  let &grepprg = l:grepprgb
  let &grepformat = l:grepformatb
endfun

command! -nargs=+ MyGrep :call s:MyGrep(<f-args>)
nnoremap <F2> :MyGrep -g'*.{c,cc,cpp,mm,h,d}'<space>


" Ripgrep
" nmap <F2> :Rg -g '*.{c,cc,cpp,mm,h}'

" Make using escape key faster
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=30    " unnoticeable small value

" Faster keyword completion:
" set complete=.,w,b,u,t
set complete-=i   " disable scanning included files
" set complete-=t   " disable searching tags

" setup for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0

" use google style for clang-format
Glaive codefmt clang_format_style='chromium'

" setup for indent line
let g:indentLine_char = '│'
set tags=./tags,tags;$HOME
"source ~/cscope_maps.vim

function! Relpath(filename)
    let cwd = getcwd()
    let s = substitute(a:filename, l:cwd . "/" , "", "")
    return s
endfunction

set redrawtime=10000

augroup all_my_auto_commands
  autocmd!

  " Save and restore your code folds
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview

  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer none " clang-format
  autocmd FileType python AutoFormatBuffer yapf

  " indent for special file
  autocmd FileType c,cpp,cc,h setlocal expandtab shiftwidth=2 softtabstop=2 cindent
  autocmd FileType d setlocal expandtab shiftwidth=2 softtabstop=2 cindent foldnestmax=2

  " StripTrailingWhitespaces
  autocmd BufWritePre * Stripwhitespace

  autocmd BufNewFile,BufRead,BufEnter *.nn set syntax=rust

  " open NERDTree automatically when vim starts up on opening a directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " Triger `autoread` when files changes on disk
  " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  " Notification after file change
  " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

  " Highlight word under cursor. Too slow and can be distracting.
  " autocmd CursorHold * silent :let @/=expand("<cword>")

augroup END

" Golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Ctrl-C / Ctrl-V support
source $VIMRUNTIME/mswin.vim
behave mswin
