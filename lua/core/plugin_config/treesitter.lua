require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

  sync_install = false,

  --It'll install and apply highlights
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
  },
  ident = {
    enable = true,
    disable = {},
  }
}
