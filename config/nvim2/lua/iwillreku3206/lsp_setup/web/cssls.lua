local function setup(lsp, capabilities, on_attach)
  -- Setup the LSP here. The file name of the script should be the same name as the lSP.
lsp.cssls.setup({
  settings = {
    css = {
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

end

return setup
