call plug#begin('~/.vim/plugged')
 Plug 'Valloric/YouCompleteMe'
 Plug 'godlygeek/tabular'
 Plug 'plasticboy/vim-markdown'
 Plug 'junegunn/vim-github-dashboard'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'preservim/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'ryanoasis/vim-devicons'
 Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
call plug#end()
syntax on
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter * if argc() > 0 || exists("s:std_in") | NERDTree %:h | wincmd p | endif
imap { {}<Esc>i
imap [ []<Esc>i
imap ( ()<Esc>i
imap < <><Esc>i
set cursorline
set encoding=utf-8
set foldenable
set foldmethod=manual
set guifont=DroidSansMono\ Nerd\ Font\ 11
set helplang=cn
set number
set relativenumber
set ruler
set scrolloff=3
set shell=sh
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 0
let g:airline_theme='raven'
let g:github_dashboard = { 'username': 'LiHua-Official', 'password': $ddcc37f30aa2dc758646b83d205e6f5d7ff2ab09432499af59ed435ee13dccb49c6d493aac710ec2cd126c1358a694fce96407ec508efe9ca0c573 }
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:vim_markdown_autowrite = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_toc_autofit = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_error_symbol = 'E'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_warning_symbol = 'W'
