return {
  {
    'fatih/vim-go',
    build = function()
      vim.cmd('GoInstallBinaries')
    end,
    lazy = true,
    ft = "go"
  },
}
