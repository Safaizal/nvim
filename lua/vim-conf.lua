-- Core editor options (vim.opt API; single source of truth for options)
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Professional IDE defaults (options only, no new features)
vim.opt.number = true
vim.opt.signcolumn = "yes" -- keep gutter stable for gitsigns / diagnostics
vim.opt.cursorline = true
vim.opt.undofile = true -- persistent undo
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250 -- faster CursorHold / gitsigns updates
vim.opt.timeoutlen = 400 -- snappier which-key / key sequences
vim.opt.scrolloff = 8 -- keep context around cursor
vim.opt.wrap = false -- cleaner code view

vim.g.mapleader = " "

-- to switch bufferline
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Next buffer" })

-- Dismiss notifications with <Esc> without swallowing <Esc> itself,
-- and clear search highlighting like a standard IDE setup.
vim.keymap.set("n", "<Esc>", function()
  local ok, notify = pcall(require, "notify")
  if ok then
    notify.dismiss({ silent = true })
  end
  vim.cmd("nohlsearch")
  return "<Esc>"
end, { desc = "Dismiss notifications / clear highlight", expr = true, silent = true })
