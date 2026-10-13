return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",  -- these two will get data for the nvim-cmp window and complete the snippets
    }
  },
  {
    "hrsh7th/nvim-cmp", -- this will open a window
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
            winblend = 15,
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
            winblend = 20,
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- select=false: only confirm an explicitly selected item so
          -- <CR> doesn't swallow newlines when nothing is selected.
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- this is reponsible for the  interaction between nvim lsps and nvim-cmp.
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })
      -- Set custom hex colors for the popup border and selection item
      vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "PmenuSel",    { bg = "#000000", fg = "#00ff11", bold = true }) -- Selected item
    end
  }
}
