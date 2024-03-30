require('lint').linters_by_ft = {
  markdown = {'vale'},
  javascript = {'eslint, eslint_d'},
  typescript = {'eslint', 'eslint_d'},
  c = {'cpplint'},
  cpp = {'cpplint'},
  python = {'pylint'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})