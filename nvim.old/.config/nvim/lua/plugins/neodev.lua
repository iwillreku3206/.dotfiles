return {
  {
    "folke/neodev.nvim",
    lazy = true,
    ft = "lua",
    config = function()
      require('neodev').setup {}
    end,
  },
}
