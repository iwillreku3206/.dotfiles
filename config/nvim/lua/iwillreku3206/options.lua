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
    vim.schedule(function()
    
    vim.lsp.buf.format()
    end)
  end
})
vim.cmd('set updatetime=50')
vim.g.mkdp_auto_close = 0
vim.g.mkdp_highlight_css = '/Users/rek/.dotfiles/pandoc/pandoc.css'
vim.g.mkdp_filetypes = { 'markdown', 'pandoc' }
vim.g.mkdp_browserfunc = 'OpenInElectron'

vim.g.instant_markdown_mathjax = 1
vim.g.instant_markdown_browser = 'electron'
vim.cmd('let g:pandoc#modules#disabled = ["spell", "folding"]')

vim.cmd([[
filetype on
filetype plugin on
filetype indent on
]])
