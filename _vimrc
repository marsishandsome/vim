"  ----------------------------------------------------------------------
"vimrc file for Linux/Windows, GUI/Console
"
"refer to   http://blog.csdn.net/tietao/article/details/6862341
"           http://blog.csdn.net/tge7618291/article/details/4216977
"           http://www.cnblogs.com/windowswind/archive/2012/03/22/2450079.html
"
"vim 练习游戏：http://vim-adventures.com
"
" help add-local-help
" help usr_29  common commands
" help usr_30  common commands
"
" 0     到行首
" $     到行尾 
" %     跳转到配对的括号去
" gD    跳转到局部变量的定义出
" fx    向右跳到字符x处（x可以是任何字符）
" Fx    向左跳到字符x处（x可以是任何字符）
"
" C-b   向上滚一屏
" C-f   向上滚一屏
" C-y   向上滚一行
" C-e   向下滚一行
"
" ZZ    退出vi并保存
"
" qcharacter    开始录制宏，character为a-z任意字符
" q:            终止录制宏
" @character    调用先前录制的宏
"
" gg=G          格式化代码
" "+y           复制到系统剪贴板
" "+p           从系统剪贴板复制
"----------------------------------------------------------------------
"
nmap <silent>sp :split<CR>
nmap <silent>vsp :vsplit<CR>

set nocompatible            " 关闭 vi 兼容模式  
syntax on                   " 自动语法高亮  
colorscheme desert          " 设定配色方案  
set number                  " 显示行号  
set cursorline              " 突出显示当前行  
set ruler                   " 打开状态栏标尺  
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4  
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格  
set tabstop=4               " 设定 tab 长度为 4  
set expandtab		        "自动将tab替换为4个空格
":retab 替换所以的tab为空格
set nobackup                " 覆盖文件时不备份  
set autochdir               " 自动切换当前目录为当前文件所在的目录  
filetype plugin indent on   " 开启插件  
set backupcopy=yes          " 设置备份时的行为为覆盖  
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感  
set nowrapscan              " 禁止在搜索到文件两端时重新搜索  
set incsearch               " 输入搜索内容时就显示搜索结果  
set hlsearch                " 搜索时高亮显示被找到的文本  
set noerrorbells            " 关闭错误信息响铃  
set novisualbell            " 关闭使用可视响铃代替呼叫  
set t_vb=                   " 置空错误铃声的终端代码  
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号  
" set matchtime=2             " 短暂跳转到匹配括号的时间  
set magic                   " 设置魔术  
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存  
set guioptions-=T           " 隐藏工具栏  
set guioptions-=m           " 隐藏菜单栏  
"set smartindent             " 开启新行时使用智能自动缩进  
"set backspace=indent,eol,start  
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符  
set cmdheight=1             " 设定命令行的行数为 1  
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)  
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 0
                            " 设置在状态行显示的信息  
" set foldenable              " 开始折叠  
" set foldmethod=syntax       " 设置语法折叠  
" set foldcolumn=0            " 设置折叠区域的宽度  
" setlocal foldlevel=1        " 设置折叠层数为  
"set foldclose=all           " 设置为自动关闭折叠                              
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  0
                            " 用空格键来开关折叠  
                            "
let mapleader = "\\"

" return OS type, eg: windows, or linux, mac, et.st..  
function! MySys()  
    if has("win16") || has("win32") || has("win64") || has("win95")  
        return "windows"  
    elseif has("unix")  
        return "linux"  
    endif  
endfunction  

" 用户目录变量$VIMFILES  
if MySys() == "windows"  
    let $VIMFILES = $VIM.'/vimfiles'  
elseif MySys() == "linux"  
    let $VIMFILES = $HOME.'/.vim'  
endif  

" 设定doc文档目录  
let helptags=$VIMFILES.'/doc'  

" 设置字体 以及中文支持  
if has("win32")  
    set guifont=Inconsolata:h12:cANSI  
endif  

" 配置多语言环境  
if has("multi_byte")  
    set fileencodings=utf-8,gb2312,gbk,gb18030
    set termencoding=utf-8  
    set encoding=utf-8

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'  
        set ambiwidth=double  
    endif  

    if has("win32")  
        source $VIMRUNTIME/delmenu.vim  
        source $VIMRUNTIME/menu.vim  
    endif  
else  
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"  
endif  


"-----------------------------------------------------------------
" Markdown file Preview using Chrome Plugin 'Markdown Preview Plus'
" Shortcut \p
"-----------------------------------------------------------------
if MySys() == "windows"
    if has("win64")
        autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "%:p"<CR>
    else
        autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "C:\Program Files\Google\Chrome\Application\chrome.exe" "%:p"<CR>
    endif
elseif MySys() == "linux"  
    nnoremap <Leader>p :!chromium-browser "%:p"<CR>
endif  


"-----------------------------------------------------------------  
" plugin - pathogen.vim
" 管理插件的插件
"-----------------------------------------------------------------  
runtime bundle/Pathogen/autoload/pathogen.vim
execute pathogen#infect()
"filetype plugin indent on


"-----------------------------------------------------------------  
" plugin - taglist.vim  查看函数列表，需要ctags程序  
" tl 打开隐藏taglist窗口  
"-----------------------------------------------------------------  
" if MySys() == "windows"                " 设定windows系统中ctags程序的位置  
    " let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'  
" elseif MySys() == "linux"              " 设定windows系统中ctags程序的位置  
    " let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
" endif  
nnoremap <silent>tl :TlistToggle<CR>  
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的  
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim  
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口  
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表  
let Tlist_Auto_Open = 0  
let Tlist_Auto_Update = 1  
let Tlist_Hightlight_Tag_On_BufEnter = 1  
let Tlist_Enable_Fold_Column = 0  
let Tlist_Process_File_Always = 1  
let Tlist_Display_Prototype = 0  
let Tlist_Compact_Format = 1  


"-----------------------------------------------------------------  
" plugin - minibufexpl.vim
"-----------------------------------------------------------------  
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 


"-----------------------------------------------------------------  
" plugin - winmanager.vim
" wm 打开winmanager
"-----------------------------------------------------------------  
"let g:winManagerWindowLayout = 'FileExplorer|TagList'
let g:winManagerWindowLayout = 'FileExplorer,TagList'
let g:persistentBehaviour=0 
let g:winManagerWidth=35
let g:defaultExplorer=1
nmap <silent>wm :WMToggle<CR>


"-----------------------------------------------------------------  
" plugin - ctags    函数变量跳转
" ctags -R          生成c文件tag
"ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 生成c++文件tag
" set tags=../tags    设置tag文件
" C-]               跳转到定义出
" C-t               跳转到原来的地方
"-----------------------------------------------------------------  


"-----------------------------------------------------------------  
" plugin - omnicppcomplete 输入时实时提供类或结构的属性或方法的提示和补全
" C-x C-o   弹出提示框
" C-n       下一个
" C-p       上一个
"-----------------------------------------------------------------  
set nocp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1  
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
"set cindent
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main


"-----------------------------------------------------------------  
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录  
" :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree  
" o 打开关闭文件或者目录         t 在标签页中打开  
" T 在后台标签页中打开           ! 执行此文件  
" p 到上层目录                   P 到根目录  
" K 到第一个节点                 J 到最后一个节点  
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）  
" r 递归刷新当前目录             R 递归刷新当前根目录  
"-----------------------------------------------------------------  
" F3 NERDTree 切换  
map <F3> :NERDTreeToggle<CR>  
imap <F3> <ESC>:NERDTreeToggle<CR>  


"-----------------------------------------------------------------  
" plugin - NeoComplCache.vim    自动补全插件  
"-----------------------------------------------------------------  
let g:neocomplcache_enable_at_startup = 1 		        " Use neocomplcache. 
let g:neocomplcache_enable_smart_case = 1 		        " Use smartcase. 
let g:neocomplcache_enable_camel_case_completion = 1 	" Use camel case completion. 
let g:neocomplcache_enable_underbar_completion = 1   	" Use underbar completion. 
let g:neocomplcache_min_syntax_length = 3 	     	    " Set minimum syntax keyword length. 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' 

" Define dictionary. 
let g:neocomplcache_dictionary_filetype_lists = { 
            \ 'default' : '', 
            \ 'vimshell' : $HOME.'/.vimshell_hist', 
            \ 'scheme' : $HOME.'/.gosh_completions' 
            \ } 

" Define keyword. 
if !exists('g:neocomplcache_keyword_patterns') 
    let g:neocomplcache_keyword_patterns = {} 
endif 
let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 

inoremap <expr><C-g>     neocomplcache#undo_completion() 
inoremap <expr><C-l>     neocomplcache#complete_common_string() 
" <CR>: close popup and save indent. 
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
" <C-h>, <BS>: close popup and delete backword char. 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><C-y>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup() 
"let g:neocomplcache_enable_auto_select = 1 	" AutoComplPop like behavior. 


"-----------------------------------------------------------------  
" plugin - a.vim
" A few of quick commands to swtich between source files and header files quickly.")
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <Leader>ih switches to file under cursor
" <Leader>is switches to the alternate file of file under cursor(e.g.on  <foo.h> switches to foo.cpp)
" <Leader>ihn cycles through matches
"-----------------------------------------------------------------  


"-----------------------------------------------------------------  
" plugin - multple cursors
" MultipleCursorsFind
"-----------------------------------------------------------------  
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
"let g:multi_cursor_start_key='<F7>'


"-----------------------------------------------------------------  
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释  
"-----------------------------------------------------------------  
let g:DoxygenToolkit_briefTag_pre="@brief "  
let g:DoxygenToolkit_paramTag_pre="@param "  
let g:DoxygenToolkit_returnTag="@returns "  
let g:DoxygenToolkit_authorName="Mars Gu <mars.gu@sap.com>"  
let g:DoxygenToolkit_licenseTag="My own license"


"----------------------------------------------------------------------
" plugin - NERD_commenter.vim   注释代码用的，  
" [count],cc 光标以下count行逐行添加注释(7,cc)  
" [count],cu 光标以下count行逐行取消注释(7,cu)  
" [count],cm 光标以下count行尝试添加块注释(7,cm)  
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行  
"----------------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格   "  
let NERDCompactSexyComs=1   " 多行注释时样子更好看  "  


"-----------------------------------------------------------------  
" plugin - visualmark.vim
" For both vim and gvim, use "mm" to toggle a visual mark.
" Use "F6" to navigate through the visual marks forward in the file.
" Use "Shift + F6" to  navigate backwards.
"-----------------------------------------------------------------  


"-----------------------------------------------------------------  
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。  
" \m  mark or unmark the word under (or before) the cursor  
" \r  manually input a regular expression. 用于搜索.  
" \n  clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .  
" \*  j前MarkWord的下一个     \#  当前MarkWord的上一个  
" \/  所有MarkWords的下一个    \?  所有MarkWords的上一个  
"-----------------------------------------------------------------  



