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

"---- HTML
Plugin 'othree/html5.vim'

"---- JavaScript
Plugin 'othree/es.next.syntax.vim'
Plugin 'othree/yajs.vim'

"---- JSX
Plugin 'mxw/vim-jsx'

"---- LiveScript
Plugin 'gkz/vim-ls'

"---- Markdown
Plugin 'plasticboy/vim-markdown'

"---- Perl
Plugin 'vim-perl/vim-perl'

"---- Pug
Plugin 'digitaltoad/vim-jade'

"---- Python
Plugin 'klen/python-mode'

"---- Sass
Plugin 'tpope/vim-haml'

"---- Stylus
Plugin 'wavded/vim-stylus'

"---- Vue
Plugin 'posva/vim-vue'

"--------------------------

"-- Interface

"---- colorscheme
Plugin 'altercation/vim-colors-solarized'

"---- cursor
Plugin 'miyakogi/conoline.vim'

"---- file system
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"---- git diff
Plugin 'airblade/vim-gitgutter'

"---- status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--------------------------

"-- Integrations

"---- git wrapper
Plugin 'tpope/vim-fugitive'

"--------------------------

"-- Others

"---- aligning text
Plugin 'godlygeek/tabular'

"--------------------------

" All of your Plugins must be added before the following line

"-------------------------------------------------------------------

call vundle#end()   " required
filetype plugin on  " required

"------------------------plugins setting----------------------------

"-- conoline
let g:conoline_auto_enable=1

"-- nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
colorscheme solarized
let g:solarized_contrast='low'
let g:solarized_termcolors=256
set background=dark
syntax enable

"-- vim-markdown
let g:vim_markdown_folding_disabled = 1

"------------------------general setting----------------------------

syntax on
hi Comment ctermfg=033
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

"-- NERDTree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('html', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('js', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('ls', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
