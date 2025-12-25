return {
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup(
        {
          replace_netrw = true,
          ui = {
            border = "none",
            height = 0.95,
            width = 1,
            x = 0,
            y = 0,
          }
        }
      )
      vim.keymap.set("n", "<leader>fm", function()
        require("ranger-nvim").open(true)
      end, {
        noremap = true,
      })
    end,
  }
}
