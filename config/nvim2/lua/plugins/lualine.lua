return {
  {
    'nvim-lualine/lualine.nvim',
    config = function ()
      
  require('lualine').setup {
    options = {
      theme = 'powerline_dark'
    }
  }
    end,
  },

}
