vim.opt.number = true


require("vim-conf")
require("config.lazy")

vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#00ff11" })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#777777" })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#ff0011" })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#ffffff" })
