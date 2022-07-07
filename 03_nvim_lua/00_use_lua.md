# neovim 使用 lua

## 配置文件

* 在 ~/.config/nvim/ 创建 init.lua

``` shell
nvim ～/.config/nvim init.lua
```

## 配置

### 方法1

* 使用 vim.cmd()，输入 vim指令

``` vimrc
# init.vim
set number
```

``` lua
-- init.lua
vim.cmd(set number)
```

### 方法2

* 使用 vim.o.配置 = 值

``` lua
-- init.lua
vim.o.number = true           -- 显示行号
vim.o.tabstop = 2             -- 缩进2 格
vim.o.shiftwidth = 2          -- 自动缩进 2 格
vim.o.expandtab = true        -- tab变成空格
vim.o.smartindent = true      -- 自动对齐
```

## 插件

* vim8.0 使用 vim-plug，neovim 推荐使用 [packer.nvim](https://github.com/wbthomason/packer.nvim)

### 安装 packer.nvim

* 创建 lua 文件夹

``` shell
mkdir -p ~/.config/nvim/lua
```

* 在 ~/.config/nvim/lua/ 创建 plugins.lua

``` lua
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

end)
```

* 安装

``` shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 启动插件

* 在 init.lua 下 加入

``` lua
-- 插件
require('plugins')')
```
