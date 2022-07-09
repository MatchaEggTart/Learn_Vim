-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function()
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')

  -- LSP
  -- Configurations for Nvim LSP
  use ("williamboman/nvim-lsp-installer")
  use ("neovim/nvim-lspconfig")

  -- 补全
  -- nvim-cmp
  -- snippet 引擎
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  -- 补全源
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  -- 补全引擎
  use("hrsh7th/nvim-cmp")

  -- 常见编程语言代码段
  use("rafamadriz/friendly-snippets")

  -- ui (新增)
  use("onsails/lspkind-nvim")

  -- indent-blankline
  use("lukas-reineke/indent-blankline.nvim")

  -- 代码格式化
  -- use("mhartington/formatter.nvim")
  use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

  -- JSON 增强
  use("b0o/schemastore.nvim")

  -- TypeScript 增强插件
  use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })


  use ({ "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end })

  -- Comment
  use("numToStr/Comment.nvim")

  -- surround
  use("ur4ltz/surround.nvim")



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

  -- banner
  -- dashboard-nvim
  use {'glepnir/dashboard-nvim'}


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
