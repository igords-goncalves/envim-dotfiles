require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "tsserver",
    "tailwindcss",
    "remark_ls",
    "jsonls",
    "emmet_ls",
    "angularls",
    "yamlls"
  }
}

local on_atach = function(_, _)
  --keymaps
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
  on_atach = on_atach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"},
      }
    }
  }

}

require("lspconfig").html.setup {}

require("lspconfig").cssls.setup {}

require("lspconfig").tsserver.setup {}
