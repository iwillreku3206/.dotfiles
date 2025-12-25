return {
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd('colorscheme dracula')
    end,
    priority = 99
  },
  {
    'folke/tokyonight.nvim',
    priority = 99
  },
  'tomasiser/vim-code-dark',
}
