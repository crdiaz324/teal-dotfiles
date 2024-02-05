local plugins = {
  { "ThePrimeagen/vim-be-good" , lazy = false },  -- load a plugin at startup
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "rust-analyzer",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = 'crates'})
      return M
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "BufEnter",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      --- @diagnostic disable: unused-local
      require("ufo").setup({
        provider_selector = function(_bufnr, _filetype, _buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end
  -- },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = "neovim/nvim-lspconfig",
  --   opts = function ()
  --     return require "custom.configs.rust-tools"
  --   end,
  --   config = function (_, opts)
  --     require ('rust-tools').setup(opts)
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  -- },
  -- {
  --   "saecki/crates.nvim",
  --   ft = {"rust", "toml"},
  --   config = function (_, opts)
  --     local crates = require('crates')
  --     crates.setup(opts)
  --     crates.show()
  --   end,
  -- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	event = { "BufEnter" },
	-- 	dependencies = { "zbirenbaum/copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
}

return plugins
