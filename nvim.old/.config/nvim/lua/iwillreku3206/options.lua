vim.wo.number = true
vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('title', true)
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_set_option('cc', '80')
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.lsp.buf.format()
  end
})
vim.cmd('set updatetime=50')

vim.cmd('let g:pandoc#modules#disabled = ["spell", "folding"]')

vim.cmd([[
filetype on
filetype plugin on
filetype indent on

function Set80Col() abort
  set textwidth=0
  set wrapmargin=0
  set wrap
  set linebreak
  set columns=80
endfunction

command -nargs=0 Set80Col :call Set80Col()

]])
