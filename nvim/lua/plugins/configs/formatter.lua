-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },

    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },

    python = {
      require("formatter.filetypes.python").autopep8,
    },

    cs = {
      require("formatter.filetypes.cs").clangformat,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace,
      -- require("formatter.defaults.prettier"),
    }
  }
}
