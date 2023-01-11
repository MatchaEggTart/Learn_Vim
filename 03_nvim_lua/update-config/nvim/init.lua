-- 基础配置
require('basic')

-- 快捷键映射
require("keybindings")

-- Packer 插件管理
require("plugins")

-------------------- 插件配置 --------------------
-- 主题设置 
require("plugin-config.colorscheme")

-- nvim-tree
require("plugin-config.nvim-tree")

-- bufferline
require("plugin-config.bufferline")

-- lualine
require("plugin-config.lualine")
