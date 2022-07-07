# Vim Plug

## The Site shows Vim Plugins

* [VimAwesome](https://vimawesome.com/)

## Intall the vim-plugins manager

* [vim-plug](https://github.com/junegunn/vim-plug)

    intall vim-plug

    ``` powershell
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

    configure

    ``` vim
    " Plugins will be downloaded under the specified directory.
    call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

    " List ends here. Plugins become visible to Vim after this call.
    call plug#end()
    ```

* intall plug

    ``` vim
    :source ~/.vimrc
    :PlugInstall
    ```

* delete plug

    ``` vim
    :PlugClean
    ```

## Plugins

* [vim-startify](https://github.com/mhinz/vim-startify)

    install

    ``` vim
    " vim-startify
    Plug 'mhinz/vim-startify'
    ```

* [vim-airline](https://github.com/vim-airline/vim-airline)

    install

    ``` vim
    " vim-airline
    plug 'vim-airline/vim-airline'
    plug 'vim-airline/vim-airline-themes'
    ```

* [indentline](https://github.com/yggdroot/indentline)

    install

    ``` vim
    " indentLine
    Plug 'Yggdroot/indentLine'
    ```

* [vim-hybrid](https://github.com/w0ng/vim-hybrid)

    install

    ``` vim
    " Plugin
    call plug#begin()
    ...
    " vim-hybrid(theme)
    Plug 'w0ng/vim-hybrid'
    ...
    " Initialize plugin system
    call plug#end()

    " set the color scheme after the theme provider has been loaded
    set background=dark
    colorscheme hybrid
    ```

    colorscheme should be after the plug

* [nerdtree](https://github.com/preservim/nerdtree)

    install

    ``` vim
    " nerdtree
    Plug 'preservim/nerdtree'
    ```

    config

    ``` vim
    nnoremap <leader>n :nerdtreefocus<cr>
    nnoremap <c-n> :nerdtree<cr>
    nnoremap <c-t> :nerdtreetoggle<cr>
    nnoremap <c-f> :nerdtreefind<cr>
    ```

    [VIM插件：目录导航与操作插件NERDTree的使用方法](https://blog.csdn.net/weixin_37926734/article/details/124919260)

* [ctrlp](https://github.com/kien/ctrlp.vim)

    install

    ``` vim
    " ctrlp
    Plug 'kien/ctrlp.vim'
    ```

    [ctrl-p] to find the file

* [vim-easymotion](https://github.com/easymotion/vim-easymotion)

    install

    ``` vim
    " easymotion
    Plug 'easymotion/vim-easymotion'
    ```

    config

    ``` vim
    " easymotion
    " search by 2 char
    " map <leader> <plug>(easymotion-prefix)
    map ss <Plug>(easymotion-s2)
    ```

* [vim-surround](https://github.com/tpope/vim-surround)

    install

    ``` vim
    " vim-surround
    Plug 'tpope/vim-surround'
    ```

    usage

    ``` vim
    ds (delete a surrounding)\
    cs (change a surrounding)\
    ys (you add a surrounding)
    ```

* [vim-fzf](https://github.com/junegunn/fzf.vim)

    install

    ``` vim
    " fzf.vim
    " fzf#install() makes sure the fzf is the latest
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    ```

    usage

    ``` vim
    :Files [PATH]  "search files\
    :Ag [PATTERN]  "search string\
    ```

    Ag needs install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to use

    ``` shell
    sudo dnf install the_silver_searcher
    ```

* [far-vim](https://github.com/brooth/far.vim)

    install

    ``` vim
    " far.vim
    Plug 'brooth/far.vim'
    ```

    usage

    ``` vim
    :Far [oldString] [newString] [filePATH]
    :Fardo

* [vim-go](https://github.com/fatih/vim-go)

    install

    ``` vim
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    ```

* [python-mode](https://github.com/python-mode/python-mode)

    install

    ``` vim
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    ```

* [neoformat](https://github.com/sbdchd/neoformat)

    install

    ``` vim
    " neoformat
    Plug 'sbdchd/neoformat'
    ```

* [ale](https://github.com/dense-analysis/ale)

    install

    ``` vim
    " ale
    Plug 'dense-analysis/ale'
    ```

* [vim-commentary](https://github.com/tpope/vim-commentary)

    install

    ``` vim
    " vim-commentary
    Plug 'tpope/vim-commentary'
    ```

    usage

    ``` vim
    gc " commentary
    gcc " 注释当前行
    ```

* [vim-fugitive](https://github.com/tpope/vim-fugitive)

    install

    ``` vim
    " vim-fugitive(git)
    Plug 'tpope/vim-fugitive'
    ```

* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)

    install

    ``` vim
    " vim-gitgutter
    Plug 'airblade/vim-gitgutter'
    ```

* [gv.vim](https://github.com/junegunn/gv.vim)

    install

    ``` vim
    " gv.vim
    " Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    ```

* [vim-markdown](https://github.com/preservim/vim-markdown)

    install

    ``` vim
    " vim-markdown
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    ```

    usage
    > zr: reduces fold level throughout the buffer\
    > zR: opens all folds\
    > zm: increases fold level throughout the buffer\
    > zM: folds everything all the way\
    > za: open a fold your cursor is on\
    > zA: open a fold your cursor is on recursively\
    > zc: close a fold your cursor is on\
    > zC: close a fold your cursor is on recursively

    usage 中文
    > zr: 打开下一级折叠\
    > zR: 打开所有折叠\
    > zm: 关闭下一级折叠\
    > zM: 关闭所有折叠\
    > za: 打开光标的下一级折叠\
    > zA: 打开光标下的所有折叠\
    > zc: 关闭光标的下一级折叠\
    > zC: 关闭光标下的所有折叠

* [vim-instant-markdown](https://github.com/instant-markdown/vim-instant-markdown)

    install

    ``` shell
    sudo dnf install nodejs -y
    sudo npm install -g yarn -y
    node -v
    yarn -v
    sudo npm -g install instant-markdown-d
    ```

    ``` vim
    " vim-instant-markdown
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    ```

    configure

    ``` vim
    " vim-instant-markdown
    filetype plugin on
    "Uncomment to override defaults:
    "let g:instant_markdown_slow = 1
    "let g:instant_markdown_autostart = 0
    "let g:instant_markdown_open_to_the_world = 1
    "let g:instant_markdown_allow_unsafe_content = 1
    "let g:instant_markdown_allow_external_content = 0
    "let g:instant_markdown_mathjax = 1
    "let g:instant_markdown_mermaid = 1
    "let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
    "let g:instant_markdown_autoscroll = 0
    "let g:instant_markdown_port = 8888
    "let g:instant_markdown_python = 1
    ```

    usage

    ``` vim
    :InstantMarkdownPreview
    :InstantMarkdownStop
    ```

* [auto-pairs](https://github.com/jiangmiao/auto-pairs/)

    install

    ``` vim
    " auto-pairs
    Plug 'jiangmiao/auto-pairs'
    ```

* [vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty)

    install

    ``` vim
    " vim-jsx-pretty
    Plug 'yuezk/vim-js'
    Plug 'MaxMEllon/vim-jsx-pretty'
    ```

* [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)

    install

    ``` vim
    " vim-javascript
    Plug 'pangloss/vim-javascript'
    ```

* [AndrewRadev/tagalong.vim](https://github.com/AndrewRadev/tagalong.vim)

    install

    ``` vim
    " tagalong.vim
    Plug 'AndrewRadev/tagalong.vim'
    ```

* [mattn/emmet-vim](https://github.com/mattn/emmet-vim)

    install

    ``` vim
    " emmet-vim
    Plug 'mattn/emmet-vim'
    ```

    usage

    ``` html
    html:5 <CTRL>+y <,>
    ```
