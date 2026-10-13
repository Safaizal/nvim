return {
  "rmagatti/auto-session",
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    auto_restore = false,
    auto_save = true,
    -- log_level = 'debug',
  },
  config = function(_, opts)
    -- NOTE: pass `opts` through so suppressed_dirs etc. actually apply.
    require("auto-session").setup(opts)

    vim.keymap.set("n", "<leader>sr", function()
      require("auto-session").restore_session()
    end, { desc = "Restore Session" })

    -- NOTE: :SessionSearch only exists with the session-lens extension;
    -- stock v3 exposes the picker as :AutoSession search.
    vim.keymap.set("n", "<leader>ss", "<cmd>AutoSession search<CR>", { desc = "Search Session" })
  end
}
