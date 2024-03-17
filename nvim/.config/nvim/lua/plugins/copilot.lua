return {
  {
    'zbirenbaum/copilot.lua',
    lazy = true,
    event = "InsertEnter",
    cmd = "Copilot",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = true, auto_trigger = true }
      }
    end
  }
}
