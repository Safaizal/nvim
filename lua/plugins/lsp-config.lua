return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true
    }
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("lua_ls", "vtsls", "cssls", "biome")
			vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "D", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
