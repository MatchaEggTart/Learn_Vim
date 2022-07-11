# NeoVim 学习笔记

## 前言

* 这是 [Neovim 配置实战：从0到1打造自己的IDE](https://juejin.cn/book/7051157342770954277) 的学习笔记，很感谢 [陈新_nshen](https://www.zhihu.com/people/nshen121)，可以私信他获得购买课程优惠，囧

* 因为是个人笔记，就不用担心被人说打广告了，囧

## 安装

* 安装 vim

  * 指令

    ``` shell
    sudo dnf install vim vim-X11 xsel -y
    ```

  * vim-X11 为了安装 GVim，让 GVim 代替 vim 获得与系统共享剪切板。 -clipboard 查询 `vim --version | grep clipboard`

  * xsel 管理系统剪切板工具

* 安装 NeoVim

  * 指令

    ``` shell
    sudo dnf install neovim -y
    ```

  * 修改 bash，让 nvim 代替 vim，打开 ~/.bashrc 或者 ~/.zshrc， 在末尾添加

    ``` shell
    alias vim='nvim'
    alias vi='nvim'
    alias v='nvim'
    ```

## 基础配置

* nvim 配置文件位置

  * nvim 配置文件位置在 ~/.config/nvim

* 首先创建配置文件

  ``` shell
  mkdir -p ~/.config/nvim/lua
  ```

* 创建 初始化文件 init.lua， 在 ~/.config/nvim/

  * 在 init.lua 写入

    ``` lua
    -- 基础配置
    require('basic')
    ```

  * require 即 加载一个模块，模块通常 位于 runtimepath 中 的 lua/ 目录， 即 ~/.config/nvim/lua/ 下

* 创建 basic.lua

  * 在 .config/nvim/lua/ 创建 basic.lua

    ``` lua
    -- utf8
    vim.g.encoding = "UTF-8"
    vim.o.fileencoding = 'utf-8'

    -- jkhl 移动时光标周围保留8行
    vim.o.scrolloff = 8
    vim.o.sidescrolloff = 8

    -- 使用相对行号
    vim.wo.number = true
    -- vim.wo.relativenumber = true

    -- 高亮所在行
    vim.wo.cursorline = true

    -- 语法高亮
    -- vim.o.syntax = true

    -- 开启文件类型检测
    -- vim.o.filetype = true

    -- 显示左侧图标指示列
    vim.wo.signcolumn = "yes"

    -- 右侧参考线，超过表示代码太长了，考虑换行
    -- vim.wo.colorcolumn = "80"

    -- 缩进2个空格等于一个Tab
    vim.o.tabstop = 2
    vim.bo.tabstop = 2
    vim.o.softtabstop = 2
    vim.o.shiftround = true

    -- >> << 时移动长度
    vim.o.shiftwidth = 2
    vim.bo.shiftwidth = 2

    -- 空格替代tab
    vim.o.expandtab = true
    vim.bo.expandtab = true

    -- 新行对齐当前行
    vim.o.autoindent = true
    vim.bo.autoindent = true
    vim.o.smartindent = true

    -- 搜索大小写不敏感，除非包含大写
    vim.o.ignorecase = true
    vim.o.smartcase = true

    -- 搜索不要高亮
    vim.o.hlsearch = false

    -- 边输入边搜索
    vim.o.incsearch = true

    -- 命令行高为2，提供足够的显示空间
    vim.o.cmdheight = 2

    -- 当文件被外部程序修改时，自动加载
    vim.o.autoread = true
    vim.bo.autoread = true

    -- 禁止折行
    vim.wo.wrap = false

    -- 光标在行首尾时<Left><Right>可以跳到下一行
    vim.o.whichwrap = '<,>,[,]'

    -- 允许隐藏被修改过的buffer
    vim.o.hidden = true

    -- 鼠标支持
    vim.o.mouse = "a"

    -- 禁止创建备份文件
    vim.o.backup = false
    vim.o.writebackup = false
    vim.o.swapfile = false

    -- smaller updatetime
    vim.o.updatetime = 300

    -- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
    vim.o.timeoutlen = 500

    -- split window 从下边和右边出现
    vim.o.splitbelow = true
    vim.o.splitright = true

    -- 自动补全不自动选中
    vim.g.completeopt = "menu,menuone,noselect,noinsert"

    -- 样式
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.opt.termguicolors = true

    -- 不可见字符的显示，这里只把空格显示为一个点
    vim.o.list = true
    -- vim.o.listchars = "space:·"

    -- 补全增强
    vim.o.wildmenu = true

    -- Dont' pass messages to |ins-completin menu|
    vim.o.shortmess = vim.o.shortmess .. 'c'

    -- 补全最多显示10行
    vim.o.pumheight = 10

    -- 永远显示 tabline
    vim.o.showtabline = 2

    -- 使用增强状态栏插件后不再需要 vim 的模式提示
    vim.o.showmode = false

    -- * 和 + 剪切板都与系统剪切板共享
    -- vim.o.clipboard^="unnamed,unnamedplus"
    vim.o.clipboard="unnamed,unnamedplus" 
    ```
  
  * vim.o

    * vim.o 实际上 运行了 vimrc 以前的脚本语言，当然可以使用 `vim.cmd()`也是一样效果
  
  * vim.选项
    * vim.g.{name}: 全局变量
    * vim.b.{name}: 缓冲区变量
    * vim.w.{name}: 窗口变量
    * vim.bo.{option}: buffer-local 选项
    * vim.wo.{option}: window-local 选项

## 快捷键

* 在 ~/.config/nvim/lua 下创建 keybindings.lua 键绑定文件
* 在 Neovim 设置快捷键

  * `vim.api.nvim_set_keymap()` 全局快捷键
  * `vim.api.nvim_buf_set_keymap()` Buffer 快捷键

* 设置快捷键格式

  ``` lua
  vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')
  ```

* 5种模式

  * n: Normal 模式
  * i: Insert 模式
  * v: Visual 模式
  * t: Terminal 模式
  * c: Command 模式

* Leader Key

  * 查看当前 Leader Key

    ``` vim
    :let mapleader 
    ```

  * 设置 Leader Key
  
    ``` lua
    -- Leader Key 为空，设置 Leader Key
    vim.g.mapleader = ","
    vim.g.maplocalleader = ","
    ```

* 设置变量
  
  * 设置 vim.api.nvim_set_keymap 的变量 跟 options 变量，让看起来更加舒服，而且不用打这么多字

    ``` lua
    -- 本地变量
    local map = vim.api.nvim_set_keymap
    local opt = { noremap = true, silent = true }
    ```

* 窗口管理快捷键映射

  * 代码

    ``` lua
    ------------------------------------------------------------------
    -- windows 分屏快捷键
    ------------------------------------------------------------------
    -- 取消 s 默认功能
    -- map("n", "s", "", opt)
    -- map("n", "sv", ":vsp<CR>", opt)
    -- map("n", "sh", ":sp<CR>", opt)
    -- 关闭当前
    -- map("n", "sc", "<C-w>c", opt)
    -- 关闭其他
    -- map("n", "so", "<C-w>o", opt) -- close others
    -- alt + hjkl  窗口之间跳转
    map("n", "<C-h>", "<C-w>h", opt)
    map("n", "<C-j>", "<C-w>j", opt)
    map("n", "<C-k>", "<C-w>k", opt)
    map("n", "<C-l>", "<C-w>l", opt)
    -- <leader> + hjkl 窗口之间跳转
    map("n", "<leader>h", "<C-w>h", opt)
    map("n", "<leader>j", "<C-w>j", opt)
    map("n", "<leader>k", "<C-w>k", opt)
    map("n", "<leader>l", "<C-w>l", opt)
    -- 左右比例控制
    -- map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
    -- map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
    -- map("n", "s,", ":vertical resize -10<CR>", opt)
    -- map("n", "s.", ":vertical resize +10<CR>", opt)
    -- 上下比例
    -- map("n", "sj", ":resize +10<CR>", opt)
    -- map("n", "sk", ":resize -10<CR>", opt)
    -- map("n", "<C-Down>", ":resize +2<CR>", opt)
    -- map("n", "<C-Up>", ":resize -2<CR>", opt)
    -- 相等比例
    -- map("n", "s=", "<C-w>=", opt)

    -- Terminal相关
    map("n", "st", ":sp | terminal<CR>", opt)
    map("n", "stv", ":vsp | terminal<CR>", opt)
    -- Esc 回 Normal 模式
    map("t", "<Esc>", "<C-\\><C-n>", opt)
    map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
    map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
    map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
    map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
    map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
    map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
    map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
    map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)
    ```

* Visule 模式下快捷键

  * 代码

    ``` lua
    -- visual模式下缩进代码
    -- map("v", "<", "<gv", opt)
    -- map("v", ">", ">gv", opt)
    -- 上下移动选中文本
    -- map("v", "J", ":move '>+1<CR>gv-gv", opt)
    -- map("v", "K", ":move '<-2<CR>gv-gv", opt)

    -- 在visual mode 里粘贴不要复制
    -- map("v", "p", '"_dP', opt)
    ```

* 浏览代码快捷键

  * 代码

    ``` lua
    -- 上下滚动浏览
    -- map("n", "<C-j>", "5j", opt)
    -- map("n", "<C-k>", "5k", opt)
    -- map("v", "<C-j>", "5j", opt)
    -- map("v", "<C-k>", "5k", opt)
    -- ctrl u / ctrl + d  只移动9行，默认移动半屏
    -- map("n", "<C-u>", "10k", opt)
    -- map("n", "<C-d>", "10j", opt)
    ```

* 退出快捷键

  * 代码

    ``` lua
    -- 退出
    -- map("n", "qq", ":q!<CR>", opt)
    -- map("n", "<leader>q", ":qa!<CR>", opt)

    -- insert 模式下，跳到行首行尾
    -- map("i", "<C-h>", "<ESC>I", opt)
    -- map("i", "<C-l>", "<ESC>A", opt)
    ```

* 插入 keybinding 模块

  * 在 init.lua 加入

    ``` lua
    -- 快捷键映射
    require("keybindings")
    ```

## 插件管理器

* 安装 [packer.nvim](https://github.com/wbthomason/packer.nvim)

  * 指令

    ``` shell
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

* 创建 插件配置文件

  * 在 ~/.config/nvim/lua/ 创建 plugins.lua 文件

    ``` lua
    local packer = require("packer")

    packer.startup({
      function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'

        -- 你的插件列表...

      end,

      config = {
        -- 并发数限制
        max_jobs = 16,

        -- 自定义源
        git = {
          default_url_format = "https://hub.fastgit.xyz/%s",
          -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
          -- default_url_format = "https://gitcode.net/mirrors/%s",
          -- default_url_format = "https://gitclone.com/github.com/%s",
        },

        -- 以浮动窗口打开安装列表
        display = {
          open_fn = function()
            return require("packer.util").float({ border = "single" })
          end,
        },
      },

      -- 每次保存 plugins.lua 自动安装插件
      pcall(
        vim.cmd,
        [[
          augroup packer_user_config
          autocmd!
          autocmd BufWritePost plugins.lua source <afile> | PackerSync
          augroup end
        ]]
      )
    })
    ```

  * pcall 是 lua 函数，检查参数是否成功运行，返回 true/false
  * BufWritePost 事件，如果 plugins.lua 被修改 则 自动使用 PackerSync 命令

* 插入 plugins 模块

  * 在 init.lua 加入

    ``` lua
    -- Packer 插件管理
    require("plugins")
    ```

* Packer 命令

  * :PackerCompile： 每次改变插件配置时，必须运行此命令或 PackerSync, 重新生成编译的加载文件
  * :PackerClean ： 清除所有不用的插件
  * :PackerInstall ： 清除，然后安装缺失的插件
  * :PackerUpdate ： 清除，然后更新并安装插件
  * :PackerSync : 执行 PackerUp date 后，再执行 PackerCompile
  * :PackerLoad : 立刻加载 opt  插件

## 主题

* 关于主题命令
  
  * 查看当前主题

    ``` vim
    :colorscheme
    ```

  * 修改主题命令

    ``` vim
    :colorscheme TAB键
    ```

* 主题配置文件

  * 在 ~/.config/nvim/lua/ 创建 colorscheme.lua 文件

    ``` lua
    -- 选择已安装主题
    local colorscheme = "tokyonight"
    -- 检查主题是否正常运行
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

    if not status_ok then
      vim.notify("colorscheme " .. colorscheme .. " can not be found!")
      return
    end
    ```

* 使用 packer 下载 主题

  * 在 plugins.lua 添加

    ``` lua
    packer.startup({
      function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'

        -- 你的插件列表...

        --------------------- colorschemes --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        -------------------------------------------------------
      end,
      -- 略过 --
    })
    ```

* 调用 colorscheme 模块

  * 在 init.lua

    ``` lua
    -- 主题设置 
    require("colorscheme")
    ```

## 侧边栏

* [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

  * 在 plugins.lua 添加

    ``` lua
    packer.startup({
      function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'

        -- 略过 --
        --------------------- tools ---------------------------
        -- nvim-tree
        use ({
          'kyazdani42/nvim-tree.lua',
          requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
          },
          tag = 'nightly' -- optional, updated every week. (see issue #1193)
        })
        -------------------------------------------------------
      end,
    -- 略过 --
    })
    ```

* 配置 nvim-tree

  * 在 lua 创建 plugin-config 文件夹，在 plugin-config 文件夹下 创建 nvim-tree.lua

    ``` lua
    local status, nvim_tree = pcall(require, "nvim-tree")
    if not status then
      vim.notify("can not find nvim-tree!")
      return
    end

    -- 列表操作快捷键
    local list_keys = require('keybindings').nvimTreeList
    nvim_tree.setup({
      -- 显示 git 状态图标
      git = {
        enable = true,
      },
      -- project plugin 需要这样设置
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      -- 隐藏 .文件 和 node_modules 文件夹
      filters = {
        dotfiles = true,
        custom = { 'node_modules' },
      },
      view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
          custom_only = false,
          list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
      },
      actions = {
        open_file = {
          -- 首次打开大小适配
          resize_window = true,
          -- 打开文件时关闭
          -- quit_on_open = true,
        },
      },
      -- wsl install -g wsl-open
      -- https://github.com/4U6U57/wsl-open/
      -- system_open = {
      --   cmd = 'wsl-open', -- mac 直接设置为 open
      -- },
    })
    -- 自动关闭
    vim.cmd([[
      autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    ]])
    ```

* 配置 nvim-tree 快捷键

  * 打开 keybindings.lua， 添加

    ``` lua
    --------------------------------------------------------------------
    -- 插件快捷键
    local pluginKeys = {}

    ------------------------------------------------------------------
    -- nvim-tree
    ------------------------------------------------------------------
    -- map("n", "<C-t>", ":NvimTreeToggle<CR>", opt)
    map("n", "<leader>t", ":NvimTreeToggle<CR>", opt)
    -- 列表快捷键
    pluginKeys.nvimTreeList = { -- 打开文件或文件夹
      { key = { "o", "<2-LeftMouse>" }, action = "edit" },
      -- 下面那条设置系统打开
      -- 既记事本打开文档，文件管理器打开文件夹，剧毒
      -- { key = "s", action = "system_open" },
      -- v分屏打开文件
      -- { key = "v", action = "vsplit" },
      -- h分屏打开文件
      -- { key = "h", action = "split" },
      -- Ignore (node_modules)
      { key = "i", action = "toggle_ignored" },
      -- Hide (dotfiles)
      { key = ".", action = "toggle_dotfiles" },
      -- 文件操作
      { key = "r", action = "refresh" },
      { key = "a", action = "create" },
      { key = "d", action = "remove" },
      { key = "m", action = "rename" },
      { key = "x", action = "cut" },
      { key = "c", action = "copy" },
      { key = "p", action = "paste" },
      { key = "y", action = "copy_name" },
      { key = "Y", action = "copy_path" },
      { key = "gy", action = "copy_absolute_path" },
      { key = "I", action = "toggle_file_info" },
      { key = "n", action = "tabnew" },
      -- 进入下一级
      { key = { "]" }, action = "cd" },
      -- 进入上一级
      { key = { "[" }, action = "dir_up" },
    }
    ```

* 调用 nvim-tree 模块

  * 在 init.el

    ``` lua
    -------------------- 插件配置 --------------------
    -- nvim-tree
    require("plugin-config.nvim-tree")
    ```

## 标签页

* [bufferline](https://github.com/akinsho/bufferline.nvim)

  * 在 plugins.lua 添加

    ``` lua
    -- bufferline
    use ({ 
      "akinsho/bufferline.nvim", 
      tag = "v2.*", 
      requires = { 
        "kyazdani42/nvim-web-devicons", 
        "moll/vim-bbye" 
      }
    })
    ```
  
  * vim-bbyt 依赖，避免打乱布局

* 创建 bufferline 配置文件

  * ~/.config/nvim/lua/plugin-config/bufferline.lua

    ``` lua
    local status, bufferline = pcall(require, "bufferline")

    if not status then
        vim.notify("can not find bufferline!")
      return
    end

    -- bufferline 配置
    -- https://github.com/akinsho/bufferline.nvim#configuration
    bufferline.setup({
      options = {
        -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- 侧边栏配置
        -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        -- 使用 nvim 内置 LSP  后续课程会配置
        diagnostics = "nvim_lsp",
        -- 可选，显示 LSP 报错图标
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " " or (e == "warning" and " " or "")
            s = s .. n .. sym
          end
          return s
        end,
      },
    })
    ```

* 设置快捷键

  * keybindings.lua

    ``` lua
    ------------------------------------------------------------------
    -- bufferline
    ------------------------------------------------------------------
    -- 左右Tab切换
    map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
    map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
    -- "moll/vim-bbye" 关闭当前 buffer
    map("n", "<leader>bc", ":Bdelete!<CR>", opt)
    -- map("n", "<C-w>", ":Bdelete!<CR>", opt)
    -- 关闭左/右侧标签页
    map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
    map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
    -- 关闭其他标签页
    map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
    -- 关闭选中标签页
    map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)
    ```

* 调用 bufferline 模块

* init.lua

``` lua
require("plugin-config.bufferline")
```

## 底部信息显示栏

* [lualine](https://github.com/nvim-lualine/lualine.nvim)

  * plugins.lua

    ``` lua
    -- lualine (新增)
    use ({
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
    })
    use ("arkav/lualine-lsp-progress")
    ```

* 配置文件

  * lua/plugin-config/lualine.lua

    ``` lua
    local status, lualine = pcall(require, "lualine")

    if not status then
        vim.notify("can not find lualine!")
      return
    end

    lualine.setup({
      options = {
        theme = "tokyonight",
        component_separators = { left = "|", right = "|" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = { left = " ", right = "" },
      },
      extensions = { "nvim-tree", "toggleterm" },
      sections = {
        lualine_c = {
          "filename",
          {
            "lsp_progress",
            spinner_symbols = { " ", " ", " ", " ", " ", " " },
          },
        },
        lualine_x = {
          "filesize",
          {
            "fileformat",
            -- symbols = {
            --   unix = '', -- e712
            --   dos = '', -- e70f
            --   mac = '', -- e711
            -- },
            symbols = {
              unix = "LF",
              dos = "CRLF",
              mac = "CR",
            },
          },
          "encoding",
          "filetype",
        },
      },
    })
    ```

* 调用 lueline 模块

  * init.el

    ``` lua
    -- lueline
    require("plugin-config.lualine")
    ```

## 模糊搜索快速打开文件

* [telescope](https://github.com/nvim-telescope/telescope.nvim)

  * plugins.lua

    ``` lua
    -- telescope
    -- 快速搜索
    use ({
      'nvim-telescope/telescope.nvim',
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    ```

* 安装依赖 [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)，[sharkdp/fd](https://github.com/sharkdp/fd)

  * ripgrep

    ``` shell
    sudo dnf install ripgrep -y
    ```

  * fd-find

    ``` sh
    # 方法1
    sudo dnf install fd-find -y

    # 方法2
    sudo npm install -g fd-find
    ```

* 配置 telescope

  * 检测 依赖

    ``` vim
    :checkhealth telescope
    ```
  
  * telescope 命令

    ``` vim
    " 打开搜索文件窗口
    :Telescope find_files

    " 全局查找
    :Telescope live_grep
    ```

  * lua/plugin-config/telescope.lua

    ``` lua
    local status, telescope = pcall(require, "telescope")

    if not status then
      vim.notify("can not find telescope!")
      return
    end

    telescope.setup({
      defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = "insert",
        -- 窗口内快捷键
        mappings = require("keybindings").telescopeList,
      },
      pickers = {
        -- 内置 pickers 配置
        find_files = {
          -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
          -- theme = "dropdown", 
        }
      },
      extensions = {
        -- 扩展插件配置
      },
    })
    ```

* 自定义快捷键

  * keybindings.lua

    ``` lua
    ------------------------------------------------------------------
    -- Telescope
    ------------------------------------------------------------------
    map("n", "<C-p>", ":Telescope find_files<CR>", opt)
    map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
    -- Telescope 列表中 插入模式快捷键
    pluginKeys.telescopeList = {
      i = {
        -- 上下移动
        -- ["<C-j>"] = "move_selection_next",
        -- ["<C-k>"] = "move_selection_previous",
        -- ["<C-n>"] = "move_selection_next",
        -- ["<C-p>"] = "move_selection_previous",
        -- 历史记录
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        -- 关闭窗口
        -- ["<esc>"] = actions.close,
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        -- ["<C-u>"] = "preview_scrolling_up",
        -- ["<C-d>"] = "preview_scrolling_down",
      },
    }
    ```

* 调用 telescope

  * init.lua

    ``` lua
    -- telescope
    require("plugin-config.telescope")
    ```

* Telescope 扩展安装
  
  * [telescope-env.nvim](https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions)

  * lua/plugins.lua

    ``` lua
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"
    ```

  * 打开 lua/plugin-config/telescope.lua

    ``` lua
    extensions = {
      -- 扩展插件配置
      -- telescope extensions
      pcall(telescope.load_extension, "env")
    },
    ```

  * 重启后，输入

    ``` vim
    " 打开环境变量
    :Telescope env
    ```

## 启动页

* [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)

  * lua/plugins.lua

    ``` lua
    -- dashboard-nvim
    -- 启动页
    use ("glepnir/dashboard-nvim")
    ```

* 配置文件

  * lua/plugin-config/dashboard.lua

    ``` lua
    local status, db = pcall(require, "dashboard")

    if not status then
      vim.notify("can not find dashboard!")
      return
    end

    db.preview_file_height = 12
    db.preview_file_width = 80
    db.hide_tabline = false
    db.custom_header = {
      '                                                       ',
      '                                                       ',
      '                                                       ',
      '                                                       ',
      '                                                       ',
      '          ▀████▀▄▄              ▄█ ',
      '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
      '    ▄        █          ▀▀▀▀▄  ▄▀  ',
      '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
      '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
      '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
      '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
      '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
      '   █   █  █      ▄▄           ▄▀   ',
      '                                                       ', 
      '                                                       ',
      '                                                       ',
      '                                                       ',
      '                                                       ',
    }
    db.custom_center = {
      {
        icon = "  ",
        desc = "Projects                                       ",
        action = "Telescope projects",
      }, 
      {
        icon = "  ",
        desc = "Recently files                                 ",
        action = "Telescope oldfiles",
      },  
      {
        icon = "  ",
        desc = "Edit keybindings                               ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
      },
      {
        icon = "  ",
        desc = "Edit Projects                                  ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
      },
      {
        icon = "  ",
        desc = "Find file                                      ",
        action = "Telescope find_files",
      },
      -- {
      --   icon = '  ',
      --   desc = 'Recently laset session                  ',
      --   shortcut = 'SPC s l',
      --   action = 'SessionLoad'
      -- },  
      -- {
      --   icon = '  ',
      --   desc = 'Recently opened files                   ',
      --   action = 'DashboardFindHistory',
      --   shortcut = 'SPC f h'
      -- }, {
      --   icon = '  ',
      --   desc = 'Find  File                              ',
      --   action = 'Telescope find_files find_command=rg,--hidden,--files',
      --   shortcut = 'SPC f f'
      -- }, {
      --   icon = '  ',
      --   desc = 'File Browser                            ',
      --   action = 'Telescope file_browser',
      --   shortcut = 'SPC f b'
      -- }, {
      --   icon = '  ',
      --   desc = 'Find  word                              ',
      --   aciton = 'DashboardFindWord',
      --   shortcut = 'SPC f w'
      -- }
    }
    ```

* [project.nvim](https://github.com/ahmedkhalf/project.nvim)

  * plugins.lua

    ``` lua
    -- project
    use("ahmedkhalf/project.nvim")
    ```

* 配置 project.nvim

  * 查看 nvim-tree.lua 是否有这段代码

    ``` lua
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    ```

  * 这样 nvim-tree 就可以支持切换目录

  * 创建 lua/plugin-config/project.lua

    ``` lua
    local status, project = pcall(require, "project_nvim")

    if not status then
        vim.notify("can not find project_nvim")
      return
    end

    -- nvim-tree 支持
    vim.g.nvim_tree_respect_buf_cwd = 1

    project.setup({
      detection_methods = { "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
    })

    local status, telescope = pcall(require, "telescope")
    if not status then
      vim.notify("没有找到 telescope")
      return
    end
    pcall(telescope.load_extension, "projects")
    ```
  
  * detection_methods 将 patterns 变量作为检测参数，如果文件夹里存在 patterns 对象的任意值，都视作 项目文件，并把数据保存在配置文件

* 导入 dashboard 和 project

  * init.lua

    ``` lua
    require("plugin-config.project")
    require("plugin-config.dashboard")
    ```

* 查看 project 配置文件

  * 指令

    ``` lua
    :lua print(require("project_nvim.utils.path").historyfile)
    ```

## 语法高亮

* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

  * 安装依赖

    ``` sh
    sudo dnf install gcc-c++ -y
    sudo dnf install nodejs -y
    ```

  * 编译需要使用

  * plugins.lua

    ``` lua
    -- treesitter （新增）
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    ```
  
* 安装 Language parser

  * 查看 语法库 状态 指令

    ``` vim
    :TSInstallInfo
    :TSModuleInfo
    ```

  * 配置 nvim-treesitter，在 lua/plugin-config/nvim-treesitter.lua

    ``` lua
    local status, treesitter = pcall(require, "nvim-treesitter.configs")

    if not status then
        vim.notify("can not find nvim-treesitter!")
        return
    end

    treesitter.setup({
      -- 安装 language parser
      -- :TSInstallInfo 命令查看支持的语言
      ensure_installed = {
        "c",
        "java",
        "python",
        "go",
        "rust",
        "javascript",
        "typescript",
        "html",
        "css",
        "lua",
        "json",
        "tsx",
        "vim",
      },

      -- 启用代码高亮模块
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
    ```

* 调用 nvim-treesitter

  * init.lua

    ``` lua
    -- nvim-treesitter
    require("plugin-config.nvim-treesitter")
    ```

* 启动增量选择模块（我不使用）

  * lua/plugin-config/nvim-treesitter.lua

    ``` lua
    -- 启用代码高亮模块
    highlight = {
      -- 省略
    },
    -- 启用增量选择模块
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    },
    ```

* 代码缩进模块

  * lua/plugin-config/nvim-treesitter.lua

    ``` lua
    -- 启用代码高亮模块
    highlight = {
      -- 省略
    },

    -- 启用代码缩进模块 (=)
    indent = {
      enable = true,
    },
    ```

  * 如何使用

    * gg=G

* 代码折叠模块

  * lua/plugin-config/nvim-treesitter.lua

    ``` lua
    treesitter.setup({
      -- 省略
    })

    -- 开启 Folding 模块
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99
    ```

* 折叠快捷键

  * lua/keybindings.lua

    ``` lua
    -- treesitter 折叠
    map("n", "zc", ":foldclose<CR>", opt)
    map("n", "zo", ":foldopen<CR>", opt)
    ```

## LSP

* [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)让大家不用再使用 node 来安装每个语言的 服务器，它帮你安装
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)，nvim-lsp-installer的依赖，安装顺序必须在nvim-lsp-installer下面

* 安装

  * plugins.lua

    ``` lua
    --------------------- LSP -----------------------------
    -------------------------------------------------------
    -- LSP install tool
    use ({ "williamboman/nvim-lsp-installer" })
    -- Lspconfig
    use ({ "neovim/nvim-lspconfig" })
    ```

* 安装 LSP Servers

  * 命令

    ``` vim
    :LspInstallInfo
    ```

  * 操作
    * i: 安装
    * j: 上
    * k: 下
    * X: 卸载
    * u: 更新当前 server
    * U: 更新所有 servers
    * c: 检查当前 server 版本
    * C: 检查所有 servers 版本
    * ?: 帮助
    * ESC: 退出

* 配置 LSP Server

  * 在 lua/plugin-config 创建 lsp 文件夹，在 lsp文件夹创建 setup.lua 文件

    ``` lua
    local status, lsp_installer = pcall(require, "nvim-lsp-installer")

    if not status then
      vim.notify("can not find nvim-lsp-installer!")
      return
    end
    -- 安装列表
    -- { key: 语言 value: 配置文件 }
    -- key 必须为下列网址列出的名称
    -- https://github.com/williamboman/nvim-lsp-installer#available-lsps
    local servers = {
      -- sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
    }

    -- 自动安装 Language Servers
    for name, _ in pairs(servers) do
      local server_is_found, server = lsp_installer.get_server(name)
      if server_is_found then
        if not server:is_installed() then
          print("Installing " .. name)
          server:install()
        end
      end
    end

    lsp_installer.on_server_ready(function(server)
      local config = servers[server.name]
      if config == nil then
        return
      end
      if config.on_setup then
        config.on_setup(server)
      else
        server:setup({})
      end
    end)
    ```

* 定义快捷键

  * lua/keybindings.lua，创建 LSP 专用（所有语言）快捷键

    ``` lua
    -- LSP
    require("plugin-config.lsp.setup")
    ```

## 代码补全

* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

  * plugins.lua

    ``` lua
    --------------------- cmp -----------------------------
    -- nvim-cmp
    -- 补全源
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 补全工具
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
                                                            
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -------------------------------------------------------
    ```

* 配置文件

  * 在 plugin-config 创建一个 cmp 文件夹，cmp 文件夹 加入 init.lua 文件

    ``` lua
    local status, cmp = pcall(require, "cmp")

    if not status then
      vim.notify("can not find cmp!")
      return
    end

    cmp.setup({
      -- 指定 snippet 引擎
      snippet = {
        expand = function(args)
          -- For `vsnip` users.
          vim.fn["vsnip#anonymous"](args.body)

          -- For `luasnip` users.
          -- require('luasnip').lsp_expand(args.body)

          -- For `ultisnips` users.
          -- vim.fn["UltiSnips#Anon"](args.body)

          -- For `snippy` users.
          -- require'snippy'.expand_snippet(args.body)
        end,
      },
      -- 补全源
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },

        -- For luasnip users.
        -- { name = 'luasnip' },

        --For ultisnips users.
        -- { name = 'ultisnips' },

        -- -- For snippy users.
        -- { name = 'snippy' },
      }, { { name = "buffer" }, { name = "path" } }),

      -- 快捷键设置
      mapping = require("keybindings").cmp(cmp),
    })

    -- / 查找模式使用 buffer 源
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- : 命令行模式中使用 path 和 cmdline 源.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
    ```

* 快捷键

  * keybindings.lua

    ``` lua
    ------------------------------------------------------------------
    -- cmp 
    ------------------------------------------------------------------
    -- nvim-cmp 自动补全
    pluginKeys.cmp = function(cmp)
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      return {
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        -- snippets 跳转
        ["<C-l>"] = cmp.mapping(function(_)
          if vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),

        -- super Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
        -- end of super Tab
      }
    end
    ```

* 引入 cmd 模块

  * init.lua

    ``` lua
    -- cmp
    require("plugin-config.cmp")
    ```

## 提示错误

* 使用 lsp

  * 新建文件 lua/lsp/ui.lua

    ``` lua
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      -- 在输入模式下也更新提示，设置为 true 也许会影响性能
      update_in_insert = true,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    ```

* 引入 ui 模块

  * init.lua

    ``` lua
    -- ui for error
    require("plugin-config.lsp.ui")
    ```

* 设置快捷键

  * keybindings.lua

    ``` lua
    -- diagnostic
    -- 没啥用，会被 Lspsaga 替换
    mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    ```

## 自动补全样式修改

* [lspkind-nvim](https://github.com/onsails/lspkind.nvim)
  
  * 小图标提示

  * plugins.lua

``` lua
use("onsails/lspkind-nvim")
```

* 配置

  * lua/lsp/ui.lua 添加

    ``` lua
    vim.diagnostic.config({
    -- 省略
    end

    -- lspkind
    local lspkind = require('lspkind')
    lspkind.init({
      -- default: true
      -- with_text = true,
      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',
      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',
      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    })

    local M ={}
    -- 为 cmp.lua 提供参数格式
    M.formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        --mode = 'symbol', -- show only symbol annotations

        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          -- Source 显示提示来源
          vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
          return vim_item
        end
      })
    }

    return M
    ```

* 修改 lua/lsp/cmp.lua

  * lua/lsp/cmp.lua，在 cmp.setup 添加一个 formatting 值

    ``` lua
    cmp.setup({
      -- 指定 snippet 引擎
      snippet = {...},
      -- 来源
      sources = cmp.config.sources({ ... }),
      -- 快捷键
      mapping = require("keybindings").cmp(cmp),
      -- 使用lspkind-nvim显示类型图标 (新增)
      formatting = require('plugin-config.lsp.ui').formatting
    })
    ```

## 缩进线

* [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

* plugins.lua

``` lua
-- indent-blankline
use("lukas-reineke/indent-blankline.nvim")
```

* 配置

  * lua/plugin-config/indent-blankline/init.lua

    ``` lua
    local status, ident_blankline = pcall(require, "indent_blankline")

    if not status then
      vim.notify("can not find indent_blankline!")
      return
    end

    ident_blankline.setup({
      -- 空行占位
      space_char_blankline = " ",
      -- 用 treesitter 判断上下文
      show_current_context = true,
      show_current_context_start = true,
      context_patterns = {
        "class",
        "function",
        "method",
        "element",
        "^if",
        "^while",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
      },
      -- :echo &filetype
      filetype_exclude = {
        "dashboard",
        "packer",
        "terminal",
        "help",
        "log",
        "markdown",
        "TelescopePrompt",
        "lsp-installer",
        "lspinfo",
        "toggleterm",
      },
      -- 竖线样式
      -- char = '¦'
      -- char = '┆'
      -- char = '│'
      -- char = "⎸",
      char = "▏",
    })
    ```

* 调用 indent-blankline 模块

  * init.lua

    ``` lua
    -- indent lue
    require("plugin-config.indent-blankline")
    ```

## lspsaga.nvim

* (lspsaga.nvim)[https://github.com/glepnir/lspsaga.nvim]

  * plugins.lua

    ``` lua
    -- lspsaga
  use("tami5/lspsaga.nvim" )
    ```

* 修改 ui.lua

  * lua/lsp/ui.lua  lspkind 配置 后添加代码

``` lua
local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    -- open = "o",
    open = "<CR>",
    vsplit = "s",
    split = "i",
    -- quit = "q",
    quit = "<ESC>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    -- quit = "q",
    quit = "<ESC>",
    exec = "<CR>",
  },
  rename_action_keys = {
    -- quit = "<C-c>",
    quit = "<ESC>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}
```

* 快捷键

  * keybindings.lua

    ``` lua
    -- lsp 回调函数快捷键设置
    pluginKeys.mapLSP = function(mapbuf)
      -- rename
      --[[
      Lspsaga 替换 rn
      mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
      --]]
      mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
      -- code action
      --[[
      Lspsaga 替换 ca
      mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
      --]]
      mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
      -- go xx
      --[[
        mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
      --]]
      mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
      --[[
      Lspsaga 替换 gh
      mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
      --]]
      mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
      --[[
      Lspsaga 替换 gr
      mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
      --]]
      mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
      --[[
      Lspsaga 替换 gp, gj, gk
      mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
      mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
      mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
      --]]
      -- diagnostic
      mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
      mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
      mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
      mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
      -- 未用
      -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
      -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
      -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
      -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
      -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
      -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
      -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
      -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
    end
    ```

## 代码格式化

* 查看快捷键

  * lua/keybindings.lua 是否存在

    ``` lua
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    ```

* [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)

  * plugins.lua

    ``` lua
    -- formatting
    use ({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    ```

* 配置 null-ls.nvim

  * lua/lsp/null-ls.lua

    ``` lua
    local status, null_ls = pcall(require, "null-ls")

    if not status then
      vim.notify("can not find null-ls!")
      return
    end

    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      debug = false,
      sources = {
        -- Formatting ---------------------
        --  brew install shfmt
        formatting.shfmt,
        -- StyLua
        formatting.stylua,
        -- frontend
        formatting.prettier.with({ -- 只比默认配置少了 markdown
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "yaml",
            "graphql",
            "markdown",
          },
          prefer_local = "node_modules/.bin",
        }),
        -- formatting.fixjson,
        -- formatting.black.with({ extra_args = { "--fast" } }),
      },
      -- 保存自动格式化
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
      end,
    })
    ```

* 调用 null-ls 模块

  * init.lua

    ``` lua
    -- require("lsp.formatter")
    require("plugin-config.lsp.null-ls")
    ```

* 查看状态

  * 指令

    ``` vim
    " 查看绑定的 Language Server 信息
    :LspInfo
    " 查看源的激活情况
    :NullLsInfo
    ```
