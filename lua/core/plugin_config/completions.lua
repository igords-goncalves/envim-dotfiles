local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
     require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  }, {
    {name = 'buffer'}
  }),

  -- Keymapins 
  mapping = cmp.mapping.preset.insert({
    ['<C-a>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p'] = cmp.mapping.select_prev_item(),
    ['<C-n'] = cmp.mapping.select_next_item(),
    ['<Shift-<Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  })
})


