local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

configs.protobuf_language_server = {
  default_config = {
    cmd = { 'protobuf-language-server' },
    filetypes = { 'proto', 'cpp' },
    root_dir = util.root_pattern('.git'),
    single_file_support = true,
    settings = {},
  }
}

local function setup(lsp, capabilities, on_attach)
  lsp.protobuf_language_server.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

return setup
