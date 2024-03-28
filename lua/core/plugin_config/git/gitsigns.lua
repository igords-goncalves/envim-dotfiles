require('gitsigns').setup({
  
})

-- keymapings
vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', {})
vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {})
