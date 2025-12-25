return {
  {
    'edluffy/hologram.nvim',
    config = function()
      require('hologram').setup { auto_display = true }
    end
  },
  {
    'https://github.com/adelarsq/image_preview.nvim',
    event = 'VeryLazy',
    config = function()
      require("image_preview").setup()
    end
  },
}
