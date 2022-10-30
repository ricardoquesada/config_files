" Neovim config file prepared by afakhry@

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
" Plug 'vim-syntastic/syntastic'

Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" FZF: Multi-entry selection UI.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if (install_and_use_deoplete == 1)
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'lifepillar/vim-mucomplete'
endif

Plug 'severin-lemaignan/vim-minimap'
" Plug 'lornix/vim-scrollbar'
Plug 'ericcurtin/CurtineIncSw.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'andreyorst/SimpleSnippets.vim'

Plug 'qpkorr/vim-bufkill'

Plug 'https://gitlab.com/3d_immortal/nn-vim.git'

Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'

Plug 'liuchengxu/vim-clap'
" Plug 'mhinz/vim-startify'

" Colors:
Plug 'https://gitlab.com/3d_immortal/uc_light.git'
Plug 'testing-in-chrome/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'joshdick/onedark.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

" Plug 'ap/vim-buftabline'

" ACME syntax hightlight
Plug 'leissa/vim-acme'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call glaive#Install()        " enable this line after the installation of glaive

" ------------------------------------------------------------------------------
" General Settings:

set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert

if (install_and_use_deoplete == 1)
  let g:deoplete#enable_at_startup = 1
  set shortmess+=c   " Shut off completion messages
  set belloff+=ctrlg " If Vim beeps during completion
else
  let g:mucomplete#enable_auto_at_startup = 1
  set shortmess+=c   " Shut off completion messages
  set belloff+=ctrlg " If Vim beeps during completion
  let g:mucomplete#completion_delay = 300
  let g:mucomplete#reopen_immediately = 0
endif

set nocompatible              " be iMproved, required
filetype on
filetype plugin indent on
" set showcmd
set nofoldenable
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

" Always show tabs
set showtabline=2

set noautochdir
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
" custom setting
set number
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set guioptions=
syntax on

" indent for global
set expandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8
set autoindent

" Set the terminal's title
set title

" Unless you're editing huge files, leave this line active.
" This disables the swap file and puts all data in memory.
" Modern machines can handle this just fine, but if you're
" limited on RAM, comment this out.
set noswapfile

set scrolljump=3  " lines to scroll when cursor leaves screen
set scrolloff=2   " minimum lines to keep above and below cursor

set conceallevel=0                      " So that I can see `` in markdown files

" Stop newline continution of comments
set formatoptions-=cro

set visualbell
set nobk			" Don't create backup files
set si				" Turn on smart indent
set ru				" Turn on the ruler
set sc				" Show commands
set smarttab			" Turn on smart tabs
set bsdir=last			" Go to last folder when browsing
set hlsearch			" Highlight search results
set incsearch			" Turn on incremental searching
set history=100			" Keep X commands in history
set number			" Turn on line numbers
set t_Co=256			" Enable 256 colors

set redrawtime=10000

" The below settings don't work with tab completion, hence disabled.
" Make using escape key faster
set timeout           " for mappings
set timeoutlen=1000    " default value is 1000
set ttimeout          " for key codes
set ttimeoutlen=30    " unnoticeable small value
set updatetime=300    " Faster completion

" Faster keyword completion:
" set complete=.,w,b,u,t
set complete-=i   " disable scanning included files
" set complete-=t   " disable searching tags

" setup for syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 0

" use google style for clang-format
" Glaive codefmt clang_format_style='chromium'

" setup for indent line
let g:indentLine_char = '│'
set tags=./tags,tags;$HOME
"source ~/cscope_maps.vim


" ------------------------------------------------------------------------------
" Setup themes and airline

" This is only necessary if you use set termguicolors.
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"" fixes glitch? in colors when using vim with tmux
"set t_Co=256
"if (has("termguicolors"))
"  set termguicolors
"endif
"
"lua require'colorizer'.setup()

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1

let use_light_theme = 0

if (use_light_theme)
  set background=light
  let g:airline_theme='light'
  colorscheme uc_light
else
  set background=dark
  let g:airline_theme='simple'
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
  " colorscheme onedark
endif

" ------------------------------------------------------------------------------
" LanguageClient_Server:

let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd', '--all-scopes-completion'],
  \ 'c': ['clangd', '--all-scopes-completion'],
  \ }

" Disable diagnostic signs which don't work very well in hterm.
" let g:LanguageClient_diagnosticsSignsMax = 0

let g:LanguageClient_diagnosticsDisplay = {
  \   1: {
  \       "name": "Error",
  \       "texthl": "ALEError",
  \       "signText": "xx",
  \       "signTexthl": "ALEErrorSign",
  \       "virtualTexthl": "Error",
  \   },
  \   2: {
  \       "name": "Warning",
  \       "texthl": "ALEWarning",
  \       "signText": "!!",
  \       "signTexthl": "ALEWarningSign",
  \       "virtualTexthl": "Todo",
  \   },
  \   3: {
  \       "name": "Information",
  \       "texthl": "ALEInfo",
  \       "signText": "ii",
  \       "signTexthl": "ALEInfoSign",
  \       "virtualTexthl": "Todo",
  \   },
  \   4: {
  \       "name": "Hint",
  \       "texthl": "ALEInfo",
  \       "signText": ">>",
  \       "signTexthl": "ALEInfoSign",
  \       "virtualTexthl": "Todo",
  \   },
  \ }

" ------------------------------------------------------------------------------
" FZF:

let $FZF_DEFAULT_COMMAND="rg --no-ignore --files"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'up':'~90%', 'window':
  \ { 'width': 0.9, 'height': 0.9, 'yoffset':0.5, 'xoffset': 0.5,
  \  'highlight': 'Todo', 'border': 'sharp' } }

" ------------------------------------------------------------------------------
" My Functions:

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


function! Relpath(filename)
    let cwd = getcwd()
    let s = substitute(a:filename, l:cwd . "/" , "", "")
    return s
endfunction


" Ripgrep with FZF
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" ------------------------------------------------------------------------------
" Snippets:

let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" SimpleSnippets
" let g:SimpleSnippetsExpandOrJumpTrigger = "<C-t>"
" let g:SimpleSnippetsJumpBackwardTrigger = "<C-T>"

" ------------------------------------------------------------------------------
" Mappings

" map leader to space:
let mapleader = " "

" Terminal Mode Configuration {{{
" Terminal mode mappings
tnoremap <C-w> <C-\><C-n><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
" }}}

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

nnoremap n nzz
nnoremap N Nzz

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"So I can move around in insert
inoremap <C-Left> <C-o>b
inoremap <C-Right> <C-o>e<Right>
inoremap <A-k> <C-o>gk
inoremap <A-h> <Left>
inoremap <A-l> <Right>
inoremap <A-j> <C-o>gj
inoremap <A-C-h> <C-o>b
inoremap <A-C-l> <C-o>e<Right>

" Home and end.
inoremap <A-H> <C-o>^
inoremap <A-L> <C-o>$
nnoremap <A-H> ^
nnoremap <A-L> $
vnoremap <A-H> ^
vnoremap <A-L> $

" Don't lose selection when indenting/unindenting:
xnoremap <  <gv
xnoremap >  >gv

" <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent> <expr><Return> pumvisible() ? "\<C-y>" : "\<Return>"

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F3> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F6> :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>o :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>a :call LanguageClient#textDocument_codeAction()<CR>
command! -nargs=1 FindSymbol execute 'call LanguageClient#workspace_symbol(''<args>'')'
noremap <F4> :FindSymbol<space>
inoremap <C-Space> <C-x><C-o>

nnoremap <leader>r :call RenameFile()<cr>

" Switch header/source.
noremap <F5> :call CurtineIncSw()<CR>

map <silent> <F9> : NERDTreeToggle<CR>
map <silent> <C-\> : NERDTreeFind<CR>

" let g:loaded_scrollbar=1
" map <silent> <F7> :call ToggleScrollbar()<CR>
" map <silent> <F7> :MinimapToggle<CR>
map <silent> <F7> :set relativenumber!<CR>

" setup for tagbar
nmap <F8> :TagbarToggle<CR>

" Mapping without fzf.vim:
" My find:
" r! fdfind -i -H -c never -t f ""
" noremap <C-p> :call fzf#run({'source': 'git ls-files', 'sink': 'e', 'previewwindow': '30%'})<CR>
" noremap <leader>g :call fzf#run({'source': 'rg --no-ignore --files', 'sink': 'e', 'previewwindow': '30%'})<CR>
"Faster buffer switching
" nnoremap <leader>l :ls<cr>:b<space>
" nnoremap <leader>l :call fzf#run({'source': map(filter(range(1, bufnr('$')),
"                                 \ 'buflisted(v:val)'), 'bufname(v:val)'),
"                                 \ 'sink': 'b', 'previewwindow': '30%'})<CR>
"
" Colors:
" nnoremap <leader>c :call fzf#run({'source': map(split(globpath(&rtp, 'colors/*.vim')),
"                                 \               'fnamemodify(v:val, ":t:r")'),
"                                 \ 'sink': 'colo', 'left': '25%'})<CR>

" Mappings with fzf.vim
noremap <C-p> :GFiles<CR>
noremap <leader>g :Files<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>c :Colors<CR>
nnoremap <leader>b :BLines<CR>

noremap <C-S-f> :! git cl format<CR><esc>

" Saner Ctrl=L
noremap <c-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr>:redraw!<cr>

noremap <leader>f :let @+=expand('%')<cr>:echo 'Copied: ' @+<cr>

" Fast vertical split.
nnoremap <leader>tt :vnew<cr>
nnoremap <leader>t :vsp<cr>

" Faster bufdo:
nnoremap <leader>db :bufdo<space>

nnoremap <F2> :MyGrep -g'*.{c,cc,cpp,mm,h,d,nn}'<space>


" ------------------------------------------------------------------------------
" Auto Commands:

augroup all_my_auto_commands
  autocmd!

  " Save and restore your code folds
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType * inoremap <buffer> <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  autocmd FileType * inoremap <buffer> <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
  " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer none " clang-format
  " autocmd FileType python AutoFormatBuffer yapf

  " indent for special file
  autocmd FileType c,cpp,cc,h setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 cindent
  autocmd FileType asm,s setlocal expandtab shiftwidth=8 softtabstop=8 tabstop=8

  " StripTrailingWhitespaces
  autocmd BufWritePre * Stripwhitespace

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grave yard:
"

" Plug 'Valloric/YouCompleteMe'
" Plug 'ervandew/supertab'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'morhetz/gruvbox'
" Plug 'ctrlpvim/ctrlp.vim'
" let g:deoplete#enable_at_startup = 1
"" set matchpairs+=<:>

" " setup for ycm
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
" let g:ycm_python_binary_path = 'python'
" let g:ycm_complete_in_comments = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_semantic_triggers =  {
"   \ 'c' : ['re!\w{2}'],
"   \ 'cpp' : ['re!\w{2}'],
"   \ 'python' : ['re!\w{2}'],
"   \ }
" " Let clangd fully control code completion
" let g:ycm_clangd_uses_ycmd_caching = 0
" " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
" let g:ycm_clangd_binary_path = exepath("clangd")
" nmap <F3> :YcmCompleter GoTo<CR>
" nmap <F4> :YcmCompleter GetType<CR>
" nmap <F6> :YcmCompleter GoToReferences<CR>
" nmap <F7> :YcmCompleter FixIt<CR>
"
" " setup for ctrlp
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = 'fdfind -i -H -c auto -t f --search-path %s '
" autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent
" This is the default extra key bindings

" riq - addons
"function! Formatonsave()
"  let l:formatdiff = 1
"  pyf /usr/share/vim/addons/syntax/clang-format.py
"endfunction
"autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Formatonsave()

augroup c64asm_ft
  au!
  autocmd BufNewFile,BufRead *.s   set syntax=64tass
  autocmd BufNewFile,BufRead *.asm   set syntax=64tass
augroup END

set autochdir
set list
