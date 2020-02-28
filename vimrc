"插件无关配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键的前缀，即<Leader>
let mapleader = ","

if has('statusline')
    set statusline=%F%m%r%w\ %{&ff}\ %Y\ [ascii:%b\ hex:0x\%02.2B]\ [%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %=%l/%L,%v\ %p%%
endif

nmap tt i<C-R>=strftime("%Y-%m-%d %I:%M")<CR><Esc>
cmap w!! w !sudo tee >/dev/null %

cmap tn tabnew 
cmap np set nopaste 
cmap ps set paste 
" nnoremap tn :tabnew<CR>
" cmap tn :tabnew<CR>

let g:SimpylFold_docstring_preview=1
set splitbelow
set splitright
set cc=150

" 设置配色方案
if has('gui_running')
	set background=dark
	let g:solarized_termcolors=256
	let g:solarized_termtrans=1
	let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
	color solarized             " Load a colorscheme
else
    set t_Co=256                
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    " solarized theme
    syntax enable
    colorscheme solarized
    set background=dark
    " set background=light
    hi Normal  ctermfg=252 ctermbg=none     " Transparent background
endif


"<leader>: \
"键盘命令
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
"快速打开文件
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Easier horizontal scrolling
map zl zL
map zh zH

" 默认方向键左右可以切换buffer
noremap <leader>bn :MBEbn<CR>
noremap <leader>bp :MBEbp<CR>
noremap <leader>bd :MBEbd<CR>

""实用设置
inoremap <Tab> <C-R>=CleverTab()<CR>
" 设置当文件被改动时自动载入
set autoread

"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup

"自动保存
set autowrite

" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent

"搜索相关
nnoremap / /
nnoremap ? /
nnoremap <leader>vr :.,$s//gec<left><left><left><left>
xnoremap <leader>vr "ty:.,$s/<c-r>t//gec<left><left><left><left>
nnoremap <leader>zr :.,$s//gec<left><left><left><left>\<<c-r><c-w>\>/
xnoremap <leader>zr "ty:.,$s/\<<c-r>t\>//gec<left><left><left><left>
nnoremap <leader>v/ :%s///gn<left><left><left><left>

"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

if has('python') " if dynamic py|py3, this line already activates python2
    let s:python_version = 2
elseif has('python3')
  let s:python_version = 3
else
  let s:python_version = 0
endif
" echomsg 'Using python'.s:python_version    

"命令行增强模式， ctrl－a／e 到行首／尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"映射<C-hjkl>切换上下左右的窗口
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

set nu
set autowriteall            "可使切换文件时，修改的文件被自动保存。
set noswapfile  	     "关闭交换文件
set cmdheight=1               "命令部分高度为1
set backupcopy=yes
set nowritebackup
" autocmd filetype crontab setlocal nobackup nowritebackup

" 状态栏
set laststatus=1            ""启动显示状态行(1),总是显示状态行(2
set nofoldenable  "关闭开启时默认折叠命令

" Set the default file encoding to UTF-8:
set encoding=utf-8

"
"close modelines model
set modelines=0
set foldenable " 开始折叠
" set foldmethod=syntax " 设置语法折叠
set foldmethod=indent
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=10 " 设置折叠层数为
" set foldlevel=99

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set colorcolumn=80
set formatoptions+=cql

"代码补全 
" set completeopt=preview,menu 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=preview,longest,menu
set tags=tags  

"开启光亮光标行
set cursorline
"开启高亮光标列
set cursorcolumn " nocursorcolumn

" match OverLength /\%80v.\+/
" highlight LineNr ctermbg=14 guibg=SeaGreen
" highlight OverLength ctermbg=7 guibg=SeaGreen
" highlight CursorLine cterm=NONE  ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green

" HIGHLIGHT
" cterm 表示为原生vim设置样式
" ctermbg 设置终端vim的背景色
" ctermfg 设置终端vim的前景色
" guibg 和 guifg 分别是设置gvim的背景色和前景色
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"

" or 
" highlight OverLength ctermbg=7 guibg=SeaGreen
" match OverLength /\%80v.\+/
" highlight LineNr ctermbg=14 guibg=SeaGreen

set listchars=tab:\|\ ,     " display tab as '|'
set list

"字符设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5
set encoding=utf-8
set fenc=utf-8
set hidden

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
set termencoding=utf-8

set ruler "总是在Vim窗口的右下角显示当前光标的行列信息”
set showcmd "在Vim窗口的右下角显示一个完整的命令已经完成的部分”
" set showmode    "显示当前工作模式
set incsearch "在键入要搜索的字串的同时就开始搜索当前已经键入的部分”
set cinoptions=g0,:0,N-s,(0

" Tab related
"spaces for indents
set shiftwidth=4    "sw设置缩进大小是4"
set tabstop=4    "Tab的大小是4"
set softtabstop=4   ""
set expandtab               " Use spaces instead of tabs
set cindent              "使用C语言的缩进方式
set autoindent "在开始一个新行时对该行施以上一行的缩进方式.”
set showmatch   " 显示括号配对show matching paren
set nocompatible    " 不兼容旧版本  no compative vi
set smartindent  " 智能对齐
set hid             " allow to change buffer without saving
set shortmess=atI   " shortens messages to avoid 'press a key' prompt
set lazyredraw      " do not redraw while executing macros (much faster)

" Set Number format to null(default is octal) , when press CTRL-A on number
" like 007, it would not become 010
" In Visual Block Mode, cursor can be positioned where there is no actual character
" set ve=block

set ignorecase  " Set search/replace pattern to ignore case
set smartcase   " Set smartcase mode on, If there is upper case character in the search patern, the 'ignorecase' option will be override.
set hlsearch    " highlight search
set magic       " Enable magic matching正则表达式匹配形式
"set mouse=a    " Enable mouse usage (all modes) in terminals

"esc的映射
imap jk <esc>

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

"取消搜索高亮
nnoremap <leader>h :noh<cr>
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]
"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>w <c-w>v<c-w>l

"使用<leader>t来控制Tab的切换
nnoremap <leader>t gt
nnoremap <leader>r gT

" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

" Set Up and Down non-linewise
noremap <Up> gk
noremap <Down> gj

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv



"初始化Vundele
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'a.vim'
Plugin 'mru.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'git://github.com/Lokaltog/vim-easymotion.git'
" 显示行末的空格
Plugin 'ShowTrailingWhitespace'

" 快速去行尾空格 [, + <Space>]
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'AutoClose'
Plugin 'majutsushi/tagbar'
Plugin 'word_complete.vim'
Plugin 'CmdlineComplete'
Plugin 'jiangmiao/auto-pairs'
Plugin 'superTab'
Plugin 'airblade/vim-gitgutter'
" Plugin 'AutoComplPop'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'hdima/python-syntax'
Plugin 'rkulla/pydiction'
Plugin 'davidhalter/jedi-vim'  " jedi-vim  plugin for python code.
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
"巨漂亮的NerdTree文件名高亮及图标插件
if has('gui_running')
    Plugin 'ryanoasis/vim-devicons'
endif
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'https://github.com/edkolev/tmuxline.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tmhedberg/SimpylFold'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/ctags.vim'
":q:Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
"代码代码缩略图
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" 前端html插件 
Plugin 'othree/html5.vim'
" HTML 助手
Plugin 'mattn/emmet-vim'
" css 语法高亮
Plugin 'hail2u/vim-css3-syntax' 
" 动补全后大括号
Plugin 'Raimondi/delimitMate'
" JavaScript 语法高亮
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0



call vundle#end()
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

"gui配置{
	if has('gui_running')
		set guifont=monaco\ 12   " 设置字体  
		set guioptions-=T           " 隐藏工具栏
		set guioptions-=m           " 隐藏菜单栏
		let g:Work = "~/github"		"设置gvim默认工作目录和换存目录
		function Cw(dir)
			execute ":cd  ".a:dir
		endfunction
		call Cw(Work)
	endif
	if has("multi_byte")
		" UTF-8 编码
		set encoding=utf-8
		set termencoding=utf-8
		set formatoptions+=mM
		set fencs=utf-8,gbk
		if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
			set ambiwidth=double
		endif
		if has("win32")
			source $VIMRUNTIME/delmenu.vim
			source $VIMRUNTIME/menu.vim
			language messages zh_CN.utf-8
		endif
	else
		echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
	endif
"}

"<leader>: \
"插件配置
"************************************************************
"easymotion {
	if isdirectory(expand("~/.vim/bundle/vim-easymotion/"))
		map ss <Plug>(easymotion-s)
		map SS <Plug>(easymotion-sol-bd-jk)
		let g:EasyMotion_smartcase = 1
		map <Leader><Leader>j <Plug>(easymotion-j)
		map <Leader><Leader>k <Plug>(easymotion-k)
		map <Leader><Leader>h <Plug>(easymotion-linebackward)
		map <Leader><Leader>l <Plug>(easymotion-lineforward)
		map <Leader><Leader>. <Plug>(easymotion-repeat)
		" <Leader>f{char} to move to {char}
		map <Leader>f <Plug>(easymotion-bd-f)
		nmap <Leader>f <Plug>(easymotion-overwin-f)
		" s{char}{char} to move to {char}{char}
		nmap ss <Plug>(easymotion-overwin-f2)
		" Move to line
		map <Leader>L <Plug>(easymotion-bd-jk)
		nmap <Leader>L <Plug>(easymotion-overwin-line)
		" Move to word
		" map <Leader>w <Plug>(easymotion-bd-w)
		" nmap <Leader>w <Plug>(easymotion-overwin-w)
	endif
"}

"vim-trailing-whitespace {
	if isdirectory(expand("~/.vim/bundle/vim-trailing-whitespace/"))
        map <leader><space> :FixWhitespace<cr>
	endif
"}

"AutoClose {
	if isdirectory(expand("~/.vim/bundle/AutoClose/"))
        let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'"} 
	endif
"}

" TagBar {
    if isdirectory(expand("~/.vim/bundle/tagbar/"))
        nnoremap <silent> <leader>tb :TagbarToggle<CR>
        " nnoremap <silent> <F4> :TagbarToggle<CR>
        let g:tagbar_autofocus = 1
        let g:tagbar_left = 1
        let g:tagbar_expand = 1
        let g:tagbar_compact = 1
        let g:tagbar_singleclick = 1
        let g:tagbar_autoshowtag = 1
        let g:tagbar_ctags_bin = 'ctags'
        let g:tagbar_width = 30
    endif
"}

"superTab {
	if isdirectory(expand("~/.vim/bundle/superTab/"))
        let g:SuperTabDefaultCompletionType="context"
        let g:SuperTabRetainCompletionType=2
        let g:SuperTabDefaultCompletionType="<C-X><C-O>"
	endif
"}

"vim-gitgutter {
	if isdirectory(expand("~/.vim/bundle/vim-gitgutter/"))
        " 同git diff,实时展示文件中修改的行
        "查看diff的修改我会比较常用，快捷键 <Leader>hp ,他会显示diff差异
        let g:gitgutter_map_keys = 0
        let g:gitgutter_highlight_lines = 1
        " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
        let g:gitgutter_enabled = 1
        nnoremap <leader>gs :GitGutterToggle<CR>
        "每个diff区块之间跳转（像图中就分了3块）。默认快捷键为 [c 和 ]c
        nmap ]h <Plug>GitGutterNextHunk
        nmap [h <Plug>GitGutterPrevHunk

        map <silent> <leader>1 :diffget 1<CR> :diffupdate<CR>
        map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
        map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
        map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>
	endif
"}

"syntastic {
	if isdirectory(expand("~/.vim/bundle/syntastic/"))
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_python_flake8_args = "--ignore=W391,E712,E741,W503,E502,E501,E402,E226,N802,E303,E251,F405,F302,E221,E302,F401"  
        " need do: sudo easy_install flake8
        let g:syntastic_python_checkers = ['flake8']
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        " location list （:help lnext） 来导航错误列表
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
	endif
"}

" vim-go{
	if isdirectory(expand("~/.vim/bundle/vim-go/"))
		let g:go_fmt_command = "goimports"
		"let mapleader = ','
		" go快捷键,<leader>是默认是\
		let g:go_highlight_functions = 1
		let g:go_highlight_methods = 1
		let g:go_highlight_structs = 1
		let g:go_highlight_operators = 1
		let g:go_highlight_build_constraints = 1
		let g:go_fmt_command = "goimports"
		let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
		let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
        "let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
        "let g:go_metalinter_deadline = "5s"
        let g:go_def_mode = 'godef'
        "shows :GoInfo whereever the cursor moves to
        let g:go_auto_type_info = 1
        let g:go_auto_sameids = 1
        let g:go_autodetect_gopath = 0
        let g:go_fmt_experimental=1
        let g:go_list_type="quickfix"
        let g:go_metalinter_autosave=1
        let g:go_textobj_include_function_doc = 1
		au FileType go nmap <Leader>gil <Plug>(go-implements)
		au FileType go nmap <Leader>gi <Plug>(go-info)
		au FileType go nmap <Leader>gd <Plug>(go-doc)
		au FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)
		au FileType go nmap <leader>gr <Plug>(go-run)
		au FileType go nmap <leader>gb <Plug>(go-build)
		au FileType go nmap <leader>gt <Plug>(go-test)
		au FileType go nmap <leader>gc <Plug>(go-coverage)
		au FileType go nmap <Leader>gds <Plug>(go-def-split)
		au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
		au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
		au FileType go nmap <Leader>grn <Plug>(go-rename)
	endif
" }

" NerdTree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
		" map <silent> <F3> :NERDTreeToggle<CR>
        map tr :NERDTreeToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=1
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
		"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
		autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg <CR><CR> && exec "redr!"
		"autocmd VimEnter * NERDTree
		autocmd VimEnter * wincmd w
    endif
" }

"tmuxline {
	if isdirectory(expand("~/.vim/bundle/tmuxline.vim/"))
        augroup tmuxline
            autocmd!
            autocmd VimEnter,ColorScheme * silent! Tmuxline vim_statusline_1
            autocmd VimLeave * !tmux source-file ~/.tmux.conf
        augroup END
        let g:tmuxline_powerline_separators = 0
    endif
"}

"ctrlp {
	if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
		set runtimepath^=~/.vim/bundle/ctrlp.vim
		" <leader>f   # 模糊搜索最近打开的文件(MRU)
		" <leader>p   # 模糊搜索当前目录及其子目录下的所有文件
		" ctrl + j/k  # 进行上下选择
		" ctrl + x    # 在当前窗口水平分屏打开文件
		" ctrl + v    # 同上, 垂直分屏
		" ctrl + t    # 在tab中打开
		let g:ctrlp_map = '<leader>p'
		let g:ctrlp_cmd = 'CtrlP'
		map <leader>f :CtrlPMRU<CR>
		let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
			\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
			\ }
		let g:ctrlp_working_path_mode=0
		let g:ctrlp_match_window_bottom=1
		let g:ctrlp_max_height=15
		let g:ctrlp_match_window_reversed=0
		let g:ctrlp_mruf_max=500
		let g:ctrlp_follow_symlinks=1
	endif
"}

"vim-devicons {
	if isdirectory(expand("~/.vim/bundle/vim-devicons/")) && has('gui_running')
		" loading the plugin
		let g:webdevicons_enable = 1
		" adding the flags to NERDTree
		let g:webdevicons_enable_nerdtree = 1
		" adding the custom source to unite 
		let g:webdevicons_enable_unite = 1
		" adding the column to vimfiler
		let g:webdevicons_enable_vimfiler = 1
		" adding to vim-airline's tabline
		let g:webdevicons_enable_airline_tabline = 1
		" adding to vim-airline's statusline 
		let g:webdevicons_enable_airline_statusline = 1
		" ctrlp glyphs
		let g:webdevicons_enable_ctrlp = 1
		" whether or not to show the nerdtree brackets around flags 
		let g:webdevicons_conceal_nerdtree_brackets = 1
		" the amount of space to use after the glyph character (default ' ')
		let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
		" Force extra padding in NERDTree so that the filetype icons line up vertically
		let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
		" enable folder/directory glyph flag (disabled by default with 0)
		let g:WebDevIconsUnicodeDecorateFolderNodes = 1
		" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
		let g:DevIconsEnableFolderExtensionPatternMatching = 1
		" enable custom folder/directory glyph exact matching 
		" (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
		let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

	endif
"}

"airline {
	if isdirectory(expand("~/.vim/bundle/vim-airline/"))
		" airline
		let g:airline_theme="luna"
		"let g:airline_theme="badwolf"
		let g:airline_powerline_fonts = 1
		"let g:airline_section_b = '%{strftime("%c")}'
		"let g:airline_section_y = 'BN: %{bufnr("%")}'
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif
		" let g:airline_left_sep = ''
        let g:airline_left_sep = '▶'
		" let g:airline_left_alt_sep = ''
        let g:airline_left_alt_sep = '❯'
		" let g:airline_right_sep = ''
        let g:airline_right_sep = '◀'
		" let g:airline_right_alt_sep = ''
        let g:airline_right_alt_sep = '❮'
        let g:airline_exclude_preview = 1
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
		nnoremap <C-N> :bn<CR>
		nnoremap <C-P> :bp<CR>
	endif
"}

"indentLine {
	if isdirectory(expand("~/.vim/bundle/indentLine/"))
        " " 显示缩进对齐线"
        map <leader>il :IndentLinesToggle<CR>
    endif
"}

"vim-colors-solarized {
	if isdirectory(expand("~/.vim/bundle/vim-colors-solarized/"))
		set t_Co=256                
		let g:solarized_termcolors=256
		let g:solarized_termtrans=1
		let g:solarized_contrast="high"
		let g:solarized_visibility="high"
		" solarized theme
		colorscheme solarized
		set background=dark
		" set background=light
		hi Normal  ctermfg=252 ctermbg=none     " Transparent background
    endif
"}

" minimap{
	if isdirectory(expand("~/.vim/bundle/vim-minimap/"))
		nnoremap <F7> :Minimap<CR>
		nnoremap <C-M> :MinimapClose<CR>
		let g:minimap_show='<leader>ms'
		let g:minimap_update='<leader>mu'
		let g:minimap_close='<leader>mc'
		let g:minimap_toggle='<leader>mt'
		let g:minimap_highlight='Visual'
	endif
" }

"vim-nerdtree-syntax-highlight {
	if isdirectory(expand("~/.vim/bundle/vim-nerdtree-syntax-highlight/"))
		"关闭高亮
		"let g:NERDTreeDisableFileExtensionHighlight = 1
		"let g:NERDTreeDisableExactMatchHighlight = 1
		"let g:NERDTreeDisablePatternMatchHighlight = 1
		"高亮文件名
		let g:NERDTreeFileExtensionHighlightFullName = 1
		let g:NERDTreeExactMatchHighlightFullName = 1
		let g:NERDTreePatternMatchHighlightFullName = 1
		"高亮文件夹
		let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
		let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
		"关闭不必要类型文件高亮
		let g:NERDTreeLimitedSyntax = 1
		
		" If you have vim-devicons you can customize your icons for each file type.
		let g:NERDTreeExtensionHighlightColor = {} "this line is needed to avoid error
		let g:NERDTreeExtensionHighlightColor['css'] = '' "assigning it to an empty string will skip highlight
		"定义颜色
		" you can add these colors to your .vimrc to help customizing
		let s:brown = "905532"
		let s:aqua =  "3AFFDB"
		let s:blue = "689FB6"
		let s:darkBlue = "44788E"
		let s:purple = "834F79"
		let s:lightPurple = "834F79"
		let s:red = "AE403F"
		let s:beige = "F5C06F"
		let s:yellow = "F09F17"
		let s:orange = "D4843E"
		let s:darkOrange = "F16529"
		let s:pink = "CB6F6F"
		let s:salmon = "EE6E73"
		let s:green = "8FAA54"
		let s:lightGreen = "31B53E"
		let s:white = "FFFFFF"
		let s:rspec_red = 'FE405F'
		let s:git_orange = 'F54D27'

		let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

		let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

		let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
	endif
"}
"
" Functions{
	" Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
" }




"窗口跳转 {
	"Ctrl-h 切换到左侧的分割窗口
	"Ctrl-j 切换到下方的分割窗口
	"Ctrl-k 切换到上方的分割窗口
	"Ctrl-l 切换到右侧的分割窗口
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
"}

"python with virtualenv support
"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
" autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType python,xml,yml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" For full syntax highlighting:
let python_highlight_all=1

let g:jedi#auto_initialization = 1

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
"use space to open folds
nnoremap <space> za

"----------Stop python PEP 8 stuff--------------
"
syntax enable "开启代码高亮
syntax on "打开高亮
set mps+=<:>        " 让<>可以使用%跳转also apply matching to < and >

nnoremap <c-a> <c-w>

au FileType qf call AdjustWindowHeight(3, 5)
   function! AdjustWindowHeight(minheight, maxheight)
       let l = 1
       let n_lines = 0
       let w_width = winwidth(0)
       while l <= line('$')
           " number to float for division
           let l_len = strlen(getline(l)) + 0.0
           let line_width = l_len/w_width
           let n_lines += float2nr(ceil(line_width))
           let l += 1
       endw
       exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
    endfunction
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 10

" Use UNIX (\n) line endings.
au BufNewFile *.py set fileformat=unix
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

"C，C++ 按F5编译运行
" map <Leader>b :call CompileRunGcc()<CR>
" func! CompileRunGcc()
"     exec "w"
" 	if &filetype == 'go'
" 		exec "!go run %"
" 	elseif &filetype == 'python'
" 		exec "!intelpy %"
"     elseif &filetype == 'bash'
"         exec "!bash %"
"     endif
" endfunc

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunc

" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:indentLine_noConcealCursor=""
let g:vim_json_syntax_conceal = 1
"去掉JSON自动隐藏引号""
set cole&

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
