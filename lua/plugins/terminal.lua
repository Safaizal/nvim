return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-\>]],
      hide_numbers = true,
			shade_terminals = true,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
		})

		vim.api.nvim_create_user_command("Term1", "ToggleTerm 1", {})
		vim.api.nvim_create_user_command("Term2", "ToggleTerm 2", {})
		vim.api.nvim_create_user_command("Term3", "ToggleTerm 3", {})
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {desc = "Enter Normal mode"})
		vim.keymap.set("n", "<leader>t1", "<cmd>Term1<cr>", { desc = "Terminal 1" })
		vim.keymap.set("n", "<leader>t2", "<cmd>Term2<cr>", { desc = "Terminal 2" })
		vim.keymap.set("n", "<leader>t3", "<cmd>Term3<cr>", { desc = "Terminal 3" })

		vim.keymap.set("n", "<leader>tn", function()
			local terminals = require("toggleterm.terminal").get_all()
			local max_id = 0
			for _, t in ipairs(terminals) do
				if t.id > max_id then
					max_id = t.id
				end
			end
			vim.cmd("ToggleTerm " .. (max_id + 1))
		end, { desc = "New Terminal" })
	end,
}
