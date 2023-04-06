local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  -- write a function to find the path of tsserver
  local h = io.popen('/bin/bash -c "npm root -g"', "r")

  lsp.astro.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      typescript = {
        serverPath = h:read() .. '/typescript/lib/tsserverlibrary.js'
      }
    }
  })

  h = nil

end

return setup
