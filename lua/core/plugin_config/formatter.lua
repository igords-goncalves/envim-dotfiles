local util = require "formatter.util"

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
      function()
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Web development
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.javascript").prettier
    },

    -- C and C++ development
    c = {
      require("formatter.filetypes.c").clangformat
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

--local augroup = vim.api.nvim_create_augroup
--local autocmd = vim.api.nvim_create_autocmd
-- augroup("__formatter__", { clear = true })
--autocmd("BufWritePost", {
--  group = "__formatter__",
--  command = ":FormatWrite",
--})

vim.keymap.set('n', '<leader>lf', ':Format<CR>')
