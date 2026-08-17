return {
	-- Using lazy.nvim
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				colors = {
					comment = "#5c6370",
					keyword = "#eeeeee",
					func = "#70f3ff",
					string = "#a9ff68",
					type = "#5af78e",
					constant = "#ffd166",
					variable = "#dddddd",
					operator = "#aa1100",
					number = "#999999",
					boolean = "#1100bb",
					accent = "#00ff66",
					border = "#00ff66",
				},

				highlights = {
					-- Full Treesitter Capture Groups (Cross-Language)
					["@comment"] = { fg = "$comment", italic = true },
					["@string"] = { fg = "$string" },
					["@string.regex"] = { fg = "$string" },
					["@string.escape"] = { fg = "$operator" },
					["@character"] = { fg = "$string" },
					["@number"] = { fg = "$number" },
					["@boolean"] = { fg = "$boolean" },
					["@number.float"] = { fg = "$number" },

					["@function"] = { fg = "$func" },
					["@function.builtin"] = { fg = "$func" },
					["@function.call"] = { fg = "$func" },
					["@function.macro"] = { fg = "$func" },
					["@method"] = { fg = "$func" },
					["@method.call"] = { fg = "$func" },
					["@constructor"] = { fg = "$type" },
					["@parameter"] = { fg = "$variable" },

					["@keyword"] = { fg = "$keyword" },
					["@keyword.function"] = { fg = "$keyword" },
					["@keyword.operator"] = { fg = "$operator" },
					["@keyword.return"] = { fg = "$keyword" },
					["@conditional"] = { fg = "$keyword" },
					["@repeat"] = { fg = "$keyword" },
					["@label"] = { fg = "$keyword" },
					["@operator"] = { fg = "$operator" },
					["@exception"] = { fg = "$keyword" },

					["@type"] = { fg = "$type" },
					["@type.builtin"] = { fg = "$type" },
					["@type.definition"] = { fg = "$type" },
					["@type.qualifier"] = { fg = "$type" },
					["@storageclass"] = { fg = "$keyword" },
					["@structure"] = { fg = "$type" },
					["@include"] = { fg = "$keyword" },

					["@variable"] = { fg = "$variable" },
					["@variable.builtin"] = { fg = "$keyword" },
					["@variable.parameter"] = { fg = "$variable" },
					["@variable.member"] = { fg = "$variable" },
					["@property"] = { fg = "$variable" },
					["@constant"] = { fg = "$constant" },
					["@constant.builtin"] = { fg = "$constant" },
					["@constant.macro"] = { fg = "$constant" },

					["@lsp.type.class"] = { fg = "$type" },
					["@lsp.type.decorator"] = { fg = "$func" },
					["@lsp.type.enum"] = { fg = "$type" },
					["@lsp.type.enumMember"] = { fg = "$constant" },
					["@lsp.type.function"] = { fg = "$func" },
					["@lsp.type.interface"] = { fg = "$type" },
					["@lsp.type.macro"] = { fg = "$func" },
					["@lsp.type.method"] = { fg = "$func" },
					["@lsp.type.namespace"] = { fg = "$type" },
					["@lsp.type.parameter"] = { fg = "$variable" },
					["@lsp.type.property"] = { fg = "$variable" },
					["@lsp.type.struct"] = { fg = "$type" },
					["@lsp.type.type"] = { fg = "$type" },
					["@lsp.type.typeParameter"] = { fg = "$type" },
					["@lsp.type.variable"] = { fg = "$variable" },
				},

				theme = "thyrfing",
				trve = true, -- switch this to false if you want light variants
			})
			require("black-metal").load()
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		priority = 1000,
		opts = {
			render = "background",
			enable_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = true,
		},
		config = function(_, opts)
			require("nvim-highlight-colors").setup(opts)
		end,
	},
}
