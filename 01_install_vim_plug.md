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

* [vim-instant-markdown](https://github.com/instant-markdown/vim-instant-markdown)

    install

    ``` vim
    " vim-instant-markdown
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
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
