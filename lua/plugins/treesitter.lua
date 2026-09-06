return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
      auto_install = true,
      indent = { enable = true },
      highlight = { enable = true },
    })
  end,
}
