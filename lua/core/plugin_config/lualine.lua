require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {
      {
        'mode',
        icons_enabled = true,
        icon = nil,
        separator = nil,
        color = nil,
      }
    }
  }
}
