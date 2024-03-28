vim.opt.termguicolors = true
vim.keymap.set('n', '<s-h>', ':bp<CR>')
vim.keymap.set('n', '<s-l>', ':bn<CR>')
vim.keymap.set('n', '<leader>b', ':bd<CR>')

local bufferline = require("bufferline")

bufferline.setup {
  options = {
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'},
    },
    mode = 'buffers',
    buffer_close_icon = '󰅖',
    show_close_icon = false,
    show_tab_indicators = true,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'left',
        highlight = 'Directory',
        separator = true
      }
    }
  }
}
