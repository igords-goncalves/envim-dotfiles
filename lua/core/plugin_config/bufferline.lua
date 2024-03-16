vim.opt.termguicolors = true
vim.keymap.set('n', '<s-l>', ':bp<CR>')
vim.keymap.set('n', '<s-h>', ':bn<CR>')
vim.keymap.set('n', '<leader>b', ':bd<CR>')

local bufferline = require("bufferline")

bufferline.setup {
  options = {
    mode = 'buffers',
    buffer_close_icon = 'x',
    show_tab_indicators = true,
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
