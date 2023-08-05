-- Setup Lazy.nvim (https://github.com/folke/lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.coq_settings = {
  auto_start = "shut-up"
}

--- ignores warning about "Missing field: `import`", I don"t know why it"s giving me this warning
require("lazy").setup({
  -- misc
  "Mofiqul/dracula.nvim",
  "shaunsingh/moonlight.nvim",
  "folke/zen-mode.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        ignore_lsp = {
          "lua_ls"
        },
        exclude_dirs = {
          "~/.config/nvim/*",
        },
        patterns = {
          "init.lua",
          ".git",
          "_darcs",
          ".hg",
          ".bzr",
          ".svn",
          "Makefile",
          "package.json"
        }
      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf"
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "folke/neodev.nvim" },
      { "L3MON4D3/LuaSnip" },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = vim.g.treesitter_ensure_installed,
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end,
  },
})

require("telescope").load_extension("projects")
