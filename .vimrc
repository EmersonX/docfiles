"################### 包依赖 #####################
" package dependence: ctags, llvm, cfe
" python dependence: pep8, pyflakes

filetype on
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on


"定义快捷键键盘前缀,即leaderi
let mapleader=";"

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" Ctrl + S 保存当前窗口
nmap <C-S> :w<CR>
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 到达行头和行尾的快捷键
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

set backspace=indent,eol,start
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T 
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
" 制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 选择雅黑字体
set guifont=Microsoft\ YaHei\ Mono\ 13.5
" 基于缩进或语法进行代码折叠
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" Alt组合键不映射到菜单上
set winaltkeys=no

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 添加Vundle管理插件
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" let Vundle manage Vundle, required
" :BundleInstall    install 安装配置的插件
" :BundleInstall!   update 更新
" :BundleClean      remove plugin not in list 删除本地无用插件
Bundle 'gmarik/vundle'

" 主题 solarized
Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 主题 molokai
Bundle 'tomasr/molokai'
let g:molokai_original = 1
" 配色方案
set background=dark
set t_Co=256
if has("gui_running")
   let g:isGUI = 1
else
   let g:isGUI = 0
endif
if g:isGUI
    colorscheme solarized
    "colorscheme molokai
    "colorscheme phd
else
    "colorscheme solarized
    colorscheme molokai
    "colorscheme phd
endif

" 自动补全插件
Bundle 'Valloric/YouCompleteMe'
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库 tags
" set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全            
let g:ycm_seed_identifiers_with_syntax=1
" YouCompleteMe 通过 jedi插件来补全Python

" 显示tag列表 
Bundle 'majutsushi/tagbar'
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
nnoremap <Leader>tl :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

" 目录树插件
Bundle 'scrooloose/nerdtree'
" NERDTREE临时测试使用
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" 显示NERDTree的书签
let NERDTreeShowBookmarks=1

" 状态栏插件
Bundle 'Lokaltog/vim-powerline'
 " 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" syntastic是一个代码检查的插件
Bundle 'scrooloose/syntastic'
" Python已经有pylint来检查, 而且syntastic检查Python会在保存时有很长时间的卡顿,
" 所以禁用它对Python文件的检查 
" let g:syntastic_ignore_files=[".*\.py$"]
let g:yntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
highlight SyntasticErrorSign guifg=white guibg=black
