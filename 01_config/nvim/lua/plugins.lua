-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')

  -- 状态栏
  -- lualine (新增)
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
  use("arkav/lualine-lsp-progress")

  -- 主题
  -- tokyonight
  use("folke/tokyonight.nvim")

  -- 侧边栏, tag 每周更新
  -- nvim-tree
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, tag = 'nightly' })

  -- 底部状态栏
  -- bufferline
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

  -- 模糊搜索
  -- telescope
  use ({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
  -- use ({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- telescope 列出系统环境变量
  -- telescope extensions
  use ("LinArcX/telescope-env.nvim")

  -- 启动 Banner
  -- dashboard-nvim (新增)
  -- use("glepnir/dashboard-nvim")

  -- telescope project
  -- project
  use("ahmedkhalf/project.nvim")

  -- 代码高亮
  -- nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })




end,
-- 设置代理
config = {
  -- 并发数限制
  max_jobs = 16,
  -- 自定义源
  git = {
    default_url_format = "https://hub.fastgit.xyz/%s",
    -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
    -- default_url_format = "https://gitcode.net/mirrors/%s",
    -- default_url_format = "https://gitclone.com/github.com/%s",
  }
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
