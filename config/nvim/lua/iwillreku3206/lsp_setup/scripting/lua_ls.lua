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
          library = { "/home/rek/CC-Tweaked-EmmyLua" },
        },
        telemetry = {
          enable = false,
        },
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
    root_dir = lsp.util.root_pattern('.git', vim.fn.getcwd()),
    before_init = require('neodev').before_init
  })
end

return setup
