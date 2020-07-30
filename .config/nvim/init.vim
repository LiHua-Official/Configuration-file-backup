" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
let skip_defaults_vim=1

syntax enable

set nocompatible                        " 不兼容vi模式

set langmenu=en_US                      " 菜单语言 中文为 zh_CN

set fileencodings=utf-8,chinese,latin-1

set fileencoding=utf-8                  " 中文不乱码了，世界都好了

set number                              " 窗口左侧显示行号

set cursorline

set relativenumber                      " 配合number，更高效的行间跳转

set nolinebreak                         " 在单词中间断行

set scrolloff=5                       " 设定光标离窗口上下边界 5 行时窗口自动滚动

au GUIEnter * simalt ~x                " vim 以最大化打开

set ignorecase                          " 查找时忽略大小写

set smartcase                          " 当输入中含有大写的时候会强制区分大小写

set incsearch                          " 输入进行中实时匹配查找到的字符串

set autoindent                          " 用来自动缩进

set smartindent                        " 自动判断缩进长度，一般适用于类C语言

set expandtab                          " 用一定的空格来代替tab

set tabstop=4                          " tab占4个空格

set softtabstop=4                      " 设置expandtab的情况下，输入backspace删除的空格

set shiftwidth=4                        "一般情况下tabstop=softtabstop=shiftwidth，这样不会乱

set ruler                             " 打开状态栏标尺

autocmd Filetype markdown inoremap <buffer> <silent> ,, <++>
autocmd Filetype markdown inoremap <buffer> <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> <silent> ,s <Esc>/ <++><CR>:nohlsearch<CR>c5l
autocmd Filetype markdown inoremap <buffer> <silent> ,- ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> <silent> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> <silent> ,x ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> <silent> ,p ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> <silent> ,q `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> <silent> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> <silent> ,g - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,u <u></u><++><Esc>F/hi
autocmd Filetype markdown inoremap <buffer> <silent> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> <silent> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> <silent> ,t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

noremap r :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!firefox % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run %
    endif
endfunc

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkarter/bullets.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Initialize plugin system
call plug#end()
