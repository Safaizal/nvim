return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function ()
    local tree_config = require('nvim-treesitter')
      tree_config.setup {
        -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
        install_dir = vim.fn.stdpath('data') .. '/site',
        auto_install = true
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end
}
