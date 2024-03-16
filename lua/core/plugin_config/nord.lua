vim.o.termguicolors = true
vim.cmd[[colorscheme nord]]
vim.g.nord_disable_background = true

require('nord').set()

require('lualine').setup {
  options = {
    theme = 'nord'
  }
}
