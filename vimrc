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
"let skip_defaults_vim=1

"""""""""""""""""""""""""""""""""""""""""""基本设置"""""""""""""""""""""""""""""""""""""""""""""
filetype on	"开启文件类型侦测
filetype indent on	"适应不同语言的缩进
syntax enable	"开启语法高亮功能
syntax on 	"允许使用用户配色


"""""""""""""""""""""""""""""""""""""""""""快捷键设置""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>    
inoremap jk <Esc>

""""""""""""""""""""""""""""""""""""""显示设置""""""""""""""""""""""""""""""""""""""""""""" 
set laststatus=2        	"总是显示状态栏 
set ruler               	"显示光标位置 
set number              	"显示行号
set cursorline          	"高亮显示当前行
set cursorcolumn            "高亮显示当前列
set hlsearch                " 高亮搜索结果
exec "nohlsearch"
set incsearch               "边输边高亮
set ignorecase              "搜索时忽略大小写
set smartcase

set relativenumber          "其他行显示相对行号
"set scrolloff=5            "垂直滚动时光标距底部位置


"""""""""""""""""""""""""""""""""""""""""""编码设置"""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936    " 检测文件编码,将fileencoding设置为最终编码
set fileencoding=utf-8                              " 保存时的文件编码
set termencoding=utf-8                              " 终端的输出字符编码
set encoding=utf-8                                  " VIM打开文件使用的内部编码


"""""""""""""""""""""""""""""""""""""""""""编辑设置"""""""""""""""""""""""""""""""""""""""""""""
set expandtab   	"扩展制表符为空格
set tabstop=4   	"制表符占空格数
set softtabstop=4	"将连续数量的空格视为一个制表符
set shiftwidth=4	"自动缩进所使用的空格数
"set textwidth=79	"编辑器每行字符数
set wrap            "设置自动折行
set linebreak       "防止单词内部折行
set wrapmargin=5      "指定折行处与右边缘空格数
set autoindent  	"打开自动缩进
set wildmenu    	"vim命令自动补全


call plug#begin('~/.vim/plugged')
"需要配置的插件都放在begin和end之间

Plug 'scrooloose/nerdcommenter' "多行注释
Plug 'jiangmiao/auto-pairs'     "括号、引号自动补全
Plug 'scrooloose/nerdtree' 	    "树形目录
Plug 'Yggdroot/indentLine'      "自动缩进插件
Plug 'vim-airline/vim-airline'  "状态栏主题
Plug 'vim-scripts/Solarized'    "主题
Plug 'honza/vim-snippets'       "代码片段补全
Plug 'SirVer/ultisnips'

"Plug 'mhinz/vim-startify'         "vim开始界面最近文件
"Plug 'connorholyday/vim-snazzy'   "主题方案
"Plug 'tpope/vim-commentary'       "代码注释
"Plug 'ryanoasis/vim-devicons'     "文件图标
"Plug 'Lokaltog/vim-powerline'     "状态栏主题

call plug#end()
