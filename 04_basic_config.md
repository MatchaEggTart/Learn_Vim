# [vim无插件配置](https://zhuanlan.zhihu.com/p/532430825)

转至 https://zhuanlan.zhihu.com/p/532430825\
谢谢 [棱角破茧](https://www.zhihu.com/people/shan-ye-cao-ren-50)

``` vim
"------------------------配置----------------------------------
if has("gui_macvim")
      let macvim_hig_shift_movement = 1
endif
set modelines=0     " 禁用模式行（安全措施）
set encoding=utf-8           "编码设置
set number                   "显示行号
set smartindent              "智能缩进
set autoindent               "自动对齐
set smarttab
set tabstop=4                "tab缩进
set shiftwidth=4             "设定自动缩进为4个字符
set expandtab                "用space替代tab的输入
set lines=38 columns=150     "设置默认窗口大小
set splitright               "设置左右分割窗口时，新窗口出现在右侧
set splitbelow               "设置水平分割窗口时，新窗口出现在下方

set nobackup                 "不需要备份
set noswapfile               "禁止生成临时文件
set autoread                 "文件自动检测外部更改

set nocompatible             "去除vi一致性
set ambiwidth=double         "解决中文标点显示的问题
set vb t_vb=                 "消除‘嘟嘟’的警报声
set nowrap                   "不自动折行
set mouse=a                  "使用鼠标
set mousehide                "输入时隐藏光标
syntax on                    "语法高亮
filetype on                  "开启文件类型检测

set sm!                      "高亮显示匹配括号
set cursorline             "高亮显示当前行
set hlsearch                 "高亮查找匹配
set showmatch                "显示匹配
set ruler                    "显示标尺，在右下角显示光标位置
set novisualbell             "不要闪烁
set showcmd                  "显示输入的命令

set completeopt=longest,menu             "自动补全配置让Vim补全菜单行为跟IDE一致
set backspace=indent,eol,start           "允许用退格键删除字符
set guifont=DroidSansMono_Nerd_Font:h14  "设置字体和字体大小

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 设置代码折叠---------------------------------
set nofoldenable             " 启动 vim 时关闭折叠代码
set foldmethod=indent        " 设置语法折叠
setlocal foldlevel=99        " 设置折叠层数
nnoremap <space> za          " 用空格键来开关折叠


" 设置状态行-----------------------------------
" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型

set laststatus=2
set statusline=%1*%F%m%r%h%w%=\ %2*\ %Y\ %3*%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\ %4*[%l,%v]\ %5*%p%%\ \|\ %6*%LL\  

" 设置netrw-------------------------------------
let g:netrw_banner = 1       "设置是否显示横幅
let g:netrw_liststyle = 3    "设置目录列表样式：树形
"let g:netrw_browse_split = 4 "在之前的窗口编辑文件
"let g:netrw_altv = 1         "水平分割时，文件浏览器始终显示在左边
"let g:netrw_winsize = 25     "设置文件浏览器窗口宽度为25%
"自动打开文件浏览器
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

nnoremap <C-n> :Lexplore<CR>    " 打开或关闭目录树


" 快捷键映射-------------------------------------
let mapleader=',' "leader映射','
inoremap <leader>w <Esc>:w<CR>  
inoremap jj <Esc>

" 运行对应文件的映射-----------------------------
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!time open % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'javascript'
                exec "!clear"
                exec "!node %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!time open %.html &"
        endif
endfunc

" black格式化Python文件,需要提前用pip安装好black模块-----------

augroup format_py
    autocmd!
    autocmd FileType python nnoremap <F6>
                \ :!time python3 -m black %<CR>
augroup END
```
