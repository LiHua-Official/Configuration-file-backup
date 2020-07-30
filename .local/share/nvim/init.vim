" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

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
