return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      -- NOTE: a single setup() call — multiple setup() calls overwrite
      -- each other and the last one silently wins.
      require("telescope").setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
          media_files = {
            filetypes = { "png", "jpg", "jpeg", "webp", "pdf" },
            find_cmd = "rg",
          },
        },
      })

      -- Load extensions best-effort (e.g. fzf needs `make` to have run).
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
      pcall(require("telescope").load_extension, "media_files")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {
        desc = "Telescope find files",
      })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
        desc = "Telescope live grep",
      })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {
        desc = "Telescope buffers",
      })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
        desc = "Telescope help tags",
      })
    end,
  },
}
