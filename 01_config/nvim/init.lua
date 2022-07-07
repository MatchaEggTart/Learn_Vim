-- 基础配置
require('basic')

-- 插件管理
require('plugins')

-- 快捷键映射
require("keybindings")

-- 主题设置
require("colorscheme")

-- 插件配置
-- 插件 nvim-tree 配置
require("plugin-config.nvim-tree")
-- 插件 bufferline 配置
require("plugin-config.bufferline")
-- 插件 lualine 配置
require("plugin-config.lualine")
-- 插件 telescope 配置
require("plugin-config.telescope")
-- 插件 dashboard
-- require("plugin-config.dashboard")
-- 插件 telescope project
require("plugin-config.project")
-- 插件 nvim-treesitter
require("plugin-config.nvim-treesitter")

