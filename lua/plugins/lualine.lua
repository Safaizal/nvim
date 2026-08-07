return {
  'nvim-lualine/lualine.nvim',
  config = function()
   require('lualine').setup({
      options = {
        theme = 'custome'
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 1
          }
        },
        lualine_x = {
          {'encoding'},
          {
            'fileformat',
            symbols = {
              unix = '󰣇',
              mac = ''
            },
          },
          {
            'filetype',
            colored = false
          }
        },
      }
    })
  end
}
