local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Problem with mason")
  return
end

mason.setup()

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Problem with mason-lspconfig")
  return
end

mason_lspconfig.setup {
	automatic_installation = true
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Problems with lspconfig")
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local navic = require("nvim-navic")

mason_lspconfig.setup_handlers {

    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function (server_name)
    lspconfig[server_name].setup {
      on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
      end,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  end,
}

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
