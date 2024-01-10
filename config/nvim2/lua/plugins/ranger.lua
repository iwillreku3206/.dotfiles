return {
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.keymap.set("n", "<leader>fm", function()
        require("ranger-nvim").open(true)
      end, {
        noremap = true,
      })
    end,
  }
}
