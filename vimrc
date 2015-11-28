set ruler
set cc=100
highlight ColorColumn ctermbg=lightgray guibg=lightgray
colorscheme harlequin
set t_Co=16
set antialias
set guifont=Monaco:h14

hi ColorColumn ctermbg=8

imap jj <Esc>
filetype off
syntax on
set nocompatible
set backspace=2
set ignorecase
set hlsearch
set incsearch
set encoding=utf8
set smarttab
set ai
set si
map <space> /
map <c-space> ?
nnoremap <CR> :nohlsearch<cr>

let mapleader = ","
let g:mapleader = ","

map <Leader>gb <Esc>:Gblame<CR>
map <Leader>vs <Esc>:vsplit<CR>
map <Leader>hs <Esc>:split<CR>
map <Leader>gg 0v$<Left>y:!git diff HEAD ^master -- <c-r>"<cr>

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"function to replace all occurences of word1 with word2
function! Repa(word1, word2)
    execute '%s/\<'.a:word1.'\>/'.a:word2.'/g'
endfun

set tabstop=4
set shiftwidth=4
filetype plugin on
set expandtab

set list
set listchars=tab:♪\ ,trail:∘

set laststatus=2
"
autocmd BufRead,BufNewFile *.tpl        set filetype=html

let g:Powerline_symbols = 'fancy'
let g:ctrlp_user_command=['.git/', 'cd %s && git ls-files . -co --exclude-standard | grep -v node_modules']

"let g:Powerline_theme = 'solarized256'
"let g:Powerline_stl_path_style = 'full'

"javac syntastic classpath definition
let g:syntastic_java_javac_classpath = "~/map_to_object/src/**:/Library/Java/Extensions/*.jar"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let g:syntastic_basic=['php', 'phpmd']
let g:syntastic_full=['php', 'phpmd', 'phpcs']

" default to basic rules
let g:syntastic_php_checkers=g:syntastic_basic
"

function! TogglePHPCS()
    if g:syntastic_php_checkers == g:syntastic_full
        let g:syntastic_php_checkers = g:syntastic_basic
        echo "PHPCS Disabled"
    else
        let g:syntastic_php_checkers = g:syntastic_full
        echo "PHPCS Enabled"
    endif
endfun

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

let g:Powerline_symbols_override = {
        \ 'BRANCH': [0x2213],
        \ 'LINE': 'L',
        \ }

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlp.vim'
Plugin 'ack.vim'
Plugin 'git://github.com/Lokaltog/vim-powerline.git'
Plugin 'fugitive.vim'
Plugin 'Syntastic'
Plugin 'bufexplorer.zip'
Plugin 'VimClojure'
Plugin 'git://github.com/tpope/vim-fireplace.git'

call vundle#end()

filetype plugin indent on

au BufNewFile,BufRead *.clj set filetype=clojure
