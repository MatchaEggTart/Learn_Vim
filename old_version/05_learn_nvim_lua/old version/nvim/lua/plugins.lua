local packer = require("packer")

packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use ('wbthomason/packer.nvim')

    -- 你的插件列表...

    --------------------- LSP -----------------------------
    -- LSP install tool
    use ({ "williamboman/nvim-lsp-installer" })
    -- Lspconfig
    use ({ "neovim/nvim-lspconfig" })
    -- ui for tips
    use ("onsails/lspkind-nvim")
    -- lspsaga
    -- use ("tami5/lspsaga.nvim" )
    -- formatting
    use ({
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    -- JSON 增强
    use ("b0o/schemastore.nvim")
    -- javascript, typescript
    use ({
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      requires = "nvim-lua/plenary.nvim"
    })
    -------------------------------------------------------

    --------------------- cmp -----------------------------
    -- nvim-cmp
    -- 补全源
    use ("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use ("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use ("hrsh7th/cmp-path") -- { name = 'path' }
    use ("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 补全工具
    use ("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use ("hrsh7th/cmp-vsnip")
    use ("hrsh7th/vim-vsnip")
    -- 符号自动补全
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
    -- 常见编程语言代码段
    use ("rafamadriz/friendly-snippets")
    -------------------------------------------------------

    --------------------- coding --------------------------
    -- treesitter
    -- 代码高亮
    use ({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- indent-blankline
    -- 缩进线
    use ("lukas-reineke/indent-blankline.nvim")
    -- 注释
    use ("numToStr/Comment.nvim")
    -- surround
    use ("ur4ltz/surround.nvim")
    -------------------------------------------------------

    --------------------- colorschemes --------------------
    -- tokyonight
    use ("folke/tokyonight.nvim")
    -------------------------------------------------------

    --------------------- tools ---------------------------
    -- nvim-tree
    -- 侧边栏
    use ({
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    })

    -- bufferline
    -- 标签页
    use ({
      "akinsho/bufferline.nvim", 
      tag = "v2.*", 
      requires = { 
        "kyazdani42/nvim-web-devicons", 
        "moll/vim-bbye" 
      }
    })

    -- lualine (新增)
    -- 底部信息
    use ({
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
    })
    use ("arkav/lualine-lsp-progress")

    -- telescope
    -- 快速搜索
    use ({
      'nvim-telescope/telescope.nvim',
      requires = {
        "nvim-lua/plenary.nvim"
      }
    })
    -- telescope extensions
    -- 参看环境变量
    use ("LinArcX/telescope-env.nvim")
    -- telescope project
    -- 参看项目
    use ("ahmedkhalf/project.nvim")

    -- dashboard-nvim
    -- 启动页
    use ("glepnir/dashboard-nvim")

    -------------------------------------------------------
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
