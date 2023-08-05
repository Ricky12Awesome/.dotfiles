local lsp = require("lsp-zero").preset({
  name = "recommended",
})

require("neodev").setup()
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls({
  settings = {
    Lua = {
      diagnostics = {
        disable = vim.split("missing-fields, ", ", ")
      }
    }
  }
}))

lsp.setup()

local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = { 'menu', 'abbr', 'kind' },

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = " [" .. menu_icon[entry.source.name] .. "] "

      if not item.menu then
        item.menu = " [" .. entry.source.name .. "] "
      end

      return item
    end,
  },
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }
})
