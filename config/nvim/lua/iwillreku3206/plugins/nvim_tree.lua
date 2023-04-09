local function config()
  require('nvim-tree').setup {
    git = { ignore = false },
    remove_keymaps = { "f" }
  }
end

return {
  config = config
}
