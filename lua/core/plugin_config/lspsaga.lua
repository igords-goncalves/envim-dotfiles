vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>')
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_type_definition<CR>')
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>')

require("lspsaga").setup()
