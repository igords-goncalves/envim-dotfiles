vim.g.loaded_netry = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  filters = {
    dotfiles = false,
  },
  diagnostics = {
    enable = true
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      }
    }
  },
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<C-l>', '<C-w>w')
vim.keymap.set('n', '<C-h>', '<C-w>w')
