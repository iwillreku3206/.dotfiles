
local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
  lsp.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
end

return setup
