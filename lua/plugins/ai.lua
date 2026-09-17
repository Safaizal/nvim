return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "right", -- | top | left | right | bottom
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<TAB>" ,  -- Alt + l to accept the suggestion
          accept_word = false,
          accept_line = false,
          next = "<M-]>",     -- Alt + ] for next suggestion
          prev = "<M-[>",     -- Alt + [ for previous suggestion
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
        help = false,
        gitcommit = false,
        gitrevert = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = "node", 
      server_opts_overrides = {},
    })
  end,
}

