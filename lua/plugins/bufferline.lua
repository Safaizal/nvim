return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				separator_style = "thin", -- options: "slant" | "slope" | "thick" | "thin"
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
			highlights = {
				-- Active tab style
				buffer_selected = {
					fg = "#dddddd", -- Font color
					bold = true,
					italic = false,
				},
				-- Inactive tab style
				buffer_visible = {
					fg = "#999999",
				},
        separator_selected = {
          fg = "#00ff11"
        }
			},
		})
	end,
}
