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

mason_lspconfig.setup_handlers {
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
        -- if client.name == 'omnisharp' then
        --   local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
        --   for i, v in ipairs(tokenModifiers) do
        --     tokenModifiers[i] = v:gsub(' ', '_')
        --   end
        --   local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
        --   for i, v in ipairs(tokenTypes) do
        --     tokenTypes[i] = v:gsub(' ', '_')
        --   end
        -- end
        if client.name == "omnisharp" then
          client.server_capabilities.semanticTokensProvider = {
            full = vim.empty_dict(),
            legend = {
              tokenModifiers = { "static_symbol" },
              tokenTypes = {
                "comment",
                "excluded_code",
                "identifier",
                "keyword",
                "keyword_control",
                "number",
                "operator",
                "operator_overloaded",
                "preprocessor_keyword",
                "string",
                "whitespace",
                "text",
                "static_symbol",
                "preprocessor_text",
                "punctuation",
                "string_verbatim",
                "string_escape_character",
                "class_name",
                "delegate_name",
                "enum_name",
                "interface_name",
                "module_name",
                "struct_name",
                "type_parameter_name",
                "field_name",
                "enum_member_name",
                "constant_name",
                "local_name",
                "parameter_name",
                "method_name",
                "extension_method_name",
                "property_name",
                "event_name",
                "namespace_name",
                "label_name",
                "xml_doc_comment_attribute_name",
                "xml_doc_comment_attribute_quotes",
                "xml_doc_comment_attribute_value",
                "xml_doc_comment_cdata_section",
                "xml_doc_comment_comment",
                "xml_doc_comment_delimiter",
                "xml_doc_comment_entity_reference",
                "xml_doc_comment_name",
                "xml_doc_comment_processing_instruction",
                "xml_doc_comment_text",
                "xml_literal_attribute_name",
                "xml_literal_attribute_quotes",
                "xml_literal_attribute_value",
                "xml_literal_cdata_section",
                "xml_literal_comment",
                "xml_literal_delimiter",
                "xml_literal_embedded_expression",
                "xml_literal_entity_reference",
                "xml_literal_name",
                "xml_literal_processing_instruction",
                "xml_literal_text",
                "regex_comment",
                "regex_character_class",
                "regex_anchor",
                "regex_quantifier",
                "regex_grouping",
                "regex_alternation",
                "regex_text",
                "regex_self_escaped_character",
                "regex_other_escape",
              },
            },
            range = true,
          }
        end
      end
      ,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  end,
}

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
-- local omnisharp_bin = "/home/mili/.local/share/nvim/mason/bin/omnisharp"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"

-- local config = {
--   handlers = {
--     ["textDocument/definition"] = require('omnisharp_extended').handler,
--   },
--   cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
--   -- rest of your settings
-- }
--
-- require'lspconfig'.omnisharp.setup(config)
-- 
require'lspconfig'.lua_ls.setup {

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
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
