return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = "Trouble",
  config = function()
    require("trouble").setup {}
  end
}
