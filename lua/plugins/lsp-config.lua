return{
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
     require("mason-lspconfig").setup({
       ensure_installed = {
         "lua_ls",
         "vtsls"
       }
     })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls', 'vtsls')
      vim.keymap.set('n', 'I', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'D', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
