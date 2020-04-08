" *********************************************
" Vbundle插件管理
" *********************************************
set nocompatible              " required
set nu              " required
filetype off                  " required
let python_highlight_all=1
syntax on
set hlsearch
set encoding=utf-8
set clipboard=unnamed
set ts=4
set mouse=a        "启用鼠标"
set backspace=2
set completeopt-=preview
"历史命令保存行数
set history=100

"当文件被外部改变时自动读取
set autoread

"取消自动备份及产生swp文件
set nobackup
set nowb
set noswapfile
"允许区域选择
set selection=exclusive
set selectmode=mouse,key

"高亮光标所在行
set cursorline

"取消光标闪烁
set novisualbell

"总是显示状态行
set laststatus=2
"状态栏显示当前执行的命令
set showcmd

"标尺功能，显示当前光标所在行列号
set ruler

"设置命令行高度为3
set cmdheight=3

"粘贴时保持格式
set paste

"高亮显示匹配的括号
set showmatch"设置命令行高度为3
set cmdheight=3

"粘贴时保持格式
set paste

"高亮显示匹配的括号
set showmatch

"在搜索的时候忽略大小写
set ignorecase

"高亮被搜索的句子
set hlsearch

"在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

"继承前一行的缩进方式，特别适用于多行注释
set autoindent



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'vim-scripts/ag.vim' 
Plugin 'dyng/ctrlsf.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" jedi
"let g:SuperTabDefaultCompletionType = "context"
" All these mappings work only for python code:
" Go to definition
" Find ocurrences
" Find assignments
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" *********************************************
" " 分割布局相关
" " *********************************************
" set splitbelow
" set splitright
" "快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
" "ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" 文件内容搜索
nnoremap <Leader>f :CtrlSF<Space>
map <s-j> <c-j>p
map <s-k> <c-k>p 
let g:ctrlsf_default_view_mode = 'compact'

" *********************************************
" " Tomorrow主题配置
" " *********************************************
set t_Co=256
set background=dark
colorscheme Tomorrow-Night

" 开启代码折叠功能
" 根据当前代码行的缩进来进行代码折叠
set foldmethod=indent
set foldlevel=99
" 将折叠za快捷键映射到space空格键上
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
" *********************************************
" NERD插件属性
" *********************************************
" 关闭NERDTree快捷键
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1


" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

au vimenter * NERDTree   " 开启vim的时候默认开启NERDTree
"map <F2> :NERDTreeToggle<CR>  " 设置F2为开启NERDTree的快捷键
nmap ,t :NERDTreeFind<CR>


" 启动时自动focus
map <leader>t :TagbarToggle<CR>
let g:tagbar_auto_faocus =1
" 启动指定文件时自动开启tagbar
autocmd BufReadPost *.py,*.pyc,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" *********************************************
" vim-airline
" *********************************************
" 开启powerline字体
let g:airline_powerline_fonts = 1
" 使用powerline包装过的字体
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" *********************************************
" ctrlp
" *********************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'


" *********************************************
" python代码风格PEP8
" *********************************************
au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set noexpandtab|set autoindent|set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2|set softtabstop=2|set shiftwidth=2

" 多余空格
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
