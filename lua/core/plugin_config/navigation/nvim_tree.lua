vim.g.loaded_netry = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
	},
	diagnostics = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	renderer = {
		icons = {
			git_placement = "after",
			glyphs = {
				git = {
					unstaged = "M",
					staged = "S",
					unmerged = "",
					-- renamed = "➜",
					renamed = "R",
					untracked = "U",
					-- deleted = "",
					deleted = "D",
					ignored = "◌",
				},
			},
		},
	},
})

vim.keymap.set("n", "<c-n>", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<C-l>", "<C-w>w")
vim.keymap.set("n", "<C-h>", "<C-w>w")
