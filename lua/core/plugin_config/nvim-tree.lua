vim.g.loaded_netry = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<C-l>', '<C-w>w', defaults)
vim.keymap.set('n', '<C-h>', '<C-w>w', defaults)

