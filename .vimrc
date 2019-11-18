"---------------------------Vundle----------------------------------

" Vundle tutorial on github: https://github.com/VundleVim/Vundle.vim
set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-----------------------Vundle plugins------------------------------

"-- Language

"---- CSS
Plugin 'hail2u/vim-css3-syntax'

"---- Golang
Plugin 'fatih/vim-go'

"---- HTML
Plugin 'othree/html5.vim'

"---- JavaScript
Plugin 'pangloss/vim-javascript'

"---- LiveScript
Plugin 'gkz/vim-ls'

"---- Markdown
Plugin 'plasticboy/vim-markdown'

"---- Nodejs
Plugin 'moll/vim-node'

"---- Perl
Plugin 'vim-perl/vim-perl'

"---- Pug
Plugin 'digitaltoad/vim-jade'

"---- Python
Plugin 'hdima/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'

"---- Sass
Plugin 'tpope/vim-haml'

"---- Solidity
Plugin 'tomlion/vim-solidity'

"---- Stylus
Plugin 'wavded/vim-stylus'

"---- TypeScript
Plugin 'leafgarland/typescript-vim'

"--------------------------

"-- Interface

"---- colorscheme
Plugin 'altercation/vim-colors-solarized'

"---- cursor
Plugin 'miyakogi/conoline.vim'

"---- git diff
Plugin 'airblade/vim-gitgutter'

"---- status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--------------------------

"-- Others

"---- ack
Plugin 'mileszs/ack.vim'

"---- aligning text
Plugin 'godlygeek/tabular'

"---- language server protocol (https://github.com/neoclide/coc.nvim)
Plugin 'neoclide/coc.nvim'

"--------------------------

" All of your Plugins must be added before the following line

"-------------------------------------------------------------------

call vundle#end()   " required
filetype plugin on  " required

"------------------------plugins setting----------------------------

"---- ack
let g:ackprg='ag --vimgrep'

"-- coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"-- conoline
let g:conoline_auto_enable=1

"-- python-syntax
let python_highlight_all=1

"-- vim-airline
let g:airline_powerline_fonts=1                     " enable powerline fonts
let g:airline_section_c='%t'
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1          " enable tabline
let g:airline#extensions#tabline#left_alt_sep='|'   " set left separator which are not editing
let g:airline#extensions#tabline#left_sep=' '       " set left separator
let g:airline#extensions#whitespace#enabled=0
set laststatus=2                                    " set status line

"-- vim-colors-solarized
colorscheme darkblue
let g:solarized_contrast='low'
let g:solarized_termcolors=256
set background=dark
syntax enable

"-- vim-markdown
let g:vim_markdown_folding_disabled = 1

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

"----------------------vue syntax highlight-------------------------

autocmd BufNewFile,BufEnter *.vue setfiletype vue
autocmd FileType vue setlocal autoindent expandtab shiftwidth=2 softtabstop=2 commentstring=//\ %s comments=://
\ | syntax include @HTML syntax/html.vim | unlet b:current_syntax
\ | syntax include @PUG syntax/pug.vim | unlet b:current_syntax
\ | syntax include @JS syntax/javascript.vim | unlet b:current_syntax
\ | syntax include @TS syntax/typescript.vim | unlet b:current_syntax
\ | syntax include @SASS syntax/sass.vim | unlet b:current_syntax
\ | syntax include @SCSS syntax/css.vim | unlet b:current_syntax
\ | syntax region vueHTMLTemplate matchgroup=vueTag start=/^<template>$/ end='</template>' contains=@HTML keepend
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
