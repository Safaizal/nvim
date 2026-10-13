return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    -- NOTE: on the rewritten `main` branch, setup() only accepts
    -- `install_dir`; highlighting / indent / auto-install are enabled
    -- per-buffer via the Neovim core vim.treesitter API instead.
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Languages to keep installed (restores the old auto_install behavior).
    local ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "json",
      "markdown",
      "markdown_inline",
      "c",
      "bash",
    }
    require("nvim-treesitter").install(ensure_installed)

    -- Enable treesitter highlighting + indentation for every filetype
    -- that ships a parser (official main-branch recommendation).
    -- vim.treesitter.start() errors when no parser exists, hence pcall.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterEnable", { clear = true }),
      callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
