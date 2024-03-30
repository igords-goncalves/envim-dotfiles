local lspconfig = require("lspconfig")

require("mason").setup()

require("mason-lspconfig").setup({
	-- @see https://www.reddit.com/r/neovim/comments/15k3l88/whats_the_purpose_of_masonlspconfig/
	-- Predefined list of server
	---@type string[]
	ensure_installed = {
		"lua_ls",

		-- Web development
		"html",
		"cssls",
		"tsserver",
		"tailwindcss",
		"angularls",
		"eslint",

		-- Configurations settings
		"remark_ls",
		"jsonls",
		"emmet_ls",
		"yamlls",

		-- C / C++ development
		"clangd",

		-- Python development
		"pyright",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Fixed bug in vim unknow command
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Front-end developement
lspconfig.tsserver.setup({
	on_atach = on_atach,
	capabilities = capabilities,
})
lspconfig.cssls.setup({
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
})
lspconfig.html.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	capabilities = capabilities,
})

-- Configurations
lspconfig.jsonls.setup({
	capabilities = capabilities,
})
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
})
lspconfig.yamlls.setup({
	capabilities = capabilities,
})

-- C / C++
lspconfig.clangd.setup({
	capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
	capabilities = capabilities,
})

-- Keymapins
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings. See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)

		-- Shows current path
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)

		-- Diagnostics
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

		-- Open buffs
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- Formatting now by the formatters
		--		 vim.keymap.set('n', '<leader>lf', function()
		--	      vim.lsp.buf.format { async = true }
		--	    end, opts)
	end,
})
