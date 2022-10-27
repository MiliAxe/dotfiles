vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

local lspkind = require('lspkind')

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")


cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<c-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-'>"] = cmp.mapping(function()
      luasnip.jump(1)
    end
      , { "i", "s" }),

    ["<C-;>"] = cmp.mapping(function()
      luasnip.jump(-1)
    end
      , { "i", "s" }),

    ["<C-h>"] = cmp.mapping(function()
        luasnip.change_choice(1)
    end
      , { "i", "s" }),
  }),

  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
    { name = "spell", keyword_length = 8 },
    { name = "emoji" },
    { name = "cmdline", keyword_length = 5 },
    { name = "look", keyword_length = 5 },
  },

  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lua = "[API]",
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        luasnip = "[Snip]",
        look = "[Look]",
        spell = "[Spell]",
        cmdline = "[CMD]",
      }
    },
  },

  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  
  preselect = cmp.PreselectMode.None
}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)


-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require('lspconfig')['pylsp'].setup {
--   capabilities = capabilities
-- }
-- require('lspconfig')['emmet_ls'].setup {
--   capabilities = capabilities
-- }
-- require('lspconfig')['html'].setup {
--   capabilities = capabilities
-- }
-- require('lspconfig')['bashls'].setup {
--   capabilities = capabilities
-- }
