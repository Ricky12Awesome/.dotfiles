local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

cmd [[ colorscheme dracula ]]
opt.termguicolors = true
opt.completeopt = 'menu,menuone,noselect'
opt.fileencoding = 'utf-8'
opt.swapfile = false
opt.undofile = true
opt.cursorline = true
opt.fillchars = { eob = ' ', vert = ' '}

opt.hlsearch = false
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 2
opt.shortmess:append('I')
opt.showmode = false
opt.sidescrolloff = 2
opt.splitbelow = true
opt.splitright = true
opt.wrap = false

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.timeoutlen = 500

