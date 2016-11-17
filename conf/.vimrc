
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

" jsx
Bundle 'mxw/vim-jsx'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" vim-scripts repos    #http://vim-scripts.org/vim/scripts.html

"pydiction
"Bundle 'Pydiction'
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
"let g:pydiction_menu_height = 20

"Bundle 'klen/python-mode'

"TagList
Bundle 'taglist.vim'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1 

"WinManager,bufexplorer
"Bundle 'bufexplorer.zip'
"Bundle 'winmanager'
"let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList'
"let g:winManagerWindowLayout='FileExplorer,BufExplorer|TagList'
"let g:miniBufExplorerMoreThanOne = 0
"nmap wm :WMToggle<cr>

Bundle 'scrooloose/nerdtree'
"map <F3> :NERDTreeToggle<CR>
"map <F5> :TlistToggle<CR>
"let Tlist_Inc_Winwidth = 50
let NERDTreeIgnore=['\.pyc$']

"clisp
"Bundle 'slimv.vim'
"Bundle 'wting/rust.vim'
"golang
Bundle 'jnwhiteh/vim-golang'
"F7检查语法
Bundle 'vim-flake8'
let g:flake8_ignore="E501"
let g:flake8_max_line_length=99

"python补全
Bundle 'davidhalter/jedi-vim'


" 使用vim-syntastic需要flake8
Bundle 'scrooloose/syntastic'
"在打开文件的时候检查
let g:syntastic_check_on_open=1

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

"Bundle 'vimwiki'

"let g:vimwiki_list = [{'path': '~/vimwiki','path_html': '~/code/0x55aa/1/wiki/','template_path': '~/code/0x55aa/1/wiki/tmp/','tempalte_default': 'default','template_ext': '.html','auto_export': 1,}]
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code' 

" django 
"Bundle 'snipMate'
"autocmd FileType python set ft=python.django " For SnipMate
"autocmd FileType html set ft=htmldjango.html " For SnipMate

Bundle 'my-vim'

call vundle#end()            " required

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"开启语法高亮
syntax on
"窗口大小
if has('gui_running')
    set lines=35 columns=118
endif
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
"关闭/打开配对括号高亮
"let loaded_matchparen = 1
"显示行号：
set number
"set relativenumber
"配色方案
colorscheme darkblue
"colorscheme desert
"colorscheme solarized
"去掉菜单栏
set guioptions-=m
"去掉工具栏
set guioptions-=T
"总是显示标签栏
set showtabline=2
"反显光标当前行颜色
if has('gui_running')
    set cursorline
    "hi cursorline guibg=#330003
endif
"编码
"set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,iso-8859-6

"背景色
"set background=light
set background=dark
":highlight Normal ctermfg=DarkGrey ctermbg=DarkGrey


"自动补全  
"关键字补全
"    即简单地补全到文档中已有的词，快捷键为 Ctrl-N 或 Ctrl-P。 
"智能补全
"    Vim 7中引入 Omni Complete，可根据语义补全，快捷键为 Ctrl-X Ctrl-O。
"
set completeopt=longest,menu
"自动补全命令时候使用菜单式匹配列表  
set wildmenu

"开启自带的python提示
"autocmd FileType python set omnifunc=pythoncomplete#Complete




"""""""""
"Bundle 'pvim'
"autocmd FileType python set omnifunc=pvim#Complete
""""""""""




set expandtab
"一个tab4个空格
set tabstop=4
"每层缩进4个空格
set shiftwidth=4
"退格键，每次删除4个空格
set softtabstop=4
"
"代码折叠可以只以缩进为依据
autocmd FileType python setlocal foldmethod=indent
"默认展开所有代码	za会翻转当前位置的折叠状态
set foldlevel=99
" 增量式搜索，边输入边搜索
set incsearch
" 高亮搜索
set hlsearch
"自动切换目录
set autochdir
"81列处高亮
"set cc=100
" 备份，需要创建文件夹
set backup
set dir=~/.vim/tmp/backup " backups:"""
set backupdir=~/.vim/tmp/backup " backups:"""
"let &backupext = '-' . substitute(expand("%:h"), '/', '-', 'g') . '~'
function Replacetext(text)
    let r_text = a:text
    for sss in ['/','\','*','?','[','|','/<','/>']
        let r_text = substitute(r_text, sss, '_', 'g')
        "echo r_text
    endfor
    return r_text
endfunction
autocmd BufWritePre * let &backupext = '-' . Replacetext(expand("%:p")) . strftime("-%y%m%d-%T") . '~'
 

"""来自mswin.vim
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
"vnoremap <C-X> "+x
"vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
""""MAC
"map <F2> :.w !pbcopy<CR><CR>
"map <F3> :r !pbpaste<CR>


" CTRL-V and SHIFT-Insert are Paste
"map <C-V>		"+gP
"map <S-Insert>		"+gP

"cmap <C-V>		<C-R>+
"cmap <S-Insert>		<C-R>+
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"imap <S-Insert>		<C-V>
"vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
"noremap <C-Q>		<C-V>
noremap <C-M>		<C-V>
"inoremap <C-M>		<C-V>
" Use CTRL-S for saving, also in Insert mode
"noremap <C-S>		:update<CR>
"vnoremap <C-S>		<C-C>:update<CR>
"inoremap <C-S>		<C-O>:update<CR>


" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-A is Select all 
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

"修改成了tab标签的移动 
noremap <C-Tab> :tabn<CR>
inoremap <C-Tab> :tabn<CR>
cnoremap <C-Tab> :tabn<CR>
onoremap <C-Tab> :tabn<CR>

"插入模式光标移动
"挺蛋疼，最好不用
inoremap <C-B> <Left>
inoremap <C-F> <Right>






"插入模式
"    Ctrl-T增加缩进，Ctrl-D减小缩进。 
"命令模式
"    >> 右缩进， << 左缩进，注意n<< 或 n>>是缩进多行，如4>> 
"可视模式
"    < 、 > 用于左右缩进， n< 、 n> 可做多节缩进，如 2> 。 

":set spell－开启拼写检查功能
":set nospell－关闭拼写检查功能
":]s－移到下一个拼写错误的单词
":[s－作用与上一命令类似，但它是从相反方向进行搜索
"z=－显示一个有关拼写错误单词的列表，可从中选择
"zg－告诉拼写检查器该单词是拼写正确的
"zw－与上一命令相反，告诉拼写检查器该单词是拼写错误的
"set spell

":tabe /path/to/file.txt－在一个新的 tab 页中打开文件
":tabnew－新建一个 tab 页
":tabs－查看 tab 页列表，通过“>”显示当前窗口、“+”显示可修改的缓冲区
":tabc－关闭当前的 tab 页
":tab split－在当前缓冲区使用新的 tab 页打开文件
":tabn－切换到下一个 tab 页
":tabp－切换到上一个 tab 页
":tabr[ewind]－转到第一个 tab 页
":tabf[irst]－与上一命令作用相同

"        CTRL-W h        跳转到左边的窗口
"        CTRL-W j        跳转到下面的窗口
"        CTRL-W k        跳转到上面的窗口
"        CTRL-W l        跳转到右边的窗口
"用 vimdiff 显示文件差异

"autocmd BufWritePost *.py call Flake8()
