"--------------------------vim-plug---------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-------------------------vim plugins-------------------------------

call plug#begin('~/.vim/plugged')

"-- Language

"---- Golang
Plug 'fatih/vim-go', { 'for': 'go' }

"---- JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'js' }

"---- LiveScript
Plug 'gkz/vim-ls', { 'for': 'ls' }

"---- Pug
Plug 'digitaltoad/vim-jade', { 'for': 'pug' }

"---- Python
Plug 'hdima/python-syntax', { 'for': 'py' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'py' }

"---- Sass
Plug 'tpope/vim-haml', { 'for': ['sass', 'scss'] }

"---- Solidity
Plug 'tomlion/vim-solidity', { 'for': 'sol' }

"---- TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'ts' }

"--------------------------

"-- Integrations

"---- JSDoc
Plug 'heavenshell/vim-jsdoc', { 'for': 'js' }

"--------------------------

"-- Interface

"---- cursor
Plug 'miyakogi/conoline.vim'

"---- git diff
Plug 'airblade/vim-gitgutter'

"---- status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"--------------------------

"-- Others

"---- ack
Plug 'mileszs/ack.vim'

"---- aligning text
Plug 'godlygeek/tabular'

"---- language server protocol client
Plug 'dense-analysis/ale'

call plug#end()

"------------------------plugins setting----------------------------

"-- ack
let g:ackprg='ag --vimgrep'

"-- ale (language server protocol client)
let g:ale_fix_on_save=1
let g:ale_fixers={
\ '*': ['prettier'],
\ 'json': ['fixjson'],
\ 'python': ['isort', 'autopep8']
\ }
let g:ale_linters={
\ 'javascript': ['tsserver'],
\ 'typescript': ['tsserver'],
\ 'vue': ['vls']
\ }
let g:ale_linters_explicit=1

"-- conoline
let g:conoline_auto_enable=1

"-- python-syntax
let python_highlight_all=1

"-- vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='sol'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
set laststatus=2                                    " set status line

"-- vim-node
autocmd User Node if "javascript" == &filetype | nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile | endif

"------------------------general setting----------------------------

syntax on
hi Comment ctermfg=033
hi def link jsObjectKey Label
set ai                                      " autoindent
set autochdir                               " automatically switch to the directory of this file
set backspace=2                             " allow backspacing in insert mode
set cursorline
set directory=~/tmp//
set encoding=utf-8
set expandtab                               " use space to represent tab
set fileencodings=utf-8,ucs-bom,latin1
set incsearch                               " show result while searching
set nobackup
set noundofile
set nowrap
set shiftwidth=2
set smarttab
set tabstop=2
set termencoding=utf-8
set viminfo=\"50,'20,n~/.vim/cache/.viminfo
set wildmenu                                " show command menu as using tab
autocmd BufWritePre * :%s/\s\+$//e          " remove the extra space in the end of each line

"--Window
nnoremap <silent> <Tab>	:wincmd w<CR>
nnoremap <silent> <C-H>	:wincmd h<CR>
nnoremap <silent> <C-J>	:wincmd j<CR>
nnoremap <silent> <C-K>	:wincmd k<CR>
nnoremap <silent> <C-L>	:wincmd l<CR>
nnoremap <silent> +	:wincmd +<CR>
nnoremap <silent> -	:wincmd -<CR>
nnoremap <silent> <	:wincmd <<CR>
nnoremap <silent> >	:wincmd ><CR>
nnoremap <silent> <C-x><C-f> :ALEGoToDefinition<CR>

"----------------------vue syntax highlight-------------------------

autocmd BufNewFile,BufEnter *.vue setfiletype vue
autocmd FileType vue setlocal autoindent expandtab shiftwidth=2 softtabstop=2 commentstring=//\ %s comments=://
\ | syntax include @HTML syntax/html.vim | unlet b:current_syntax
\ | syntax include @PUG syntax/pug.vim | unlet b:current_syntax
\ | syntax include @JS syntax/javascript.vim | unlet b:current_syntax
\ | syntax include @TS syntax/typescript.vim | unlet b:current_syntax
\ | syntax include @SASS syntax/sass.vim | unlet b:current_syntax
\ | syntax include @SCSS syntax/css.vim | unlet b:current_syntax
\ | syntax region vueHTMLTemplate matchgroup=vueTag start=/^<template>$/ end=/^<\/template>$/ contains=@HTML keepend
\ | syntax region vuePUGTemplate matchgroup=vueTag start=/^<template.*pug.*>$/ end='</template>' contains=@PUG keepend
\ | syntax region vueScript matchgroup=vueTag start=/^<script.*>$/ end='</script>' contains=@JS keepend
\ | syntax region vueTSScript matchgroup=vueTag start=/^<script.*ts.*>$/ end='</script>' contains=@TS keepend
\ | syntax region vueSassStyle matchgroup=vueTag start=/^<style.*sass.*>$/ end='</style>' contains=@SASS keepend
\ | syntax region vueScssStyle matchgroup=vueTag start=/^<style.*scss.*>$/ end='</style>' contains=@SCSS keepend
\ | syntax match htmlArg /v-text\|v-html\|v-if\|v-show\|v-else\|v-for\|v-on\|v-bind\|v-model\|v-pre\|v-cloak\|v-once/ contained
\ | syntax keyword htmlArg contained key ref slot
\ | syntax keyword htmlTagName contained component transition transition-group keep-alive slot
\ | syntax sync fromstart
highlight vueTag ctermfg=Blue

"----------------------memo list highlight-------------------------

autocmd Syntax * syn match Memo /\v<(MEMO)/ containedin=.*Comment,vimCommentTitle
highlight Memo ctermbg=yellow ctermfg=darkblue
