vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.termguicolors = true

vim.g.colorscheme = "dracula"

vim.g.mapleader = " "

vim.g.rust_recommended_style = false

vim.g.coq_settings = {
  auto_start = "shut-up",
}

-- its best for these to be together
vim.g.mason_ensure_installed = {
  "lua_ls",
  "rust_analyzer",
  "jsonls",
  "taplo",
}

vim.g.treesitter_ensure_installed = {
  "rust", "lua", "json", "toml"
}

-- Neovide Settings, I mainly use Neovide on Windows using nvim in WSL
if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font:h16"

  vim.g.neovide_scale_factor = 1.5
  vim.g.neovide_refresh_rate = 170

  vim.g.neovide_padding_left = 10
  vim.g.neovide_padding_right = 10
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_down = 10

  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_cursor_animation_length = 0.05

  vim.g.neovide_transparency = 0.95
  vim.g.transparency = vim.g.neovide_transparency

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.1) end)
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.1) end)
end
