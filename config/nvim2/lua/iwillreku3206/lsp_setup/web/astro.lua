local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  -- write a function to find the path of tsserver
  local h = io.popen('/bin/bash -c "which node"', "r")
  local node_path = h:read()
  local node_prefix = node_path.gsub(node_path, 'bin/node', 'lib/node_modules')

  lsp.astro.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      typescript = {
        serverPath = node_prefix .. '/typescript/lib/tsserverlibrary.js'
      }
    }
  })

  h = nil
end

return setup
