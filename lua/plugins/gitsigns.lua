return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff11" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#9abcff" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#dd0011" })
	end,
}
