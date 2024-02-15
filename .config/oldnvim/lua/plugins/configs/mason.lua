local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Problem with mason")
  return
end

mason.setup({
  ui = {
    border = "single"
  }
})

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

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
}

mason_lspconfig.setup_handlers {
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
      end
      ,
      flags = lsp_flags,
      capabilities = capabilities,
      handlers = handlers
    }
  end,
}

local pid = vim.fn.getpid()

require 'lspconfig'.lua_ls.setup {

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- require'lspconfig'.omnisharp.setup {
--     cmd = {"/home/mili/.local/share/nvim/mason/bin/omni/OmniSharp"},
--
--     -- Enables support for reading code style, naming convention and analyzer
--     -- settings from .editorconfig.
--     enable_editorconfig_support = true,
--
--     -- If true, MSBuild project system will only load projects for files that
--     -- were opened in the editor. This setting is useful for big C# codebases
--     -- and allows for faster initialization of code navigation features only
--     -- for projects that are relevant to code that is being edited. With this
--     -- setting enabled OmniSharp may load fewer projects and may thus display
--     -- incomplete reference lists for symbols.
--     enable_ms_build_load_projects_on_demand = false,
--
--     -- Enables support for roslyn analyzers, code fixes and rulesets.
--     enable_roslyn_analyzers = false,
--
--     -- Specifies whether 'using' directives should be grouped and sorted during
--     -- document formatting.
--     organize_imports_on_format = false,
--
--     -- Enables support for showing unimported types and unimported extension
--     -- methods in completion lists. When committed, the appropriate using
--     -- directive will be added at the top of the current file. This option can
--     -- have a negative impact on initial completion responsiveness,
--     -- particularly for the first few completion sessions after opening a
--     -- solution.
--     enable_import_completion = false,
--
--     -- Specifies whether to include preview versions of the .NET SDK when
--     -- determining which version to use for project loading.
--     sdk_include_prereleases = true,
--
--     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--     -- true
--     analyze_open_documents_only = false,
--
--     capabilities = capabilities,
-- }
