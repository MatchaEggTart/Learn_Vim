set encoding=utf-8                  " 编码设置
set number                          " 显示行号
set smartindent                     " 智能缩进
set autoindent                      " 自动对齐
set smarttab            
set tabstop=2                       " tab缩进
set shiftwidth=2                    " 设定自动缩进为4个字符
set expandtab                       " 用space替代tab的输入

" set splitright                    " 设置左右分割窗口时，新窗口出现在右侧
" set splitbelow                    " 设置水平分割窗口时，新窗口出现在下方

set nobackup                        " 不需要备份
set noswapfile                      " 禁止生成临时文件
set autoread                        " 文件自动检测外部更改

set nocompatible                    " 去除vi一致性，让vim更兼容vi
set ambiwidth=double                " 解决中文标点显示的问题
set vb t_vb=                        " 消除‘嘟嘟’的警报声
set nowrap                          " 不自动折行
set mouse=a                         " 使用鼠标
syntax on                           " 语法高亮
filetype on                         " 开启文件类型检测

" set sm!                           " 高亮显示匹配括号
set cursorline                      " 高亮显示当前行
set ruler                           " 显示标尺，在右下角显示光标位置

set clipboard^=unnamed,unnamedplus  " *和+ 剪切板都与系统剪切板共享

" 使用 xsel 操作剪切板
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")



" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" vim-startify
Plug 'mhinz/vim-startify'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" indentLine
Plug 'Yggdroot/indentLine'

" theme
" Plug 'w0ng/vim-hybrid'

" nerdtree
Plug 'preservim/nerdtree'

" ctrlp
Plug 'kien/ctrlp.vim'

" easymotion
Plug 'easymotion/vim-easymotion'

" vim-surround
Plug 'tpope/vim-surround'

" fzf.vim
" fzf#install() makes sure the fzf is the latest
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" far.vim
Plug 'brooth/far.vim'

" vim-go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" python-mode
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" neoformat
Plug 'sbdchd/neoformat'

" ale
Plug 'dense-analysis/ale'

" vim-commentary
Plug 'tpope/vim-commentary'

" vim-fugitive(git)
" Plug 'tpope/vim-fugitive'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

" gv.vim
" Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'

" vim-markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" vim-instant-markdown
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" vim-jsx-pretty
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'

" vim-javascript
Plug 'pangloss/vim-javascript'

" tagalong.vim
Plug 'AndrewRadev/tagalong.vim'

" emmet-vim
Plug 'mattn/emmet-vim'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" set the color scheme after the theme provider has been loaded
" set background=dark
" colorscheme hybrid

" Nerd tree keymap
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" easymotion
" search by 2 char
map ss <Plug>(easymotion-s2)

" vim-instant-markdown
" filetype plugin on
