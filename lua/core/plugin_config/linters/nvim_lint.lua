require('lint').linters_by_ft = {
  markdown = {'vale'},
  javascript = {'eslint, eslint_d', 'standardjs'},
  typescript = {'eslint', 'eslint_d', 'standardjs'},
  c = {'cpplint'},
  cpp = {'cpplint'},
  python = {'pylint'},
  ["*"] = {'commitlint'},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
