return {
  "rmagatti/auto-session",
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
  },
  config = function ()
    require("auto-session").setup({
      auto_restore = false,
      auto_save = true,
    })

    vim.keymap.set("n", "<leader>sr", function()
      require("auto-session").RestoreSession()
    end, { desc = "Restore Session" })

    vim.keymap.set("n", "<leader>ss",":SessionSearch<CR>", { desc = "Search Session" })
  end
}
