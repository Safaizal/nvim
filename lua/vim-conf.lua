vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smartindent")

vim.g.mapleader = " "

-- Remap j to move up and k to move down in Normal, Visual, and Operator-pending modes
vim.keymap.set({ "n", "v", "o" }, "j", "k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "k", "j", { noremap = true, silent = true })

-- to switch bufferline
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

vim.keymap.set("n", "<Esc>", function()
	require("notify").dismiss({ silent = true })
end, { desc = "Dismiss nvim-notify popups" })
