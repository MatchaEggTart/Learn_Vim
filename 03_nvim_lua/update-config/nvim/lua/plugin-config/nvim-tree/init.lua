local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("can not find nvim-tree!")
  return
end
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- local list_keys = require('keybindings').nvimTreeList

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
-- require("nvim-tree").setup({
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" },
      },
    },
    -- 宽度
    width = 40,
    -- 也可以 'right'
    side = 'left',
    -- 隐藏根目录
    hide_root_folder = false,
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = 'yes',
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    -- 隐藏 .文件 和 node_modules 文件夹
    custom = { 'node_modules' },
  },
  git = {
    enable = true,
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭
      -- quit_on_open = true,
    },
  }
})

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
