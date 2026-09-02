return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 30
      }
    })
    vim.keymap.set('n', '<leader>nt', ':Neotree filesystem reveal left<CR>', {})
  end
}
