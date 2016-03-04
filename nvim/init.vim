""""""""""""""""""""""""""""""""""""""""""""""""
" Generic setup
""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

let mapleader = ","

"""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""
" Turn on the Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" Always show current position
set ruler
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Find words as typing out search
set incsearch
" Enable extended % matching
runtime macros/matchit.vim
" Start scrolling before cursor hits top/bottom
set scrolloff=5
" Number of lines to jump when scrolling off screen
" -# = percentage
set scrolljump=-10

" Set the paste toggle
map <F10> :set paste<cr>
map <F11> :set nopaste<cr>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" Quick funtion that will
" highlight over 80 columns
autocmd FileType cpp :autocmd! BufWritePre * :match ErrorMsg '\%>80v.\+'

" Use Unix as the standard file type
set ffs=unix,mac,dos

""""""""""""""""""""""""""""
" => Tags
""""""""""""""""""""""""""""
" setup tags
set tags=./tags;/

""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc.
set nobackup
set nowb
set noswapfile

" Echo the full path of file being edited
nnoremap <leader>f :echo expand('%:p')<cr>

" Source and Edit nvim/init
nnoremap <leader>src :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>erc :vsp ~/.config/nvim/init.vim<cr>

" Sudo save a file
nnoremap <leader>save :w !sudo dd of=%<cr>

""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Do not expand tab for Makefiles
autocmd FileType make set noexpandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent and wrap lines
set ai
set wrap

" Set the backspace to work as expected
set backspace=2

" Auto remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""
" Window Management Stuff
"""""""""""""""""""""""""""""""""""
" Move to next or previous tab
nnoremap <leader>T :tabn<cr>
nnoremap <leader>P :tabp<cr>

" Increase and Decrease the width of a vertically split window
nnoremap <leader>< :vertical resize -10<cr>
nnoremap <leader>> :vertical resize +10<cr>

" Rotate panes
nnoremap <leader>wvh <C-w>t<C-w>K
nnoremap <leader>whv <C-w>t<C-w>H

"""""""""""""""""""""""""""""""""""
" Neovim terminal support
"""""""""""""""""""""""""""""""""""
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

"""""""""""""""""""""""""""""""""""
" Operator Maps
"""""""""""""""""""""""""""""""""""
" Operator maps to get inside () '' and "
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! F)vi)<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in} :<c-u>normal! F}vi}<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in] :<c-u>normal! F]vi]<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>

""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug setup
""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" Always load
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'spiroid/vim-ultisnip-scala'
Plug 'airblade/vim-rooter'
Plug 'benekastah/neomake'
" Plug 'scrooloose/syntastic'
if has('nvim')
    Plug 'shougo/deoplete.nvim'
endif

" On Command
Plug 'majutsushi/tagbar', {'on': 'TagbarOpen'}
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'tpope/vim-fugitive', {'on': 'Git'}
Plug 'rizzatti/dash.vim', {'on': 'Dash'}
Plug 'kien/rainbow_parentheses.vim', {'on': 'RainbowParenthesesToggleAll'}

" On File Type
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'mitsuhiko/vim-jinja', {'for': ['jinja']}
Plug 'mxw/vim-jsx', {'for': ['jsx']}
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java']}
Plug 'stephpy/vim-yaml', {'for': ['yaml']}
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
Plug 'derekwyatt/vim-scala', {'for': ['scala']}
Plug 'hdima/python-syntax', {'for': ['python']}

call plug#end()

nnoremap <leader>PI :PlugInstall<cr>
nnoremap <leader>PU :PlugUpdate<cr>

"""""""""""""""""""""""""""""""
" => Plugin Config
"""""""""""""""""""""""""""""""
" Syntastic stuff
" let g:syntastic_check_on_open=1
" let g:syntastic_auto_loc_list=0
" let g:syntastic_enable_signs=1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_style_error_symbol = 'Տ'
" let g:syntastic_style_warning_symbol = 'Տ'
"
" let g:syntastic_python_checks = ['flake8']
" let g:syntastic_python_flake8_args = '--ignore=E501'
"
" let g:syntastic_java_checkers = ['checkstyle']
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Neomake stuff
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501']
    \ }
let g:neomake_error_sign = {
    \ 'text': '✗',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '⚠',
    \ }
let g:neomake_info_sign = {
    \ 'text': '>',
    \ }
let g:neomake_airline = 1

autocmd! BufReadPost * Neomake
autocmd! BufWritePost * Neomake

" Tabular stuff - see http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
if exists(":Tabularize")
    nnoremap <leader>a= :Tabularize /=<CR>
    vnoremap <leader>a= :Tabularize /=<CR>
    nnoremap <leader>a: :Tabularize /:\zs<CR>
    vnoremap <leader>a: :Tabularize /:\zs<CR>

endif

if exists(':DeopleteEnable')
    let g:deoplete#enable_at_startup = 1
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Move to the TagBar if already opened or open and focus
" close the TagBar after selection
nnoremap <leader>tag :TagbarOpen fjc<cr>

" Toggle NERDTree
nnoremap <F6> :NERDTreeToggle<cr>
" List Tasks
nnoremap <leader>l :TaskList<cr>

" Ultisnips stuff
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:ultisnips_python_style="sphinx"

" Rainbow Parens stuff
nnoremap <leader>( :RainbowParenthesesToggleAll<cr>

" Dash.vim stuff
nmap <silent> <leader>d <Plug>DashSearch

" javacomplete stuff
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F3> <Plug>(JavaComplete-Imports-Add)
imap <F3> <Plug>(JavaComplete-Imports-Add)
nmap <F4> <Plug>(JavaComplete-Imports-AddMissing)
imap <F4> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F5> <Plug>(JavaComplete-Imports-RemoveMissing)
imap <F5> <Plug>(JavaComplete-Imports-RemoveMissing)
