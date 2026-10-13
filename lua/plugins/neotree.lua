return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>nt", "<cmd>Neotree filesystem reveal left<CR>", desc = "File explorer" },
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 30
      }
    })
  end
}
