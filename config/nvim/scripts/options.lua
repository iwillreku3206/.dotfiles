vim.wo.number = true
vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('title', true)
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.lsp.buf.format() 
  end
})
