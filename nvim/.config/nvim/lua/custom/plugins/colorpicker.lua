return {
  {
    "KabbAmine/vCoolor.vim",
    config = function()
      vim.keymap.set("n", "<leader>cpr", ":VCoolIns r<CR>", { noremap = true })
      vim.keymap.set("n", "<leader>cph", ":VCoolIns h<CR>", { noremap = true })
      vim.keymap.set("n", "<leader>cpa", ":VCoolIns ra<CR>", { noremap = true })
    end,
    lazy = true
  },
}
