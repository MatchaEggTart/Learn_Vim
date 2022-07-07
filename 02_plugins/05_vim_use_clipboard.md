# vim 使用 剪切板

* 参考

  >[Neovim文档](https://neovim.io/doc/user/options.html#'clipboard')\
  >[linux版的vim中如何用快捷键进行与系统剪切板交互的复制粘贴？ - 刚刚的回答 - 知乎](
https://www.zhihu.com/question/21203154/answer/56618821)\
  >[一文搞懂vim复制粘贴](https://liushiming.cn/article/copy-and-paste-in-vim.html)\
  >[跨越终端中多个vim实例访问剪切板内容](https://developer.aliyun.com/article/81672)\
  >感谢！

## 安装 gvim 和 xsel

* 安装 gvim 和 xsel

    ``` shell
    sudo dnf install vim-X11 xsel -y
    ```

## 配置 .bashrc 或 .zshrc

* 打开 .bashrc 或 .zshrc

    ``` shell
    vi ~/.bashrc
    vi ~/.zshrc
    ```

* 添加 gvim 别名

    ``` sh
    alias rm='rm -i'
    alias mv='mv -i'
    alias vim='gvim -v'
    ```

## 在 vimrc 或 init.vim 添加

* 设置 vim 的 *剪切板 与 +剪切板 都与系统剪切板绑定

    ``` vim
    set clipboard^=unnamed,unnamedplus  " *和+ 剪切板都与系统剪切板共享
    " 使用 xsel 操作剪切板
    autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
    ```
