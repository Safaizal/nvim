vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html",
  callback = function(args)
    local ok, lines = pcall(vim.fn.readfile, args.match)
    if not ok then
      return
    end
    local content = table.concat(lines, "\n")
    if content:find("{%%") or content:find("{{") or content:find("{#") then
      vim.bo[args.buf].filetype = "htmldjango"
    end
  end,
})

return {
  {
    -- NOTE: mason moved from williamboman/ to mason-org/
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      -- Server-specific settings via the modern vim.lsp.config API
      -- (mason-lspconfig v2 applies these when it enables each server).
      -- "*" sets defaults (e.g. cmp capabilities) for every server.
      vim.lsp.config("*", {
        capabilities = capabilities,
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.config("jinja_lsp", {
        filetypes = { "jinja", "htmldjango", "html" },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "biome",
          "cssls",
          "html",
          "vtsls",
          "clangd",
          "jinja_lsp",
        },
        -- v2 API: automatically enable installed servers as Neovim LSP clients.
        -- (The old `handlers` / `automatic_installation` keys no longer exist.)
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local map = vim.keymap.set
          local opts = { buffer = ev.buf, silent = true }

          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "gD", vim.lsp.buf.declaration, opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- Consistent IDE-style diagnostics (signs, float, virtual text)
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
      })
    end,
  },
}
