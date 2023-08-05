local lsp = require("lsp-zero")

local map = function(m, bind, desc, mapping, buffer)
  vim.keymap.set(m, bind, mapping, {
    buffer = buffer,
    desc = desc,
  })
end

lsp.on_attach(function(client, buffer)
  local mapLocal = function(m, bind, desc, mapping)
    map(m, bind, desc, mapping, buffer)
  end

  -- mostly the same as default keymap for lsp-zero,
  -- but with names that work with which-key
  mapLocal('n', 'K', "Hover", vim.lsp.buf.hover)
  mapLocal('i', '<C-q>', "H", vim.lsp.buf.hover)
  mapLocal('n', 'gd', "Definition", vim.lsp.buf.definition)
  mapLocal('n', 'gD', "Declaration", vim.lsp.buf.declaration)
  mapLocal('n', 'gi', "Implementation", vim.lsp.buf.implementation)
  mapLocal('n', 'go', "Type Definition", vim.lsp.buf.type_definition)
  mapLocal('n', 'gr', "Reference", vim.lsp.buf.references)
  mapLocal('n', 'gs', "Singature Help", vim.lsp.buf.signature_help)
  mapLocal('n', '<leader>r', "Rename", vim.lsp.buf.rename)
  mapLocal('n', '<leader>ca', "Code Action", vim.lsp.buf.code_action)

  if vim.lsp.buf.range_code_action then
    mapLocal('x', '<leader>ca', "Code Action", vim.lsp.buf.range_code_action)
  else
    mapLocal('x', '<leader>ca', "Code Action", vim.lsp.buf.code_action)
  end

  mapLocal('n', 'gl', "Dianostics", vim.diagnostic.open_float)
  mapLocal('n', '[d', "Dianostic Prev", vim.diagnostic.goto_prev)
  mapLocal('n', ']d', "Dianostic Next", vim.diagnostic.goto_next)
  mapLocal('n', '<leader>q', "", vim.diagnostic.setloclist)

  mapLocal("n", "<leader>f", "Format", function()
    vim.lsp.buf.format { async = true }
  end)
end)

-- Misc
map("n", "<leader>p", "Paste From Clipboard", "\"+p")
map("n", "<leader>y", "Copy To Clipboard", "\"+y")

-- Telescope
vim.keymap.set(
  "n",
  "<leader><leader>",
  function()
    vim.cmd.Telescope("fd")
  end,
  { desc = "Find File" }
)

vim.keymap.set(
  "n",
  "<leader>`",
  function()
    vim.cmd.Telescope("projects")
  end,
  { desc = "Open Recent Project" }
)
