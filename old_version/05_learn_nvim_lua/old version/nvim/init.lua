-- 基础配置
require('basic')

-- 快捷键映射
require("keybindings")

-- Packer 插件管理
require("plugins")

-- 主题设置 
require("plugin-config.colorscheme")

-------------------- 插件配置 --------------------
-- nvim-tree
require("plugin-config.nvim-tree")

-- bufferline
require("plugin-config.bufferline")

-- lueline
require("plugin-config.lualine")

-- telescope
require("plugin-config.telescope")

-- project
require("plugin-config.project")

-- dashboard
require("plugin-config.dashboard")

-- nvim-treesitter
require("plugin-config.nvim-treesitter")

-- LSP
require("plugin-config.lsp.setup")

-- cmp
require("plugin-config.cmp")

-- ui for error
require("plugin-config.lsp.ui")

-- indent lue
require("plugin-config.indent-blankline")

-- require("lsp.formatter")
require("plugin-config.lsp.null-ls")

-- autopairs
require("plugin-config.nvim-autopairs")

-- comment
require("plugin-config.comment")

-- surround
require("plugin-config.surround")
