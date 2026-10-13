return {
  "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    timeout = 3000,
    render = "wrapped-compact",
    stages = "fade",
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end
}
