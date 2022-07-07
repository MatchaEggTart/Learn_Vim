# Vim Plug

## The Site shows Vim Plugins

* [VimAwesome](https://vimawesome.com/)

## Intall the vim-plugins manager

* [vim-plug](https://github.com/junegunn/vim-plug)

    intall vim-plug

    ``` shell
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    # create the nvim config folder
    mkdir -p ~/.config/nvim/autoload
    
    # move the plug.vim to nvim config folder
    mv ~/.local/share/nvim/site/autoload/plug.vim ~/.config/nvim/autoload
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
