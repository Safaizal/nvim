return {
  {
    "mason-org/mason.nvim",
    opts = {

    }
  },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"biome",
				"cssls",
				"html",
				"vtsls",
				"clangd",
        "harper_ls"
			},
			automatic_installation = true,

			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map = vim.keymap.set
					local opts = { buffer = ev.buf }

					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "gD", vim.lsp.buf.declaration, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
