"
"PlugInstall [name ...] [#threads]	Install plugins
"PlugUpdate [name ...] [#threads]	Install or update plugins
"PlugClean[!]	Remove unlisted plugins (bang version will clean without prompt)
"PlugUpgrade	Upgrade vim-plug itself
"PlugStatus	Check the status of plugins

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" pip3 install --user pynvim
call plug#begin('~/.vim/plugged')


" vim-terminal
Plug 'tc50cal/vim-terminal'

" jsx
Plug 'mxw/vim-jsx', {'for': 'Javascript'}
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"TagList
"Plug 'taglist.vim'
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1 


Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
"map <F3> :NERDTreeToggle<CR>
"map <F5> :TlistToggle<CR>
"let Tlist_Inc_Winwidth = 50
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '^__pycache__$', '\.o$']

"clisp
"Bundle 'slimv.vim'
"Bundle 'wting/rust.vim'
"golang
Plug 'fatih/vim-go', {'for': 'golang'}
"F7检查语法
Plug 'nvie/vim-flake8', {'for': 'python'}
let g:flake8_ignore="E501,E701"
let g:flake8_max_line_length=99

"python补全
" Plug 'davidhalter/jedi-vim', {'for': 'python'}


" 新的补全插件试一下
" https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1
"python补全
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}

" " python语法检查
" Plug 'dense-analysis/ale'
" "let b:ale_linters = ['flake8', 'gcc']
" let b:ale_linters = ['flake8', ]
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_sign_column_always = 1
" " Set this in your vimrc file to disabling highlighting
" " let g:ale_set_highlights = 0
" " 只在保存的时候检查
" " Write this in your vimrc file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" " You can disable this option too
" " if you don't want linters to run on opening a file
" " let g:ale_lint_on_enter = 0


" 使用vim-syntastic需要flake8
Plug 'scrooloose/syntastic', {'for': 'python'}
"在打开文件的时候检查
let g:syntastic_check_on_open=1


"let g:vimwiki_list = [{'path': '~/vimwiki','path_html': '~/code/0x55aa/1/wiki/','template_path': '~/code/0x55aa/1/wiki/tmp/','tempalte_default': 'default','template_ext': '.html','auto_export': 1,}]
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code' 


" Bundle 'my-vim'
call plug#end()



filetype plugin indent on     " required!


"开启语法高亮
syntax on

" 高亮多余的空白字符及 Tab
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

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
" 数字都当成十进制
set nrformats=
"反显光标当前行颜色
if has('gui_running')
    set cursorline
    "hi cursorline guibg=#330003
endif
"编码
"set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,iso-8859-6
set encoding=utf-8

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



au FileType javascript.jsx setlocal sw=2 sts=2 et
au FileType javascript setlocal sw=2 sts=2 et


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

" 光标行高亮
"set cursorcolumn
"set cursorline
"highlight CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"
"
"tsx高亮
au BufNewFile,BufRead *.tsx set filetype=javascript.jsx
au BufNewFile,BufRead *.ts set filetype=javascript


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
vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"vmap <C-c> :w !pbcopy<CR><CR>
"vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
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
"noremap <C-Z> u
"inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
"noremap <C-Y> <C-R>
"inoremap <C-Y> <C-O><C-R>

" CTRL-A is Select all 
" noremap <C-A> gggH<C-O>G
" inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
" cnoremap <C-A> <C-C>gggH<C-O>G
" onoremap <C-A> <C-C>gggH<C-O>G
" snoremap <C-A> <C-C>gggH<C-O>G
" xnoremap <C-A> <C-C>ggVG

"修改成了tab标签的移动 
noremap <C-Tab> :tabn<CR>
inoremap <C-Tab> :tabn<CR>
cnoremap <C-Tab> :tabn<CR>
onoremap <C-Tab> :tabn<CR>

"插入模式光标移动
"挺蛋疼，最好不用
inoremap <C-B> <Left>
inoremap <C-F> <Right>

" 复制刚p的文本
nnoremap gb `[v`]





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
