
local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = { vim.api.nvim_get_runtime_file("", true), "/home/rek/CC-Tweaked-EmmyLua" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})


end

return setup
