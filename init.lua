vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

require("config.lazy")

vim.keymap.set('n', '<leader>nt', ':Neotree filesystem reveal left<CR>')

--For treesitter
local tree_config = require('nvim-treesitter')
tree_config.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
tree_config.install{
  'rust', 
  'javascript', 
  'zig',
  'lua',
  'python'
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
